`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE     
// VSCODE plug-in version: Verilog-Hdl-Format-2.7.20240716
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            Please Write Company name
// All rights reserved     
// File name:              
// Last modified Date:     2024/07/22 14:11:47
// Last Version:           V1.0
// Descriptions:           turn unsigned adc sample data to signed data
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name 
// Created date:           2024/07/22 14:11:47
// mail      :             Please Write mail 
// Version:                V1.0
// TEXT NAME:              unsigned2signed.v
// PATH:                   D:\Desktop\2024_E_Design\2023C\fpga_2\unsigned2signed.v
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module unsigned2signed(
    input                               clk                        ,
    input                               rst_n                      ,
    input       [7:0]                   unsignedDataIn             ,
    output   reg[7:0]                   signedDataOut
    );
                                                                   
    //reg [7:0] signedDataOut;
    reg [7:0] dataTemp;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            signedDataOut=0;
        end
        else begin
            dataTemp[7]<=~unsignedDataIn[7];
            dataTemp[6:0]<=unsignedDataIn[6:0];
            signedDataOut<=dataTemp;
        end
    end
                                                                   
endmodule