// Generated by FIR Compiler
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2005 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.
// 00
// altera message_off 10036
(* altera_attribute = "-name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410" *)
module Lowpass_st_s (clk, 
              rst, 
              data_in, 
              clk_en, 
              rdy_to_ld, 
              done, 
              fir_result); 
parameter DATA_WIDTH  = 8;
parameter COEF_WIDTH  = 15;
parameter ACCUM_WIDTH = 30;

input clk, rst;
input [DATA_WIDTH-1:0] data_in;
input clk_en;
output rdy_to_ld;
wire rdy_to_ld;
wire rdy_int;
wire data_ld;
output done;
wire done;
wire done_int;
output [ACCUM_WIDTH-1:0] fir_result;
wire tdl_ld;
wire sa_rst;
wire sa_inv;
wire pre_rdy;
wire sym_rst;
wire addr_low;
assign addr_low = 1'b0;
wire ser_eab_0_n;
wire ser_eab_1_n;
wire ser_eab_2_n;
wire ser_eab_3_n;
wire ser_eab_4_n;
wire ser_eab_5_n;
wire [DATA_WIDTH : 0]data_ee;
assign data_ee = {data_in[DATA_WIDTH -1],data_in}; 
wire ser_dat_0_n;
par_ld_ser_tdl_nc Utdl_0_a(.clk(clk), .clk_en(clk_en), .rst(rst), .data_in(data_ee), .tdl_ld(pre_rdy),.data_out(ser_eab_0_n) );
defparam Utdl_0_a.WIDTH = 9;
wire ser_dat_1_n;
wire ser_dat_2_n;
wire ser_dat_3_n;
wire ser_dat_4_n;
wire ser_dat_5_n;
wire ser_dat_6_n;
wire ser_dat_7_n;
wire ser_dat_8_n;
wire ser_dat_9_n;
wire ser_dat_10_n;
wire ser_dat_11_n;
wire ser_dat_12_n;
wire ser_dat_13_n;
wire ser_dat_14_n;
wire ser_dat_15_n;
wire ser_dat_16_n;
wire [15:0]tdl_data_0_n;
lc_tdl_strat_cen Utdl_0_n (
  .clk(clk),
  .clk_en(clk_en),
  .data_ld(data_ld),
  .rst(rst),
  .data_in(ser_eab_0_n),
  .data_out(tdl_data_0_n),
  .ntdl(ser_eab_1_n) 
);
defparam Utdl_0_n.CORE_WIDTH = 16;
defparam Utdl_0_n.DEPTH = 9;
defparam Utdl_0_n.DEPTH_ADDR = 4;
defparam Utdl_0_n.WIDTH = 9;
wire ser_dat_17_n;
wire ser_dat_18_n;
wire ser_dat_19_n;
wire ser_dat_20_n;
wire ser_dat_21_n;
wire ser_dat_22_n;
wire ser_dat_23_n;
wire ser_dat_24_n;
wire ser_dat_25_n;
wire ser_dat_26_n;
wire ser_dat_27_n;
wire ser_dat_28_n;
wire ser_dat_29_n;
wire ser_dat_30_n;
wire ser_dat_31_n;
wire ser_dat_32_n;
wire [15:0]tdl_data_1_n;
lc_tdl_strat_cen Utdl_1_n (
  .clk(clk),
  .clk_en(clk_en),
  .data_ld(data_ld),
  .rst(rst),
  .data_in(ser_eab_1_n),
  .data_out(tdl_data_1_n),
  .ntdl(ser_eab_2_n) 
);
defparam Utdl_1_n.CORE_WIDTH = 16;
defparam Utdl_1_n.DEPTH = 9;
defparam Utdl_1_n.DEPTH_ADDR = 4;
defparam Utdl_1_n.WIDTH = 9;
wire ser_dat_33_n;
wire ser_dat_34_n;
wire ser_dat_35_n;
wire ser_dat_36_n;
wire ser_dat_37_n;
wire ser_dat_38_n;
wire ser_dat_39_n;
wire ser_dat_40_n;
wire ser_dat_41_n;
wire ser_dat_42_n;
wire ser_dat_43_n;
wire ser_dat_44_n;
wire ser_dat_45_n;
wire ser_dat_46_n;
wire ser_dat_47_n;
wire ser_dat_48_n;
wire [15:0]tdl_data_2_n;
lc_tdl_strat_cen Utdl_2_n (
  .clk(clk),
  .clk_en(clk_en),
  .data_ld(data_ld),
  .rst(rst),
  .data_in(ser_eab_2_n),
  .data_out(tdl_data_2_n),
  .ntdl(ser_eab_3_n) 
);
defparam Utdl_2_n.CORE_WIDTH = 16;
defparam Utdl_2_n.DEPTH = 9;
defparam Utdl_2_n.DEPTH_ADDR = 4;
defparam Utdl_2_n.WIDTH = 9;
wire ser_dat_49_n;
wire ser_dat_50_n;
wire ser_dat_51_n;
wire ser_dat_52_n;
wire ser_dat_53_n;
wire ser_dat_54_n;
wire ser_dat_55_n;
wire ser_dat_56_n;
wire ser_dat_57_n;
wire ser_dat_58_n;
wire ser_dat_59_n;
wire ser_dat_60_n;
wire ser_dat_61_n;
wire ser_dat_62_n;
wire ser_dat_63_n;
wire ser_dat_64_n;
wire [15:0]tdl_data_3_n;
lc_tdl_strat_cen Utdl_3_n (
  .clk(clk),
  .clk_en(clk_en),
  .data_ld(data_ld),
  .rst(rst),
  .data_in(ser_eab_3_n),
  .data_out(tdl_data_3_n),
  .ntdl(ser_eab_4_n) 
);
defparam Utdl_3_n.CORE_WIDTH = 16;
defparam Utdl_3_n.DEPTH = 9;
defparam Utdl_3_n.DEPTH_ADDR = 4;
defparam Utdl_3_n.WIDTH = 9;
wire ser_dat_65_n;
wire ser_dat_66_n;
wire ser_dat_67_n;
wire ser_dat_68_n;
wire ser_dat_69_n;
wire ser_dat_70_n;
wire ser_dat_71_n;
wire ser_dat_72_n;
wire ser_dat_73_n;
wire ser_dat_74_n;
wire ser_dat_75_n;
wire ser_dat_76_n;
wire ser_dat_77_n;
wire ser_dat_78_n;
wire [15:0]tdl_data_4_n;
lc_tdl_strat_cen Utdl_4_n (
  .clk(clk),
  .clk_en(clk_en),
  .data_ld(data_ld),
  .rst(rst),
  .data_in(ser_eab_4_n),
  .data_out(tdl_data_4_n),
  .ntdl(ser_eab_5_n) 
);
defparam Utdl_4_n.CORE_WIDTH = 16;
defparam Utdl_4_n.DEPTH = 9;
defparam Utdl_4_n.DEPTH_ADDR = 4;
defparam Utdl_4_n.WIDTH = 9;
sym_add_ser_cen sym_0_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(ser_eab_0_n),.b_in(tdl_data_4_n[13]),.data_out(ser_dat_0_n));
defparam sym_0_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_1_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[0]),.b_in(tdl_data_4_n[12]),.data_out(ser_dat_1_n));
defparam sym_1_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_2_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[1]),.b_in(tdl_data_4_n[11]),.data_out(ser_dat_2_n));
defparam sym_2_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_3_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[2]),.b_in(tdl_data_4_n[10]),.data_out(ser_dat_3_n));
defparam sym_3_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_4_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[3]),.b_in(tdl_data_4_n[9]),.data_out(ser_dat_4_n));
defparam sym_4_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_5_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[4]),.b_in(tdl_data_4_n[8]),.data_out(ser_dat_5_n));
defparam sym_5_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_6_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[5]),.b_in(tdl_data_4_n[7]),.data_out(ser_dat_6_n));
defparam sym_6_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_7_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[6]),.b_in(tdl_data_4_n[6]),.data_out(ser_dat_7_n));
defparam sym_7_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_8_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[7]),.b_in(tdl_data_4_n[5]),.data_out(ser_dat_8_n));
defparam sym_8_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_9_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[8]),.b_in(tdl_data_4_n[4]),.data_out(ser_dat_9_n));
defparam sym_9_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_10_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[9]),.b_in(tdl_data_4_n[3]),.data_out(ser_dat_10_n));
defparam sym_10_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_11_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[10]),.b_in(tdl_data_4_n[2]),.data_out(ser_dat_11_n));
defparam sym_11_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_12_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[11]),.b_in(tdl_data_4_n[1]),.data_out(ser_dat_12_n));
defparam sym_12_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_13_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[12]),.b_in(tdl_data_4_n[0]),.data_out(ser_dat_13_n));
defparam sym_13_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_14_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[13]),.b_in(tdl_data_3_n[15]),.data_out(ser_dat_14_n));
defparam sym_14_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_15_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[14]),.b_in(tdl_data_3_n[14]),.data_out(ser_dat_15_n));
defparam sym_15_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_16_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_0_n[15]),.b_in(tdl_data_3_n[13]),.data_out(ser_dat_16_n));
defparam sym_16_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_17_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[0]),.b_in(tdl_data_3_n[12]),.data_out(ser_dat_17_n));
defparam sym_17_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_18_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[1]),.b_in(tdl_data_3_n[11]),.data_out(ser_dat_18_n));
defparam sym_18_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_19_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[2]),.b_in(tdl_data_3_n[10]),.data_out(ser_dat_19_n));
defparam sym_19_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_20_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[3]),.b_in(tdl_data_3_n[9]),.data_out(ser_dat_20_n));
defparam sym_20_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_21_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[4]),.b_in(tdl_data_3_n[8]),.data_out(ser_dat_21_n));
defparam sym_21_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_22_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[5]),.b_in(tdl_data_3_n[7]),.data_out(ser_dat_22_n));
defparam sym_22_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_23_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[6]),.b_in(tdl_data_3_n[6]),.data_out(ser_dat_23_n));
defparam sym_23_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_24_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[7]),.b_in(tdl_data_3_n[5]),.data_out(ser_dat_24_n));
defparam sym_24_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_25_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[8]),.b_in(tdl_data_3_n[4]),.data_out(ser_dat_25_n));
defparam sym_25_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_26_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[9]),.b_in(tdl_data_3_n[3]),.data_out(ser_dat_26_n));
defparam sym_26_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_27_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[10]),.b_in(tdl_data_3_n[2]),.data_out(ser_dat_27_n));
defparam sym_27_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_28_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[11]),.b_in(tdl_data_3_n[1]),.data_out(ser_dat_28_n));
defparam sym_28_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_29_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[12]),.b_in(tdl_data_3_n[0]),.data_out(ser_dat_29_n));
defparam sym_29_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_30_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[13]),.b_in(tdl_data_2_n[15]),.data_out(ser_dat_30_n));
defparam sym_30_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_31_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[14]),.b_in(tdl_data_2_n[14]),.data_out(ser_dat_31_n));
defparam sym_31_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_32_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_1_n[15]),.b_in(tdl_data_2_n[13]),.data_out(ser_dat_32_n));
defparam sym_32_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_33_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_2_n[0]),.b_in(tdl_data_2_n[12]),.data_out(ser_dat_33_n));
defparam sym_33_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_34_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_2_n[1]),.b_in(tdl_data_2_n[11]),.data_out(ser_dat_34_n));
defparam sym_34_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_35_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_2_n[2]),.b_in(tdl_data_2_n[10]),.data_out(ser_dat_35_n));
defparam sym_35_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_36_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_2_n[3]),.b_in(tdl_data_2_n[9]),.data_out(ser_dat_36_n));
defparam sym_36_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_37_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_2_n[4]),.b_in(tdl_data_2_n[8]),.data_out(ser_dat_37_n));
defparam sym_37_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_38_n(.gclk_en(clk_en), .rst(sym_rst), .clk(clk),.a_in(tdl_data_2_n[5]),.b_in(tdl_data_2_n[7]),.data_out(ser_dat_38_n));
defparam sym_38_n.DATA_WIDTH = 1;
sym_add_ser_cen sym_39_n(.gclk_en(clk_en), .clk(clk), .rst(sym_rst),.a_in(tdl_data_2_n[6]),.b_in(1'b0),.data_out(ser_dat_39_n));
defparam sym_39_n.DATA_WIDTH = 1;
// --- ROM LUTs ---- 
wire [17:0] lut_val_0_n;
rom_lut_r_cen Ur0_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_3_n,ser_dat_2_n,ser_dat_1_n,ser_dat_0_n } ), .data_out( lut_val_0_n[17:0]) ) ;
defparam Ur0_n.DATA_WIDTH = 18;
defparam Ur0_n.C0 = 18'd                   0;
defparam Ur0_n.C1 = 18'd               25217;
defparam Ur0_n.C2 = 18'd               25572;
defparam Ur0_n.C3 = 18'd               50789;
defparam Ur0_n.C4 = 18'd               25920;
defparam Ur0_n.C5 = 18'd               51137;
defparam Ur0_n.C6 = 18'd               51492;
defparam Ur0_n.C7 = 18'd               76709;
defparam Ur0_n.C8 = 18'd               26262;
defparam Ur0_n.C9 = 18'd               51479;
defparam Ur0_n.CA = 18'd               51834;
defparam Ur0_n.CB = 18'd               77051;
defparam Ur0_n.CC = 18'd               52182;
defparam Ur0_n.CD = 18'd               77399;
defparam Ur0_n.CE = 18'd               77754;
defparam Ur0_n.CF = 18'd              102971;
wire [17:0] lut_val_1_n;
rom_lut_r_cen Ur1_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_7_n,ser_dat_6_n,ser_dat_5_n,ser_dat_4_n } ), .data_out( lut_val_1_n[17:0]) ) ;
defparam Ur1_n.DATA_WIDTH = 18;
defparam Ur1_n.C0 = 18'd                   0;
defparam Ur1_n.C1 = 18'd               26597;
defparam Ur1_n.C2 = 18'd               26925;
defparam Ur1_n.C3 = 18'd               53522;
defparam Ur1_n.C4 = 18'd               27245;
defparam Ur1_n.C5 = 18'd               53842;
defparam Ur1_n.C6 = 18'd               54170;
defparam Ur1_n.C7 = 18'd               80767;
defparam Ur1_n.C8 = 18'd               27558;
defparam Ur1_n.C9 = 18'd               54155;
defparam Ur1_n.CA = 18'd               54483;
defparam Ur1_n.CB = 18'd               81080;
defparam Ur1_n.CC = 18'd               54803;
defparam Ur1_n.CD = 18'd               81400;
defparam Ur1_n.CE = 18'd               81728;
defparam Ur1_n.CF = 18'd              108325;
wire [17:0] lut_val_2_n;
rom_lut_r_cen Ur2_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_11_n,ser_dat_10_n,ser_dat_9_n,ser_dat_8_n } ), .data_out( lut_val_2_n[17:0]) ) ;
defparam Ur2_n.DATA_WIDTH = 18;
defparam Ur2_n.C0 = 18'd                   0;
defparam Ur2_n.C1 = 18'd               27863;
defparam Ur2_n.C2 = 18'd               28161;
defparam Ur2_n.C3 = 18'd               56024;
defparam Ur2_n.C4 = 18'd               28450;
defparam Ur2_n.C5 = 18'd               56313;
defparam Ur2_n.C6 = 18'd               56611;
defparam Ur2_n.C7 = 18'd               84474;
defparam Ur2_n.C8 = 18'd               28732;
defparam Ur2_n.C9 = 18'd               56595;
defparam Ur2_n.CA = 18'd               56893;
defparam Ur2_n.CB = 18'd               84756;
defparam Ur2_n.CC = 18'd               57182;
defparam Ur2_n.CD = 18'd               85045;
defparam Ur2_n.CE = 18'd               85343;
defparam Ur2_n.CF = 18'd              113206;
wire [17:0] lut_val_3_n;
rom_lut_r_cen Ur3_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_15_n,ser_dat_14_n,ser_dat_13_n,ser_dat_12_n } ), .data_out( lut_val_3_n[17:0]) ) ;
defparam Ur3_n.DATA_WIDTH = 18;
defparam Ur3_n.C0 = 18'd                   0;
defparam Ur3_n.C1 = 18'd               29005;
defparam Ur3_n.C2 = 18'd               29269;
defparam Ur3_n.C3 = 18'd               58274;
defparam Ur3_n.C4 = 18'd               29525;
defparam Ur3_n.C5 = 18'd               58530;
defparam Ur3_n.C6 = 18'd               58794;
defparam Ur3_n.C7 = 18'd               87799;
defparam Ur3_n.C8 = 18'd               29772;
defparam Ur3_n.C9 = 18'd               58777;
defparam Ur3_n.CA = 18'd               59041;
defparam Ur3_n.CB = 18'd               88046;
defparam Ur3_n.CC = 18'd               59297;
defparam Ur3_n.CD = 18'd               88302;
defparam Ur3_n.CE = 18'd               88566;
defparam Ur3_n.CF = 18'd              117571;
wire [17:0] lut_val_4_n;
rom_lut_r_cen Ur4_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_19_n,ser_dat_18_n,ser_dat_17_n,ser_dat_16_n } ), .data_out( lut_val_4_n[17:0]) ) ;
defparam Ur4_n.DATA_WIDTH = 18;
defparam Ur4_n.C0 = 18'd                   0;
defparam Ur4_n.C1 = 18'd               30010;
defparam Ur4_n.C2 = 18'd               30239;
defparam Ur4_n.C3 = 18'd               60249;
defparam Ur4_n.C4 = 18'd               30458;
defparam Ur4_n.C5 = 18'd               60468;
defparam Ur4_n.C6 = 18'd               60697;
defparam Ur4_n.C7 = 18'd               90707;
defparam Ur4_n.C8 = 18'd               30669;
defparam Ur4_n.C9 = 18'd               60679;
defparam Ur4_n.CA = 18'd               60908;
defparam Ur4_n.CB = 18'd               90918;
defparam Ur4_n.CC = 18'd               61127;
defparam Ur4_n.CD = 18'd               91137;
defparam Ur4_n.CE = 18'd               91366;
defparam Ur4_n.CF = 18'd              121376;
wire [17:0] lut_val_5_n;
rom_lut_r_cen Ur5_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_23_n,ser_dat_22_n,ser_dat_21_n,ser_dat_20_n } ), .data_out( lut_val_5_n[17:0]) ) ;
defparam Ur5_n.DATA_WIDTH = 18;
defparam Ur5_n.C0 = 18'd                   0;
defparam Ur5_n.C1 = 18'd               30870;
defparam Ur5_n.C2 = 18'd               31061;
defparam Ur5_n.C3 = 18'd               61931;
defparam Ur5_n.C4 = 18'd               31243;
defparam Ur5_n.C5 = 18'd               62113;
defparam Ur5_n.C6 = 18'd               62304;
defparam Ur5_n.C7 = 18'd               93174;
defparam Ur5_n.C8 = 18'd               31414;
defparam Ur5_n.C9 = 18'd               62284;
defparam Ur5_n.CA = 18'd               62475;
defparam Ur5_n.CB = 18'd               93345;
defparam Ur5_n.CC = 18'd               62657;
defparam Ur5_n.CD = 18'd               93527;
defparam Ur5_n.CE = 18'd               93718;
defparam Ur5_n.CF = 18'd              124588;
wire [17:0] lut_val_6_n;
rom_lut_r_cen Ur6_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_27_n,ser_dat_26_n,ser_dat_25_n,ser_dat_24_n } ), .data_out( lut_val_6_n[17:0]) ) ;
defparam Ur6_n.DATA_WIDTH = 18;
defparam Ur6_n.C0 = 18'd                   0;
defparam Ur6_n.C1 = 18'd               31576;
defparam Ur6_n.C2 = 18'd               31728;
defparam Ur6_n.C3 = 18'd               63304;
defparam Ur6_n.C4 = 18'd               31870;
defparam Ur6_n.C5 = 18'd               63446;
defparam Ur6_n.C6 = 18'd               63598;
defparam Ur6_n.C7 = 18'd               95174;
defparam Ur6_n.C8 = 18'd               32002;
defparam Ur6_n.C9 = 18'd               63578;
defparam Ur6_n.CA = 18'd               63730;
defparam Ur6_n.CB = 18'd               95306;
defparam Ur6_n.CC = 18'd               63872;
defparam Ur6_n.CD = 18'd               95448;
defparam Ur6_n.CE = 18'd               95600;
defparam Ur6_n.CF = 18'd              127176;
wire [17:0] lut_val_7_n;
rom_lut_r_cen Ur7_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_31_n,ser_dat_30_n,ser_dat_29_n,ser_dat_28_n } ), .data_out( lut_val_7_n[17:0]) ) ;
defparam Ur7_n.DATA_WIDTH = 18;
defparam Ur7_n.C0 = 18'd                   0;
defparam Ur7_n.C1 = 18'd               32123;
defparam Ur7_n.C2 = 18'd               32234;
defparam Ur7_n.C3 = 18'd               64357;
defparam Ur7_n.C4 = 18'd               32335;
defparam Ur7_n.C5 = 18'd               64458;
defparam Ur7_n.C6 = 18'd               64569;
defparam Ur7_n.C7 = 18'd               96692;
defparam Ur7_n.C8 = 18'd               32425;
defparam Ur7_n.C9 = 18'd               64548;
defparam Ur7_n.CA = 18'd               64659;
defparam Ur7_n.CB = 18'd               96782;
defparam Ur7_n.CC = 18'd               64760;
defparam Ur7_n.CD = 18'd               96883;
defparam Ur7_n.CE = 18'd               96994;
defparam Ur7_n.CF = 18'd              129117;
wire [17:0] lut_val_8_n;
rom_lut_r_cen Ur8_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_35_n,ser_dat_34_n,ser_dat_33_n,ser_dat_32_n } ), .data_out( lut_val_8_n[17:0]) ) ;
defparam Ur8_n.DATA_WIDTH = 18;
defparam Ur8_n.C0 = 18'd                   0;
defparam Ur8_n.C1 = 18'd               32505;
defparam Ur8_n.C2 = 18'd               32574;
defparam Ur8_n.C3 = 18'd               65079;
defparam Ur8_n.C4 = 18'd               32633;
defparam Ur8_n.C5 = 18'd               65138;
defparam Ur8_n.C6 = 18'd               65207;
defparam Ur8_n.C7 = 18'd               97712;
defparam Ur8_n.C8 = 18'd               32681;
defparam Ur8_n.C9 = 18'd               65186;
defparam Ur8_n.CA = 18'd               65255;
defparam Ur8_n.CB = 18'd               97760;
defparam Ur8_n.CC = 18'd               65314;
defparam Ur8_n.CD = 18'd               97819;
defparam Ur8_n.CE = 18'd               97888;
defparam Ur8_n.CF = 18'd              130393;
wire [17:0] lut_val_9_n;
rom_lut_r_cen Ur9_n (.clk(clk),.gclk_en(clk_en),.addr_in( {ser_dat_39_n,ser_dat_38_n,ser_dat_37_n,ser_dat_36_n } ), .data_out( lut_val_9_n[17:0]) ) ;
defparam Ur9_n.DATA_WIDTH = 18;
defparam Ur9_n.C0 = 18'd                   0;
defparam Ur9_n.C1 = 18'd               32718;
defparam Ur9_n.C2 = 18'd               32745;
defparam Ur9_n.C3 = 18'd               65463;
defparam Ur9_n.C4 = 18'd               32761;
defparam Ur9_n.C5 = 18'd               65479;
defparam Ur9_n.C6 = 18'd               65506;
defparam Ur9_n.C7 = 18'd               98224;
defparam Ur9_n.C8 = 18'd               32766;
defparam Ur9_n.C9 = 18'd               65484;
defparam Ur9_n.CA = 18'd               65511;
defparam Ur9_n.CB = 18'd               98229;
defparam Ur9_n.CC = 18'd               65527;
defparam Ur9_n.CD = 18'd               98245;
defparam Ur9_n.CE = 18'd               98272;
defparam Ur9_n.CF = 18'd              130990;
wire [18:0] tree_l_0_n_0_n;
sadd_lpm_cen Uaddl_0_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_val_0_n), .bin(lut_val_1_n), .res(tree_l_0_n_0_n) );
defparam Uaddl_0_n_0_n.IN_WIDTH = 18;
defparam Uaddl_0_n_0_n.PIPE_DEPTH = 1;
wire [18:0] tree_l_0_n_1_n;
sadd_lpm_cen Uaddl_0_n_1_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_val_2_n), .bin(lut_val_3_n), .res(tree_l_0_n_1_n) );
defparam Uaddl_0_n_1_n.IN_WIDTH = 18;
defparam Uaddl_0_n_1_n.PIPE_DEPTH = 1;
wire [18:0] tree_l_0_n_2_n;
sadd_lpm_cen Uaddl_0_n_2_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_val_4_n), .bin(lut_val_5_n), .res(tree_l_0_n_2_n) );
defparam Uaddl_0_n_2_n.IN_WIDTH = 18;
defparam Uaddl_0_n_2_n.PIPE_DEPTH = 1;
wire [18:0] tree_l_0_n_3_n;
sadd_lpm_cen Uaddl_0_n_3_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_val_6_n), .bin(lut_val_7_n), .res(tree_l_0_n_3_n) );
defparam Uaddl_0_n_3_n.IN_WIDTH = 18;
defparam Uaddl_0_n_3_n.PIPE_DEPTH = 1;
wire [18:0] tree_l_0_n_4_n;
sadd_lpm_cen Uaddl_0_n_4_n (.clk(clk),  .gclk_en(clk_en), .ain(lut_val_8_n), .bin(lut_val_9_n), .res(tree_l_0_n_4_n) );
defparam Uaddl_0_n_4_n.IN_WIDTH = 18;
defparam Uaddl_0_n_4_n.PIPE_DEPTH = 1;

