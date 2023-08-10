//Gates: AND OR NAND XOR with ports

module testProject (input wire [3:0] a, input wire [3:0] b, output [3:0] z);
	assign z[0] = a[0] & b[0];
	assign z[1] = a[1] | b[1];
	assign z[2] = ~(a[2] & b[2]);
	assign z[3] = a[3] ^ b[3];
endmodule 