`timescale 1ns/1ns

module Register_PC_tb();
	reg		[7:0]	Data;
	reg 				load;
	reg				rst;
	reg				inc;
	reg				clk;
	wire		[7:0]	Output;
	
	Register_PC DUT(.Data(Data), .load(load), .rst(rst), .inc(inc), .clk(clk), .Output(Output));
	
	always begin
		#1		clk = ~clk;
	end
	
	initial begin
		/* Initial status */
		Data = 8'h00;
		clk  = 0;
		load = 0;
		rst  = 0;
		inc  = 0;
		
		/* Start increment */
		#1
		rst = 1;
		inc = 1;
		
		/* Stop increment at 10 */
		#20
		inc = 0;
		
		/* Load 0xFA */
		#1
		Data = 8'hFA;
		load = 1;
		
		/* Start increment */
		#2
		load = 0;
		inc = 1;
				
	end
	
	initial begin
		#40	$finish;
	end
	
endmodule