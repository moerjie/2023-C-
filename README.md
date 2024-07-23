
# 测量原理


参考下面网站的方案


[bookmark](https://bbs.eeworld.com.cn/thread-1265314-1-1.html)


参考LCR测试仪，基本工作原理为给DUT加上正弦激励信号，然后测得该DUT两端的电压和流过DUT的电流，即可通过计算得到DUT的性质和参数。


![1720858696834.png](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/utool_pic/1720858696834.png)


对于一个理想电容，电流相位应该超前电容两端电压90°。然而实际的电容存在损耗，可以等效为一个理想电容$C_p$和一个理想电阻$R_p$的并联，因此电流超前电压的相位将小于90°，这个角度差即为损耗角。


![2024after4202407131621163.png](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/2024after4202407131621163.png)


假设DUT两端电压$\dot{V}=V\cos(\omega t)$，流过DUT的电流为$\dot{I}=I sin(\omega t - \varphi)$，电流在虚轴上的投影为流过理想电容的电流，在实轴上的投影为流过损耗电阻的电流。


因此可以计算出并联电容的容抗为$X_{Cp}=\frac{V}{I cos\varphi}$，容值$C_P=\frac{1}{\omega X_{Cp}}=\frac{I cos \varphi}{\omega V}$。


损耗电阻的值为$R_p=\frac{V}{Isin\varphi}$。


定义元件消耗的无功功率和有功功率之比为元件的Q值，Q值的倒数为D值（损耗角正切）


$$
Q=\frac{R_P}{X_{Cp}}=cot \varphi, D=\frac{1}{Q}=tan \varphi
$$


上述需要的参数可以借助正交算法求得：


$$
\begin{align}I\sin(\omega t-\varphi)\cdot V\cos(\omega t) & = \frac12VI\sin(2\omega t-\varphi)-\frac12VI\sin\varphi\\I\sin(\omega t-\varphi)\cdot V\sin(\omega t) & = -\frac12VI\cos(2\omega t-\varphi)+\frac12VI\cos\varphi \end{align}
$$


相乘以后经过低通滤波器后即可得到直流成分$-\frac{1}{2} VI sin\varphi 和\frac{1}{2} VI cos\varphi$，即可求得题目要求的损耗角正切


$$
tan\varphi = \frac{VI sin \varphi}{VI cos \varphi}
$$


同时可求得以下参数


$$
\text{并联形式的理想电容的容抗 }X_{cp}=\frac V{I\cos\varphi}=\frac{V^2}{VI\cos\varphi} \text{,电容为 }C_p=\frac1{\omega X_{cp}},\text{并联形式的损耗电阻}\\R_{p}=\frac V{I\sin\varphi}=\frac{V^2}{VI\sin\varphi}\text{。其中 }V^2\text{可以通过电压自乘后滤除高频成分后得到。}
$$


# 参数仿真


现有的ADC的输入电压范围为0~2V，输入偏置为1V；DAC的输出电压范围为1V峰峰值，同时可以加偏置，


![1721052590800.png](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/utool_pic/1721052590800.png)


电容容值为1nF-100nF，检流电阻为0.33Ω时，输出电压峰峰值为4-200mv。测量电感时频率为1MHz，电感感值为10uF-100uF时，输出电压峰峰值为15-150mv。由于ADC模块的输入范围为0~2V，因此对信号进行9倍放大，峰峰值放大到1.8V左右。


## 调试记录

DAC输出的信号和LC滤波器阻抗不匹配，导致LC滤波器的输入端信号幅值较低


待测元件检测电路上电后输入端有-500mv的偏置


LC滤波器设计如下，DAC输出1MHz的信号时高次谐波较为严重，因此设计一个通带为1.2MHz的LC低通滤波器滤除高次杂波。


![1721448168186.png](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/utool_pic/1721448168186.png)


![1721448231710.png](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/utool_pic/1721448231710.png)


# PCB设计


## 初代


其中R8是用来连接测试夹具的，激励信号从P1输入，经过R8上的待测电容或电感后电流经过C5流入后级电流检测电路，


![2024after4202407211655761.svg](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/2024after4202407211655761.svg)


![1721560509597.png](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/utool_pic/1721560509597.png)


这样设计的话，电路的输入阻抗为测量夹具上的待测元件的在特定频率下的阻抗值，而前级放大器的输出阻抗为50Ω，会导致输入信号的幅值不是期望的幅值。


## 改进


将前级放大器的输出端用于阻抗匹配的50Ω电阻拆掉，利用运放输出阻抗很低的特性，使得输出的信号的电压全都加在上面电路的输入端。


这样改进的原因是运放后级不带容性负载、LC滤波器、长同轴电缆的话输出端不需要接匹配电阻。


# FPGA程序设计


根据上面的原理，需要两个ADC采集电流和电压信号，1个DAC生成激励信号。因此选择DE0nano，有两个扩展的40pin排针，可以接入两个ADDA模块。


![2024after4202407231614021.bmp](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/2024after4202407231614021.bmp)


FPGA的晶振频率为50MHz，通过PLL分频出20MHz和80MHz，其中ADC的时钟为20M，DAC的时钟为80M。然后分别连接到ADC_Interface和DAC_Interface。


ADC部分采集到的信号位宽为10，舍弃低两位以便于后续对信号的处理，同时每采1024个样点后暂停0.5秒，然后再进行下次采集。


DAC部分采用一个NCO生成正弦波信号，通过拨码开关切换频率字，输出到DAC_interface后左移1位后输出，再通过一个同相放大器放大2倍，增强信号的驱动能力。


ADC采集到的电流和电压的数据存放到RAM中，通过改变起始的取地址来实现移相。使用的ADC的采样率为20M，采集100K的信号时，每个周期采集200个点，因此想要移相$\frac{\pi}{2}$时，只需要从50开始读取RAM里的数据，读出的信号即为从0开始读取的RAM的读出的信号进行$\frac{\pi}{2}$移相后的信号。


经ADC采集的数据为无符号数，做乘法滤波会和计算结果不匹配，因此再加入一级无符号转有符号数的module，转成有符号数后做乘法，再送入低通滤波器后即可获得需要的数值。对低通滤波器的输出进行截断，只保留高16位的数据，降低抖动的直流信号对结果的影响。  


# 测量结果


![1721657082949.png](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/utool_pic/1721657082949.png)


第一个Lowpass的输出为$VIcos\phi$，第二个Lowpass的输出为$\frac{1}{2}VIcos \varphi$，第三个Lowpass的输出为$V^2$，容抗的计算过程如下:


根据仿真的输入电流和输出电压的拟合关系可得，在输出采集的电压的幅值等于电流÷0.305，因此容抗为 第三个输出÷2÷第一个输出÷0.305


## 电路展示

![2024after4202407231606426.jpg](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/2024after4202407231606426.jpg)

