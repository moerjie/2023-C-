
module ADC_interface(
  CLK_ADC  ,   //  adc clk
  DAT_ADC  ,   //  input data, from adc 
  OTR_ADC  ,   //  from adc , signal out of range flag
  OTR_OUT  ,   //  output otr flag
  STBY_ADC ,   //  adc stand by, set 0 make adc running 
  DOUT     );   //  data out


input        CLK_ADC  ;  
input  [9:0] DAT_ADC  ;  
input        OTR_ADC  ;
output       OTR_OUT  ;
output       STBY_ADC ;

output [7:0] DOUT     ; 


reg [7:0] DOUTR   ; 

reg       OTR_OUT;

always @ (posedge CLK_ADC) begin  
  DOUTR    <= DAT_ADC[9:2]   ; 
  OTR_OUT <= OTR_ADC;
end

assign STBY_ADC = 1'b0;
assign DOUT = DOUTR;
endmodule


//////////////////// DAC �ӿ�ģ�� ת��2����Ϊ�޷����� /////////////////////////
// input is signed , output is unsigned
module DAC_interface(
  CLKIN   ,   //  input clk
  DATIN   ,   //  input data
  DAT2DAC );   //  data to dac


input           CLKIN;
input  [16-1:0]  DATIN   ;
output [12-1:0] DAT2DAC ;


reg [12-1:0]  DAT2DAC ;
reg [12-1:0]  datin_R1;

always @ (posedge CLKIN) begin
  datin_R1 [11]    <= ~ DATIN[15]; // inverse the msb to unsigned
  datin_R1 [10: 0] <= DATIN[14:4];
  DAT2DAC          <= datin_R1;
end


endmodule
//////////////////// λ���չ����ģ��  /////////////////////////
module bus_LSB_staff_zero(
  IN    ,   
  OUT   );
parameter INWL     = 8;
parameter OUTWL    = 16;

input   [INWL -1:0] IN ;
output  [OUTWL-1:0] OUT;

assign OUT[OUTWL-1:OUTWL - INWL ] = IN;
assign OUT[INWL-1:0] = 0;

endmodule


//////////////////// ���벢����λ�Ĵ���  /////////////////////////
module shift_reg_SIPO(
  RST   ,   // �첽��λ�� ����Ч
  CLK   ,   // ʱ�ӣ���������Ч
  EN    ,   // �������ݴ�����λʹ��
  IN    ,   // ���봮������
  OUT   );  // ������������
parameter SHLEN = 6;
input RST, CLK, EN;
input IN;
output[SHLEN-1:0] OUT;
reg [SHLEN-1:0] shift_R;

assign OUT[SHLEN-1:0] = shift_R[SHLEN-1:0];
// ʱ���߼� ��������ʹ�ܽ��д�����λ
// shift_R �ᱻ����ΪD������
always @ (posedge CLK or posedge RST) begin
  if(RST) 
    shift_R[SHLEN-1:0] <= 0;
  else
    if(EN) begin // ������λ��ʹ����Ч
      shift_R[SHLEN-1:1] <= shift_R[SHLEN-2:0];
      shift_R[0]   <= IN;
    end
    else begin // ʹ����Ч���ֲ���
      shift_R[SHLEN-1:0] <= shift_R[SHLEN-1:0];
    end
end // always
endmodule

//////////////////// ʱ����׼������  /////////////////////////
module cnt_sync(
  CLK   ,   // clock
  CNTVAL,   // counter value
  OV    );  // overflow
input CLK;
output [32-1:0] CNTVAL;
output OV;
parameter MAX_VAL = 25_000_000;
reg [32-1:0] CNTVAL;
reg OV;

always @ (posedge CLK) begin
  if(CNTVAL >= MAX_VAL)
    CNTVAL <= 0;
  else
    CNTVAL <= CNTVAL + 1'b1;
end

always @ (CNTVAL) begin
  if(CNTVAL == MAX_VAL)
    OV = 1'b1;
  else
    OV = 1'b0;
end

endmodule   // module cnt_en_0to9
//////////////////// ��������������ļ�����  /////////////////////////
module cnt_incr(
  CLK   ,   // clock
  INCR  ,   // counter increase value 
  CNTVAL);  // counter value
input CLK;
input  [7-1:0] INCR;
output [7-1:0] CNTVAL;

reg [7-1:0] CNTVAL;

always @ (posedge CLK) begin
  CNTVAL <= INCR + CNTVAL;
end
endmodule   // module cnt_incr

///////////////////// ��ʹ�ܵļ����� /////////////////////////////////

module cnt_en_0to9(
  CLK   ,   // clock
  CNTVAL,   // counter value
  EN    ,
  OV    );  // overflow
input CLK;
input EN;
output [4-1:0] CNTVAL;
output OV;

reg [4-1:0] CNTVAL;
reg OV;

always @ (posedge CLK) begin
  if(EN) begin  // work enable
    if(CNTVAL >= 9)
      CNTVAL <= 0;
    else
      CNTVAL <= CNTVAL + 1'b1;
  end
  else
    CNTVAL <= CNTVAL ;  // hold same value
end

always @ (CNTVAL) begin
  if(CNTVAL == 9)
    OV = 1'b1;
  else
    OV = 1'b0;
end

endmodule   // module cnt_en_0to9
////////////////////////////////////////////////////////////////////////////////
module cnt_0to9(
  CLK   ,   // clock
  CNTVAL,   // counter value
  OV    );  // overflow
input CLK;
output [4-1:0] CNTVAL;
output OV;

reg [4-1:0] CNTVAL;
reg OV;

always @ (posedge CLK) begin
  if(CNTVAL >= 9)
    CNTVAL <= 0;
  else
    CNTVAL <= CNTVAL + 1'b1;
end

always @ (CNTVAL) begin
  if(CNTVAL == 9)
    OV = 1'b1;
  else
    OV = 1'b0;
end

endmodule   // module cnt_0to9
////////////////////////////////////////////////////////////////////////////////
module dec_2to4(
IN  ,
OUT);
input  [2-1:0] IN  ;
output [4-1:0] OUT ;

reg [4-1:0] OUT ;

always @ (IN) begin
  case(IN)
    2'b00: OUT = 4'b 0001;
    2'b01: OUT = 4'b 0010;
    2'b10: OUT = 4'b 0100;
    2'b11: OUT = 4'b 1000;
  endcase
end

endmodule // module dec_2to4;
