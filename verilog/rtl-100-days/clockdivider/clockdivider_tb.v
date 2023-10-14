`timescale 1ns/1ps

module clockdivider_tb;
	
	reg clk;
	reg rst;
	
	wire div2;
	wire div4;
	wire div8;
	
	clockdivider dut(.clk(clk), .reset(rst), .div2(div2), .div4(div4), .div8(div8));
	
	initial begin				//Stimulus block
		clk = 0;
		rst = 0;
		#50;
		rst = 1;
		#50;
		rst = 0;
	end
	
	always begin				//Clock block
		#10;
		clk = ~clk;
	end
	
	initial begin
		#800;
		$finish;
	end
	
endmodule