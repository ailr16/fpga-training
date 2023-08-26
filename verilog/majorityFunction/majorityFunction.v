module majorityFunction(
	input [5:1] x,
	output z
	);
	
	assign z = (x[3] & x[4] & x[5]) | (x[2] & x[4] & x[5]) | (x[2] & x[3] & x[5]) | (x[2] & x[3] & x[4]) | (x[1] & x[4] & x[5]) | (x[1] & x[3] & x[5]) | (x[1] & x[3] & x[4]) | (x[1] & x[2] & x[5]) | (x[1] & x[2] & x[4]) | (x[1] & x[2] & x[3]);
	
endmodule