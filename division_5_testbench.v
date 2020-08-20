`timescale 1ns / 1ns
`include "division_5.v"

module division_5_testbench();

reg clk;
reg rst;
wire clk_o;
wire cnt_pos_w;
wire cnt_neg_w;
wire [2:0] cnt_w;


parameter PERIOD = 10;

initial 
begin
	clk = 0;
	forever
		#(PERIOD/2) clk = ~clk; 
end 

division_5 division_5_inst(
.clk(clk),
.rst(rst),
.cnt_pos_w(cnt_pos_w),
.cnt_neg_w(cnt_neg_w),
.cnt_w(cnt_w),
.clk_o(clk_o)
);

initial 
begin
 rst = 1'b0;
 #1;
 rst = 1'b1;
#1000
$finish;
end

endmodule
