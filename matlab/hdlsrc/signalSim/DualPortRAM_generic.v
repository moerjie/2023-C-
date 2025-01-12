// -------------------------------------------------------------
// 
// File Name: D:\Desktop\2024_E_Design\2023C\matlab\hdlsrc\signalSim\DualPortRAM_generic.v
// Created: 2024-07-19 10:35:05
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DualPortRAM_generic
// Source Path: signalSim/DualRam/DualPortRAM_generic
// Hierarchy Level: 1
// Model version: 1.9
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DualPortRAM_generic
          (clk,
           enb,
           wr_din,
           wr_addr,
           wr_en,
           rd_addr,
           wr_dout,
           rd_dout);

  parameter integer AddrWidth  = 1;
  parameter integer DataWidth  = 1;

  input   clk;
  input   enb;
  input   [DataWidth - 1:0] wr_din;  // parameterized width
  input   [AddrWidth - 1:0] wr_addr;  // parameterized width
  input   wr_en;  // ufix1
  input   [AddrWidth - 1:0] rd_addr;  // parameterized width
  output  [DataWidth - 1:0] wr_dout;  // parameterized width
  output  [DataWidth - 1:0] rd_dout;  // parameterized width


  reg  [DataWidth - 1:0] ram [2**AddrWidth - 1:0];
  reg  [DataWidth - 1:0] dout_b;
  reg  [DataWidth - 1:0] dout_a;
  integer i;

  initial begin
    for (i=0; i<=2**AddrWidth - 1; i=i+1) begin
      ram[i] = 0;
    end
    dout_b = 0;
    dout_a = 0;
  end


  always @(posedge clk)
    begin : DualPortRAM_generic_process
      if (enb == 1'b1) begin
        if (wr_en == 1'b1) begin
          ram[wr_addr] <= wr_din;
          dout_a <= wr_din;
        end
        else begin
          dout_a <= ram[wr_addr];
        end
        dout_b <= ram[rd_addr];
      end
    end

  assign rd_dout = dout_b;
  assign wr_dout = dout_a;

endmodule  // DualPortRAM_generic

