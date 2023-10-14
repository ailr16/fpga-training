module bcd_counter_tb();
	
	reg clock;
	reg clear;
	
	wire [3:0] count;
	
	bcd_counter dut(.clock(clock), .clear(clear), .count(count));
	
	initial begin
		clock = 0;
		clear = 1;
	end
	
	initial begin
		#25	clear = 0;
		#450	$finish;
	end
	
	always
		#10	clock = ~clock;
	
endmodule