module edge_detector_testbench();
	reg clk, in;
	wire pedge, slow_clock;
	
	edge_detector dut(.clk(clk), .in(in), .pedge(pedge), .led_new_clock(slow_clock));
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		in = 0;
		#20;
		in = 1;
		#10;
		in = 0;
		#5;
		in = 1;
		#5;
		in = 0;
	end
	
endmodule