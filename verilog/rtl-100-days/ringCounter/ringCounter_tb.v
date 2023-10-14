module ringCounter_tb();
	
	parameter WIDTH = 4;
	
	reg clk;
	reg reset;
	wire [WIDTH - 1 : 0] count;
	
	ringCounter DUT(.clk(clk), .reset(reset), .count(count));
	
	always #10		clk = ~clk;
	
	initial begin
		clk   = 0;
		reset = 0;
		#20;
		reset = 1;
		#40;
		$monitor ("T=%0t \t out=%b", $time, count);
	end
	
	initial begin
		#400		$finish;
	end
	
endmodule