module delay (input clk, output del);
	reg [13:0] c = 14'b11111111111111;
	always@(posedge clk) begin
		if (c>=16383)	c <= 0;
		else				c <= c + 1;
	end
	assign del = (c <= (16384/2)-1) ? 1'b1:1'b0;
endmodule 