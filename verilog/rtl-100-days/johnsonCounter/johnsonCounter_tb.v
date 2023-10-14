module johnsonCounter_tb();
	parameter WIDTH = 4;
	reg clk;
	reg reset;
	wire [WIDTH -1 : 0] count;
	
	johnsonCounter dut(.clk(clk), .reset(reset), .count(count));
	
	always #10		clk = ~clk;
	
	initial begin
		reset = 0;
		clk 	= 0;
		$monitor ("T=%0t \t out=%b", $time, count);
		#50 reset = 1;
	end
	
	initial begin
		#400		$finish;
	end
	
endmodule