clc;close all;
% 生成正弦信号
fs = 1e3; % 采样频率 1 kHz
t = 0:1/fs:0.1-1/fs; % 时间向量，持续 1 秒
f = 100; % 正弦波的频率 5 Hz
sine_signal = sin(2*pi*f*t); % 生成正弦信号

% 绘制原始正弦信号
figure;
plot(t, sine_signal);
title('Original Sine Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% 对正弦信号进行傅里叶变换
S = fft(sine_signal);

% 创建移相滤波器
n = length(S);
shift_filter = exp(1i * (pi / 2)); % 90度移相

% 对傅里叶变换后的信号应用移相滤波器
S_shifted = S .* shift_filter;

% 对移相后的信号进行逆傅里叶变换
cosine_signal = ifft(S_shifted);

% 绘制转换后的余弦信号
figure;
plot(t, real(cosine_signal)); % 提取实部
title('Converted Cosine Signal');
xlabel('Time (s)');
ylabel('Amplitude');

phasedelay
