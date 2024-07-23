`timescale 1ns/1ns		//时间单位/精度	
// 模式0
module spi_transiver
(
// 系统接口
    input               sys_clk		, 			// 全局时钟50MHz
    input               sys_rst_n	, 			// 复位信号，低电平有效
// 用户接口	
    input               spi_start	,			// 发送传输开始信号，一个高电平
    input              	spi_end		,			// 发送传输结束信号，一个高电平
    input        [7:0]  data_send   , 			// 要发送的数据
    output  reg  [7:0]  data_rec  	, 			// 接收到的数据
    output  reg         send_done	, 			// 主机发送一个字节完毕标志位    
    output  reg         rec_done	, 			// 主机接收一个字节完毕标志位    
// SPI物理接口
    input               spi_miso	, 			// SPI串行输入，用来接收从机的数据
    output  reg         spi_sclk	, 			// SPI时钟
    output  reg         spi_cs    	, 			// SPI片选信号,低电平有效
    output  reg         spi_mosi				// SPI输出，用来给从机发送数据          
);
 
reg	[1:0]	cnt;								//4分频计数器
reg	[3:0]	bit_cnt_send;						//发送计数器
reg	[3:0]	bit_cnt_rec;						//接收计数器
reg			spi_end_req;						//结束请求
 
 
// 生成片选信号spi_cs
always @(posedge sys_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)
		spi_cs <= 1'b1;				//默认为高电平						
	else if(spi_start)				//开始SPI准备传输，拉低片选信号
		spi_cs <= 1'b0;
	//收到了SPI结束信号，且结束了最近的一个BYTE
	else if(spi_end_req && (cnt == 2'd1 && bit_cnt_rec == 4'd0))
		spi_cs <= 1'b1;				//拉高片选信号，结束SPI传输
end
// 生成结束请求信号(捕捉spi_end信号)
always @(posedge sys_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)
		spi_end_req <= 1'b0;		//默认不使能					
	else if(spi_cs)					
		spi_end_req <= 1'b0;		//结束SPI传输后拉低请求
	else if(spi_end)				
		spi_end_req <= 1'b1;		//接收到SPI结束信号后就把结束请求拉高
end
// 发送数据过程--------------------------------------------------------------------
 
// 发送数据
always @(posedge sys_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)begin
		spi_mosi <= 1'b0;						//模式0空闲
		bit_cnt_send <= 4'd0;
	end
	else if(cnt == 2'd0 && !spi_cs)begin		//模式0的上升沿
		spi_mosi <= data_send[7-bit_cnt_send];	//发送数据移位
		if(bit_cnt_send == 4'd7)				//发送完8bit
			bit_cnt_send <= 4'd0;
		else
			bit_cnt_send <= bit_cnt_send + 1'b1;	
	end
	else if(spi_cs)begin						//非传输时间段
		spi_mosi <= 1'b0;						//模式0空闲
		bit_cnt_send <= 4'd0;
	end
	else begin
		spi_mosi <= spi_mosi;
		bit_cnt_send <= bit_cnt_send;
	end
end
// 发送数据标志
always @(posedge sys_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)
		send_done <= 1'b0;			
	else if(cnt == 2'd0 && bit_cnt_send == 4'd7)		//发送完了8bit数据
		send_done <= 1'b1;								//拉高一个周期，表示发送完成	
	else 
		send_done <= 1'b0;			
end
// 接收数据过程--------------------------------------------------------------------
// 接收数据spi_miso
always @(posedge sys_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)begin
		data_rec <= 8'd0;		
		bit_cnt_rec <= 4'd0;
	end
	else if(cnt == 2'd2 && !spi_cs)begin				//模式0的上升沿
		data_rec[7-bit_cnt_rec] <= 	spi_miso;			//移位接收
		if(bit_cnt_rec == 4'd7)							//接收完了8bit
			bit_cnt_rec <= 4'd0;
		else
			bit_cnt_rec <= bit_cnt_rec + 1'b1;	
	end
	else if(spi_cs)begin								
		bit_cnt_rec <= 4'd0;
	end
	else begin
		data_rec <= data_rec;
		bit_cnt_rec <= bit_cnt_rec;
	end
end
// 接收数据标志
always @(posedge sys_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)
		rec_done <= 1'b0;									
	else if(cnt == 2'd2 && bit_cnt_rec == 4'd7)			//接收完了8bit
		rec_done <= 1'b1;								//拉高一个周期，表示接收完成			
	else 
		rec_done <= 1'b0;					
end
endmodule