wire [19:0] tree_l_1_n_0_n;
sadd_lpm_cen Uaddl_1_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_l_0_n_0_n), .bin(tree_l_0_n_1_n), .res(tree_l_1_n_0_n) );
defparam Uaddl_1_n_0_n.IN_WIDTH = 19;
defparam Uaddl_1_n_0_n.PIPE_DEPTH = 1;
wire [19:0] tree_l_1_n_1_n;
sadd_lpm_cen Uaddl_1_n_1_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_l_0_n_2_n), .bin(tree_l_0_n_3_n), .res(tree_l_1_n_1_n) );
defparam Uaddl_1_n_1_n.IN_WIDTH = 19;
defparam Uaddl_1_n_1_n.PIPE_DEPTH = 1;
wire [19:0] tree_l_1_n_2_n;
sadd_lpm_cen Uaddl_1_n_2_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_l_0_n_4_n), .bin(19'd0), .res(tree_l_1_n_2_n) );
defparam Uaddl_1_n_2_n.IN_WIDTH = 19;
defparam Uaddl_1_n_2_n.PIPE_DEPTH = 1;

wire [20:0] tree_l_2_n_0_n;
sadd_lpm_cen Uaddl_2_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_l_1_n_0_n), .bin(tree_l_1_n_1_n), .res(tree_l_2_n_0_n) );
defparam Uaddl_2_n_0_n.IN_WIDTH = 20;
defparam Uaddl_2_n_0_n.PIPE_DEPTH = 1;
wire [20:0] tree_l_2_n_1_n;
sadd_lpm_cen Uaddl_2_n_1_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_l_1_n_2_n), .bin(20'd0), .res(tree_l_2_n_1_n) );
defparam Uaddl_2_n_1_n.IN_WIDTH = 20;
defparam Uaddl_2_n_1_n.PIPE_DEPTH = 1;

wire [21:0] tree_l_3_n_0_n;
sadd_lpm_cen Uaddl_3_n_0_n (.clk(clk),  .gclk_en(clk_en), .ain(tree_l_2_n_0_n), .bin(tree_l_2_n_1_n), .res(tree_l_3_n_0_n) );
defparam Uaddl_3_n_0_n.IN_WIDTH = 21;
defparam Uaddl_3_n_0_n.PIPE_DEPTH = 1;

wire [21:0] mac_res;
assign mac_res=tree_l_3_n_0_n;
wire [21:0] atree_res;
mac_tl Umtl (.clk(clk), 
             .data_in(mac_res),
             .data_out(atree_res));
defparam Umtl.DATA_WIDTH = 22;

// ---- Adder Tree Complete ---- 


wire [7:0] shft;
wire [22:0] accum;
scale_accum_cen Usa (.gclk_en(clk_en),  .clk(clk), .rst(sa_rst), .inv(sa_inv), .ain(atree_res), .accum_out(accum) );
defparam Usa.WIDTH_A = 22;


ser_shft_cen Usershft(.gclk_en(clk_en),  .clk(clk), .rst(1'b0), .ain(accum[0]), .shft_out(shft) );
defparam Usershft.SHIFT_WIDTH = 8;


wire    [30:0] fir_int_res;
scale_shft_comb_cen Usscx (.gclk_en(clk_en), .clk(clk), .ce(done_int), .accum(accum), .shft(shft), .res(fir_int_res) );
defparam Usscx.WIDTH_ACCM = 23;
defparam Usscx.WIDTH_SHFT = 8;
defparam Usscx.WIDTH_RES = 31;

assign fir_result = fir_int_res[ACCUM_WIDTH-1:0];
assign rdy_to_ld = rdy_int;
ser_ctrl_cen Usc (.rst(rst), .clk(clk), .clk_en(clk_en), 
              .pre_rdy(pre_rdy), .data_ld(data_ld),
              .sa_rst_out(sa_rst), .ser_inv_out(sa_inv), 
              .rdy_to_ld(rdy_int), .sym_rst(sym_rst), 
              .tdl_ld(tdl_ld), .done_int(done_int), .done(done) ); 

defparam Usc.REG_LEN =9; 
defparam Usc.PIPE_DLY =8; 
defparam Usc.RST_DLY =1; 
defparam Usc.INV_DLY =2; 
defparam Usc.DONE_DLY =0; 
defparam Usc.DONE_HLD =3; 
defparam Usc.DONE_CNT_BIT =2; 
defparam Usc.CH_WIDTH =0; 
defparam Usc.NUM_CH =1; 

endmodule
