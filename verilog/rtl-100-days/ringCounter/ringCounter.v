module ringCounter(clk, reset, count);
	
	parameter WIDTH = 4;
	
	input  clk;
	input  reset;
	output reg [WIDTH - 1 : 0] count;
	
	always @(posedge clk) begin
		if(reset == 1'b0)
			count <= 4'd1;
		else
			count <= {count[0], count[WIDTH - 1 : 1]};
	end

endmodule