module MUX(
	input 		[1:0] sel,
	input 		[7:0] A,
	input 		[7:0] B,
	input 		[7:0] C,
	input 		[7:0] D,
	output reg 	[7:0] O
);

	always @(*) begin
		case(sel)
			2'd0:	O <= A;
			2'd1:	O <= B;
			2'd2:	O <= C;
			2'd3:	O <= D;
		endcase
	end

endmodule