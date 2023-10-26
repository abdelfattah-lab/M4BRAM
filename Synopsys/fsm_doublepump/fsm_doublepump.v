// M4BRAM instruction format using byte-enable
// If in_clear == 1:
//     byte_en = {input_sign, input_precision [2:0]};
// else:
//     byte_en = {reset, start, copy, done};

module fsm_doublepump (
  input  logic               clk,
  input  logic               reset,                // Global BRAM reset
  input  logic               cim_en,               // 1'b1 if M20K is in cim mode, 1'b0 otherwise   
  input  logic               in_clear,             // rewrite M4BRAM's input sign & precision 
  input  logic [31:0]        data,                 // 32-bit write data that contains 4 8-bit data
  input  logic [3:0]         byte_en,              // 4-bit byte-enable that stores control signals during CIM mode

  // output logic [1:0]         w_prec,               // Weight precision
  // output logic [1:0]         dp_factor             // Duplication factor 

  output logic               carry_in,             // Adder carry in, '0' for addition, '1' for subtraction
  output logic               ren_1_dummy,          // Dummy array read port 1 enable
  output logic               ren_2_dummy,          // Dummy array read port 2 enable
  output logic               wen_1_dummy,          // Dummy array write port 1 enable
  output logic               wen_2_dummy,          // Dummy array write port 2 enable

  // We have 4 dummy arrays [3:0], each controlled by 3-bit address [2:0]
  output logic [2:0]         raddr_1_dummy [3:0],  // Dummy array read address 1
  output logic [2:0]         raddr_2_dummy,        // Dummy array 1&2 read address 2
  output logic [2:0]         waddr_1_dummy,        // Dummy array write address 1
  output logic [2:0]         waddr_2_dummy,        // Dummy array write address 2

  output logic               wsel_1_dummy,         // Dummy array write mux sel 1
  output logic [1:0]         wsel_2_dummy,         // Dummy array write mux sel 2  

  output logic               readout_dummy         // Specify if read out dummy array accumulator
);

  logic [3:0] ctrl_flag;     // 4-bit control information from byte_en

  logic       i_sign;        // Input sign
  logic [3:0] i_prec;        // Input precision

  logic       reset_dummy;   // If enable, then reset M4BRAM's accumulator
  logic       start_dummy;   // If enable, then start the MAC operation
  logic       copy_dummy;    // If enable, then copy the main BRAM data
  logic       done_dummy;    // If enable, then finish the current dot product and read out the dummy array's accumulator

  logic [7:0] input_act_buf [3:0]; // Buffered input activation (4 x 8-bit)
  logic [7:0] input_act [3:0];     // Real input activation (4 x 8-bit)

  genvar i;

  //----------------------------------------------------------------------
  // Control and Data Preparation
  //----------------------------------------------------------------------
  generate
    for (i = 0; i < 4; i=i+1) 
    begin
      assign input_act_buf[i] = data[i*8 + 7 : i*8];
    end
  endgenerate

  always_comb begin
    if (cim_en && ~in_clear) begin
      ctrl_flag = byte_en;
    end else begin
      ctrl_flag = 4'h0;
    end
  end

  assign {reset_dummy, start_dummy, copy_dummy, done_dummy} = ctrl_flag;

  always_ff @( posedge clk ) begin 
    if ( reset ) begin 
      i_sign <= 1'b0;
      i_prec <= 4'd0;
    end else if ( cim_en && in_clear ) begin
      i_sign <= byte_en[3];
      i_prec <= 1 + byte_en[2:0];
    end
  end

  // Buffered input activations
  always_ff @( posedge clk ) begin 
    if ( reset ) begin 
      input_act <= '{4{8'd0}};
    end else if ( copy_dummy ) begin
      input_act <= input_act_buf;
    end
  end

  //----------------------------------------------------------------------
  // State Definitions
  //----------------------------------------------------------------------
  localparam STATE_IDLE     = 4'd0;  // Idle state, disable dummy array
  localparam STATE_INIT_ACC = 4'd1;  // Initialize accumulator to 0. 
  localparam STATE_INIT_W1  = 4'd2;  // Copy W1 and W2 of the first MAC2
  localparam STATE_INIT_BUB = 4'd3;  // Bubble state during initialization to sync the main BRAM and dummy array
  // Note that in M4BRAM we are only using one port of main BRAM to copy W1 and W2 to the double-pumped dummy array.
  // Therefore, we use STATE_ADD to copy W1 and STATE_COPY_W2 to copy W2.
  // Furthermore, we need a one-cycle delayed register to hold input activation for two cycles 
  localparam STATE_COPY_W2  = 4'd4;  // Bubble state used to copy W2 from main BRAM                         
  localparam STATE_PREADD   = 4'd5;  // Pre-add W1 and W2 in dummy array, also initialize Psum to 0
  localparam STATE_INV      = 4'd6;  // Inverting a row depending on the input activations
  localparam STATE_SUB      = 4'd7;  // Subtracting the inverted row from Psum
  localparam STATE_ASL      = 4'd8;  // Add-shift-left a row to psum depending on the input activations
  localparam STATE_ADD      = 4'd9;  // Add a row to psum depending on the input activations
  localparam STATE_ACC      = 4'd10; // Add psum to accumulator
  localparam STATE_DONE_BUB = 4'd11; // Bubble done state
  localparam STATE_DONE     = 4'd12; // BDone, read out accumulator
  
  //----------------------------------------------------------------------
  // State
  //----------------------------------------------------------------------
  logic [3:0] state_now, state_next;
  logic [3:0] counter_now, counter_next;

  always_ff @( posedge clk ) begin
    if ( reset_dummy || reset ) begin
      state_now    <= STATE_IDLE;
      counter_now  <= 0;
    end
    else begin
      state_now    <= state_next;
      counter_now  <= counter_next;
    end
  end

  //----------------------------------------------------------------------
  // Update Input Activations 
  //----------------------------------------------------------------------
  logic read_input_1, read_input_2;
  logic shift_input;
  
  assign read_input_1 = ((state_now == STATE_INIT_W1) || (state_now == STATE_ADD) || (state_now == STATE_DONE_BUB)) && copy_dummy;
  assign read_input_2 = (state_now == STATE_COPY_W2);
  assign shift_input  = (state_now == STATE_SUB) || (state_now == STATE_ASL);

  logic [7:0] input_1 [3:0];
  logic [7:0] input_2 [3:0];

  always_ff @( posedge clk ) begin
    if ( reset_dummy || reset ) begin
      for (int j = 0; j < 4; j = j+1) 
      begin
        input_1[j] <= 8'd0;
        input_2[j] <= 8'd0;
      end 
    end else begin 
      if ( read_input_1 ) begin           // load input 1
        for (int j = 0; j < 4; j = j+1) begin
          input_1[j] <= input_act[j];
        end 
      end else if ( read_input_2 ) begin  // load input 2
        for (int j = 0; j < 4; j = j+1) begin
          input_2[j] <= input_act[j];
        end     
      end else if ( shift_input ) begin   // input stream shift 1-bit
        for (int j = 0; j < 4; j = j+1) begin
          input_1[j] <= input_1[j] << 1'b1;
          input_2[j] <= input_2[j] << 1'b1;
        end 
      end
    end
  end

  // Current MSB from input_1 and input_2, i.e. activation decoder
  logic [2:0] act_dec [3:0]; 

  generate
    for (i = 0; i < 4; i = i+1) begin
      assign act_dec[i] = {1'b0, input_2[i][7], input_1[i][7]};
    end
  endgenerate

  //----------------------------------------------------------------------
  // State Transitions
  //----------------------------------------------------------------------
  always_comb begin
    // State transition logic
    case ( state_now )
      STATE_IDLE: 
        begin
          if ( start_dummy ) begin    
            state_next    = STATE_INIT_ACC;
          end else begin
            state_next    = STATE_IDLE;
          end
          counter_next   = 0;
        end
      STATE_INIT_ACC: 
        begin
          state_next    = STATE_INIT_W1;
          counter_next  = 0;
        end
      STATE_INIT_W1: 
        begin
          state_next    = STATE_INIT_BUB;
          counter_next  = 0;
        end
      STATE_INIT_BUB: 
        begin
          state_next    = STATE_COPY_W2;
          counter_next  = 0;
        end
      STATE_COPY_W2: 
        begin
          state_next    = STATE_PREADD;
          counter_next  = 0;
        end
      STATE_PREADD: 
        begin
          if ( i_sign == 1'b1 ) begin
            state_next    = STATE_INV;
          end else begin
            state_next    = STATE_ASL;
          end
          counter_next  = counter_now + 1;
        end
      STATE_INV: 
        begin
          state_next    = STATE_SUB;
          counter_next  = counter_now + 1;
        end
      STATE_SUB: 
        begin
          if ( counter_now < i_prec ) begin
            state_next    = STATE_ASL;
          end else begin
            state_next    = STATE_ADD;
          end
          counter_next  = counter_now + 1;
        end
      STATE_ASL: 
        begin
          if ( counter_now < i_prec ) begin
            state_next    = STATE_ASL;
          end else begin
            state_next    = STATE_ADD;
          end
          counter_next  = counter_now + 1;
        end
      STATE_ADD: 
        begin
          state_next    = STATE_ACC;
          counter_next  = counter_now + 1;
        end
      STATE_ACC: 
        begin
          if ( done_dummy ) begin  
            state_next    = STATE_DONE_BUB;
          end else begin
            state_next    = STATE_COPY_W2;
          end
          counter_next  = 0;
        end
      STATE_DONE_BUB: 
        begin          
          state_next    = STATE_DONE;
          counter_next  = 0;
        end
      STATE_DONE: 
        begin
          if ( reset_dummy ) begin 
            state_next    = STATE_IDLE;
          end else if (start_dummy) begin
            state_next    = STATE_COPY_W2;
          end else begin            
            state_next    = STATE_DONE;
          end 
          counter_next  = 0;
        end
      default: 
        begin
          state_next    = STATE_IDLE;
          counter_next  = 0;
        end
    endcase
  end

  //----------------------------------------------------------------------
  // State Outputs
  //----------------------------------------------------------------------
  function void cs
    (
      input logic       cs_carry_in,
      input logic       cs_ren_1_dummy,
      input logic       cs_ren_2_dummy,
      input logic       cs_wen_1_dummy,
      input logic       cs_wen_2_dummy,
      input logic [2:0] cs_raddr_1_dummy [3:0],
      input logic [2:0] cs_raddr_2_dummy,
      input logic [2:0] cs_waddr_1_dummy,
      input logic [2:0] cs_waddr_2_dummy,
      input logic       cs_wsel_1_dummy,
      input logic [1:0] cs_wsel_2_dummy,
      input logic       cs_readout_dummy
    );
    begin
      carry_in         = cs_carry_in;
      ren_1_dummy      = cs_ren_1_dummy;
      ren_2_dummy      = cs_ren_2_dummy;
      wen_1_dummy      = cs_wen_1_dummy;
      wen_2_dummy      = cs_wen_2_dummy;
      raddr_1_dummy    = cs_raddr_1_dummy;
      raddr_2_dummy    = cs_raddr_2_dummy;
      waddr_1_dummy    = cs_waddr_1_dummy;
      waddr_2_dummy    = cs_waddr_2_dummy;
      wsel_1_dummy     = cs_wsel_1_dummy;
      wsel_2_dummy     = cs_wsel_2_dummy;
      readout_dummy    = cs_readout_dummy;
    end
  endfunction
  
  // Local parameters for dummy array row address
  localparam [2:0] addr_x_v    [3:0]  = '{4{3'bx}};
  localparam [2:0] addr_w1_v   [3:0]  = '{4{3'd1}};
  localparam [2:0] addr_w2_v   [3:0]  = '{4{3'd2}};
  localparam [2:0] addr_w12_v  [3:0]  = '{4{3'd3}};
  localparam [2:0] addr_inv_v  [3:0]  = '{4{3'd4}};
  localparam [2:0] addr_psum_v [3:0]  = '{4{3'd5}};
  localparam [2:0] addr_acc_v  [3:0]  = '{4{3'd6}};

  localparam [2:0] addr_x     = 3'bx;
  localparam [2:0] addr_w1    = 3'd1;
  localparam [2:0] addr_w2    = 3'd2;
  localparam [2:0] addr_w12   = 3'd3;
  localparam [2:0] addr_inv   = 3'd4;
  localparam [2:0] addr_psum  = 3'd5;
  localparam [2:0] addr_acc   = 3'd6;

  localparam sel_0     = 2'b0;
  localparam sel_inv   = 2'd0;
  localparam sel_ram   = 2'd1;
  localparam sel_sum   = 1'd0;
  localparam sel_sumr  = 1'd1;

  // Set outputs using a control signal "table"

  always_comb begin
    case ( state_now ) 
      //                        carry   ren  ren  wen  wen  raddr1       raddr2     waddr       waddr     wsel      wsel     read_acc
      //                           in    1    2    1    2    dummy        dummy        1          2        1         2          dummy
      STATE_IDLE:            cs(   0,    0,   0,   0,   0,  addr_x_v,    addr_x,    addr_x,    addr_x,    2'bx,     2'bx,     0   );
      STATE_INIT_ACC:        cs(   0,    0,   0,   0,   1,  addr_x_v,    addr_x,    addr_x,    addr_acc,  2'bx,     sel_0,    0   );
      STATE_INIT_W1:         cs(   0,    0,   0,   0,   1,  addr_x_v,    addr_x,    addr_x,    addr_w1,   2'bx,     sel_ram,  0   );
      STATE_INIT_BUB:        cs(   0,    0,   0,   0,   0,  addr_x_v,    addr_x,    addr_x,    addr_x,    2'bx,     2'bx,     0   );
      STATE_COPY_W2:         cs(   0,    0,   0,   0,   1,  addr_x_v,    addr_x,    addr_w1,   addr_w2,   2'bx,     sel_ram,  0   );

      STATE_PREADD:          cs(   0,    1,   1,   1,   1,  addr_w1_v,   addr_w2,   addr_w12,  addr_psum, sel_sum,  sel_0,    0   );
      STATE_INV:             cs(   0,    1,   0,   0,   1,  act_dec,     addr_x,    addr_x,    addr_inv,  2'bx,     sel_inv,  0   );
      STATE_SUB:             cs(   1,    1,   1,   1,   0,  addr_inv_v,  addr_psum, addr_psum, addr_x,    sel_sum,  2'bx,     0   );
      STATE_ASL:             cs(   0,    1,   1,   1,   0,  act_dec,     addr_psum, addr_psum, addr_x,    sel_sumr, 2'bx,     0   );
      STATE_ADD:             
        if ( copy_dummy )    cs(   0,    1,   1,   1,   1,  act_dec,     addr_psum, addr_psum, addr_w1,   sel_sum,  sel_ram,  0   );
        else                 cs(   0,    1,   1,   1,   0,  act_dec,     addr_psum, addr_psum, addr_x,    sel_sum,  2'bx,     0   );
      STATE_ACC:             cs(   0,    1,   1,   1,   0,  addr_psum_v, addr_acc,  addr_acc,  addr_x,    sel_sum,  2'bx,     0   );
      
      STATE_DONE_BUB:        cs(   0,    0,   0,   0,   0,  addr_x_v,    addr_x,    addr_x,    addr_x,    2'bx,     2'bx,     0   );
      STATE_DONE:          
        if ( start_dummy )   cs(   0,    0,   1,   0,   1,  addr_x_v,    addr_acc,  addr_x,    addr_acc,  2'bx,     sel_0,    1   );
        else                 cs(   0,    0,   1,   0,   0,  addr_x_v,    addr_acc,  addr_x,    addr_x,    2'bx,     2'bx,     1   );

      default                cs(   0,    0,   0,   0,   0,  addr_x_v,    addr_x,    addr_x,    addr_x,    2'bx,     2'bx,     0   );
    endcase
  end

endmodule