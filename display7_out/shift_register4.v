module shift_register4 (input clk, input bit_in, output wire [3:0] parallel_out, output wire bit_out);
	reg [3:0] tmp = 4'b1110;
	always @(posedge clk) begin
		tmp <= {tmp[2:0], bit_in};
	end
	assign parallel_out = tmp[3:0];
	assign bit_out = tmp[3];
endmodule 