c=100e-9;

f=1000;
phi=pi/4;
fs=1e6;
fdac=20e6;
deltaF=0.01;
N=ceil(log2(fdac/deltaF));
inc_1e5=round((100000*2^N)/fdac);
inc_1e6=round((1000000*2^N)/fdac);

u=0:0.01:100;

% 
% subplot(2,1,1);
% plot(VarName9);
% subplot(2,1,2);
% plot(VarName11);