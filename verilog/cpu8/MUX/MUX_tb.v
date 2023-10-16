`timescale 1ns/1ns

module MUX_tb();
	reg  [1:0] sel;
	reg  [7:0] A;
	reg  [7:0] B;
	reg  [7:0] C;
	reg  [7:0] D;
	wire [7:0] O;
	
	MUX DUT(sel, A, B, C, D, O);
	
	initial begin
		A = 8'hAA;
		B = 8'hBB;
		C = 8'hCC;
		D = 8'hDD;
		
		/* Select A input */
		sel = 2'd0;
		#1;
		
		/* Select B input */
		sel = 2'd1;
		#1;
		
		/* Select C input */
		sel = 2'd2;
		#1;
		
		/* Select D input */
		sel = 2'd3;
		#1;
		
		/* Select C input */
		sel = 2'd2;
		#1;
		
		/* Select B input */
		B = 8'hB0;
		sel = 2'd1;
		#1;
		
		/* Select A input */
		A = 8'hA0;
		sel = 2'd0;
		#1;
		
	end
	
	initial begin
		#10	$finish;
	end
endmodule