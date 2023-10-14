module edge_detector_testbench();
	reg clk;
	reg in;
	wire pedge;
	wire led_new_clock;
	
	edge_detector dut(
		.clk(clk),
		.in(in),
		.pedge(pedge),
		.led_new_clock(led_new_clock)
	);
	
	initial begin
		clk = 0;
		in  = 0;
		#5;
		
		in = 0;
		#5;
		in = 1;
		#5;
		in = 0;
		#5;
		
	end
	
	always #1 clk = ~clk;
	
endmodule