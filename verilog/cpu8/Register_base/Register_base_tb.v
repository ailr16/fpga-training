`timescale 1ns/1ns

module Register_base_tb();

	reg	[7:0]	Data;
	reg			load;
	reg			rst;
	reg 			clk;
	wire	[7:0]	Output;
	
	Register_base DUT( .Data(Data), .load(load), .rst(rst), .clk(clk), .Output(Output) );
	
	always begin
		#1	clk = ~clk;
	end
	
	initial begin
		/* Initial states */
		clk  = 0;
		rst  = 1;
		load = 0;
		Data = 8'h55;
		
		/* Testing rst at clock 1*/
		#1;
		rst = 0;
		$display("Output must be 0 at time %0t", $time);
		
		/* Testing rst at clock 0 */
		#1;
		rst = 0;
		$display("Output must be 0 at time %0t", $time);
		
		/* Testing load at clock 1 */
		#1;
		rst  = 1;
		load = 1;
		$display("Output must be 0x55 at time %0t", $time);
		
		/* Testing load at clock 0 */
		#1;
		load = 1;
		Data = 8'hAA;
		$display("Output must be 0x55 at time %0t", $time);
		
		/* Testing load at clock 1 */
		#1;
		load = 1;
		Data = 8'hAA;
		$display("Output must be 0xAA at time %0t", $time);
		
		/* Testing rst and load at clock 0 */
		#1;
		rst  = 0;
		load = 1;
		$display("Output must be 0xAA at time %0t", $time);
		
		/* Testing rst and load at clock 1 */
		#1;
		rst  = 0;
		load = 1;
		$display("Output must be 0xAA at time %0t", $time);
		
	end
	
	
	initial begin
		#20	$finish;
	end

endmodule