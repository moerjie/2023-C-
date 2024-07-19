////////////////////////////////////////////////////////////////////////////////
module auout_cs4334(
  MCLKIN    ,   // input MCLK
  RST       ,   // input high reset
  L_EN      ,   // left data enable
  L_DIN     ,   // Left data in
  R_EN      ,   // right data enable
  R_DIN     ,   // right data in
  MCLKOUT   ,   // MCLKOUT
  LRCLK     ,   // L-R Clk out, bit 0 for Left ch, 1 for Right ch
  SCLK      ,   // serial clk out
  SDOUT     );  // serial data out
  
input             MCLKIN    ;
input             RST       ;
input[16-1:0]     L_DIN     ;
input[16-1:0]     R_DIN     ;
input             L_EN      ;
input             R_EN      ;

output            MCLKOUT   ;
output            LRCLK     ;
output            SCLK      ;
output            SDOUT     ;

wire CLK = MCLKIN;
assign MCLKOUT = MCLKIN;
// counter for each clock
// MCLK = 512 x LRCLK , set SCLK=LRCLK*64£¬ that is MCLK = 8 * SCLK
reg [9-1:0]      clkCntR     ;
reg [16-1:0]     L_din_R1    ;
reg [16-1:0]     R_din_R1    ;
reg              LRclk_R1, sclk_R1    ;

reg [32-1:0]    R_data_sh_R, L_data_sh_R;


// always @ (posedge CLK or posedge RST) begin
// if(RST) begin
// end
// else begin
// end
// end  // always

always @ (posedge CLK or posedge RST) begin
  if(RST) begin
    clkCntR <= 0;
  end
  else begin
    clkCntR <= clkCntR + 1'b1;
  end
end  // always
assign SCLK  = clkCntR[2];
assign LRCLK = clkCntR[8];

// update L/R data input reg
// pipeline design
// ------------------------------------
// L/R_EN  |             
// L/R_DIN |L/R_din_R1
// LRCLK   |LRclk_R1
//         |LRCLK_H2L_W/LRCLK_L2H_W


always @ (posedge CLK or posedge RST) begin
  if(RST) begin
    L_din_R1 <= 0;
    R_din_R1 <= 0;
  end
  else begin
    if(L_EN)
      L_din_R1 <= L_DIN;
    if(R_EN)
      R_din_R1 <= R_DIN;
  end
end  // always
wire LRCLK_H2L_W, LRCLK_L2H_W, SCLK_L2H_W, SCLK_H2L_W;
assign LRCLK_H2L_W = (LRclk_R1 == 1'b1 )&& (LRCLK == 1'b0);   
assign LRCLK_L2H_W = (LRclk_R1 == 1'b0 )&& (LRCLK == 1'b1);   
assign SCLK_L2H_W  = (sclk_R1  == 1'b0 )&& (SCLK  == 1'b1);
assign SCLK_H2L_W  = (sclk_R1  == 1'b1 )&& (SCLK  == 1'b0);
assign SDOUT = (LRCLK == 1'b0)?L_data_sh_R[31]:R_data_sh_R[31];
// update L/R shift regs
always @ (posedge CLK or posedge RST) begin
  if(RST) begin
    LRclk_R1 <= 0;
    sclk_R1  <= 0;
    L_data_sh_R <= 0;
    R_data_sh_R <= 0;
  end
  else begin
    LRclk_R1 <= LRCLK;
    sclk_R1  <= SCLK ;
    if(SCLK_L2H_W) begin
    // LRCLK low, I2S begin trans Left ch, 
      if(LRCLK == 1'b0) begin
        L_data_sh_R[31:1] <= L_data_sh_R[30:0];
        L_data_sh_R[0]    <= 1'b0;
      end
    // LRCLK high, I2S begin trans Right ch, 
      else begin
        R_data_sh_R[31:1] <= R_data_sh_R[30:0];
        R_data_sh_R[0]    <= 1'b0;
      end
  end // else RST
// when I2S trans left data, load the right ch to shift reg
    if(LRCLK_H2L_W) begin
      R_data_sh_R[31]         <= 0          ; // pad bit
      R_data_sh_R[30:30-16+1] <= R_din_R1   ;
      R_data_sh_R[30-16:0]    <= 15'h0      ; 
    end
// when I2S trans right data, load the left ch to shift reg
    if(LRCLK_L2H_W)  begin
      L_data_sh_R[31]         <= 0          ; // pad bit
      L_data_sh_R[30:30-16+1] <= L_din_R1   ;
      L_data_sh_R[30-16:0]    <= 15'h0      ; 
    end
  end   // else RST
end  // always


endmodule // auout_cs4334();
