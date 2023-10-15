module taskAndFunction_tb ();
	reg  [7:0] x;
	wire [7:0] z;
	reg [7:0] w;
	
	taskAndFunction DUT(x, z);
	
	task sum( input [3:0] a, b, output [7:0] c );
		begin
			c = a + b;
		end
	endtask
	
	function [7:0] sub( input [3:0] a, b );
		begin
			sub = a - b;
		end
	endfunction
	
	initial begin
		#0;
		x = 8'h13;
		sum( x[3:0], x[7:4], w );
		$display("%d + %d = %d", x[3:0], x[7:4], w);
		#10;
		x = 8'hFF;
		sum( x[3:0], x[7:4], w );
		$display("%d + %d = %d", x[3:0], x[7:4], w);
		#10;
		x = 8'h1F;
		w = sub( x[3:0], x[7:4] );
		$display("%d - %d = %d", x[3:0], x[7:4], w);
		#10;
	end
	
endmodule