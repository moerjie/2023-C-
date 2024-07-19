////////////////////////////////////////////////////////////////////////////////
// mc_dds
// multi-cycle dds module
module mc_dds(
  CLK   ,   // clock posedge
  RST   ,   // reset posedge
  FREQIN,   // input frequency word
  FREQEN,   // frequency word input enable
  DDSEN ,   // multi-cycle dds work enable
  OUTVD ,   // dds output valid
  DDSOUT);  // dds  output wave

input           CLK   ;
input           RST   ;
input  [32-1:0] FREQIN;
input           FREQEN;
input           DDSEN ;
output          OUTVD ;
output [7  :0]  DDSOUT;

// work enable delay line
reg ddsen_R1, ddsen_R2, ddsen_R3;

reg  [32-1:0]  freqin_R     ;
reg  [32-1:0]  phase_acc_R  ;
reg   [8-1:0]  DDSOUT       ;
wire  [8-1:0]  rom_rdW      ;   // rom read data 
wire  [7-1:0]  rom_raW      ;   // rom read address
// code template
// always @ (posedge CLK or posedge RST) begin
//   if(RST) begin
//   end
//   else begin
//   end
// end

always @ (posedge CLK or posedge RST) begin
  if(RST) begin
    ddsen_R1 <= 1'b0; 
    ddsen_R2 <= 1'b0;
    ddsen_R3 <= 1'b0;
  end
  else begin
    ddsen_R1 <= DDSEN   ; 
    ddsen_R2 <= ddsen_R1;
    ddsen_R3 <= ddsen_R2;
  end
end
assign OUTVD = ddsen_R3;


// dds working pipeline
//                                       OUTVD   
// DDSEN    | ddsen_R1     |ddsen_R2    |ddsen_R3    
//          | phase_acc_R  |
//          | rom_raW      | rom_rdW    | DDSOUT
always @ (posedge CLK or posedge RST) begin
  if(RST) begin
    phase_acc_R <= 0;
    freqin_R    <= 0;
  end
  else begin
    if(FREQEN) begin
      freqin_R <= FREQIN;
    end // if(FREQEN) 
    if(DDSEN) begin
      phase_acc_R <= phase_acc_R + freqin_R;
    end // if(DDSEN) 
    if(ddsen_R2) begin
      DDSOUT <= rom_rdW;
    end
  end
end
assign rom_raW = phase_acc_R[32-1: 32-1-7+1];

sine_rom U_sine_rom(
  .CLK    (CLK        ),  // clock
  .RA     (rom_raW    ),  // read address
  .RD     (rom_rdW    )); // read data

endmodule //  mc_dds();
