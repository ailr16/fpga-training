module nibble_shift_register #(parameter  N = 0)(input clk, input [3:0]nibble_in, output wire [15:0] parallel_out, output wire [3:0] nibble_out);
	reg [15:0] tmp = N;
		always @(posedge clk) begin
			tmp <= {tmp[11:0], nibble_in};
		end
		assign parallel_out = tmp[15:0];
		assign nibble_out = tmp[15:12];
endmodule 