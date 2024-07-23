module Lowpass_st (clk, 
              rst, 
              data_in, 
              clk_en, 
              fir_result, 
              rdy_to_ld, 
              done); 
parameter DATA_WIDTH  = 16;
parameter COEF_WIDTH  = 15;
parameter ACCUM_WIDTH = 38;

parameter MSB_RM = 0;
parameter LSB_RM = 22;
parameter WIDTH_SAT = ACCUM_WIDTH-LSB_RM;
 input clk, rst;
 input [DATA_WIDTH-1:0] data_in;
input clk_en; 
 output rdy_to_ld;
 output done;
output [ACCUM_WIDTH-MSB_RM-LSB_RM-1:0] fir_result;
wire [29:0] fir_res_0_n;
wire temp_0_1_n;
wire temp_0_2_n;
Lowpass_st_u U0_n (.clk(clk),
                       .rst(rst),
                       .data_in(data_in[7:0]),
                       .clk_en(clk_en),
                       .fir_result(fir_res_0_n),
                       .rdy_to_ld(temp_0_1_n),
                       .done(temp_0_2_n)
);
wire [29:0] fir_res_1_n;
Lowpass_st_s U1_n (.clk(clk),
                       .rst(rst),
                       .data_in(data_in[15:8]),
                       .clk_en(clk_en),
                       .fir_result(fir_res_1_n),
                       .rdy_to_ld(rdy_to_ld),
                       .done(done)
 );
wire [7:0] mbs_fill_lt_0_n;
wire [37:0] mbs_fill_0_n;
assign mbs_fill_lt_0_n[0] = 1'b0;
assign mbs_fill_lt_0_n[1] = 1'b0;
assign mbs_fill_lt_0_n[2] = 1'b0;
assign mbs_fill_lt_0_n[3] = 1'b0;
assign mbs_fill_lt_0_n[4] = 1'b0;
assign mbs_fill_lt_0_n[5] = 1'b0;
assign mbs_fill_lt_0_n[6] = 1'b0;
assign mbs_fill_lt_0_n[7] = 1'b0;
assign mbs_fill_0_n = {mbs_fill_lt_0_n, fir_res_0_n};
wire [7:0] mbs_fill_rt_1_n;
wire [37:0] mbs_fill_1_n;
assign mbs_fill_rt_1_n = 8'd0;
assign mbs_fill_1_n = {fir_res_1_n, mbs_fill_rt_1_n};
wire [38:0] mbs_atree_l_0_n_0_n;
sadd_lpm_cen Uadd_l_0_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(mbs_fill_0_n), .bin(mbs_fill_1_n), .res(mbs_atree_l_0_n_0_n) );
defparam Uadd_l_0_n_0_n.IN_WIDTH = 38;
defparam Uadd_l_0_n_0_n.PIPE_DEPTH = 1;

wire [38:0] mbs_atree_res;
assign mbs_atree_res=mbs_atree_l_0_n_0_n;
wire [37:0] fir_int_res;
assign fir_int_res = mbs_atree_res[ACCUM_WIDTH-1:0];
wire [37:0]fir_int_res_fill;
assign fir_int_res_fill =  fir_int_res[37 :0];
parameter TOT_WIDTH = ACCUM_WIDTH;
wire [TOT_WIDTH-LSB_RM-1:0] fir_res_rnd;
rnd_dat Urnd(.data_in(fir_int_res_fill[TOT_WIDTH-1:0]), .data_out(fir_res_rnd));
defparam Urnd.IN_WIDTH = TOT_WIDTH;
defparam Urnd.LOSE_BITS = LSB_RM;
assign fir_result = fir_res_rnd[TOT_WIDTH-LSB_RM-MSB_RM-1:0];

endmodule
