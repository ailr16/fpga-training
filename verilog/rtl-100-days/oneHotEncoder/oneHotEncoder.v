module oneHotEncoder( in, out);
	
	parameter BITS_INPUT  = 4;
	parameter BITS_OUTPUT = 16;
	
	input  [BITS_INPUT - 1  : 0] in;
	output [BITS_OUTPUT - 1 : 0] out;
	
	assign out = 1'b1 << in;
	
endmodule