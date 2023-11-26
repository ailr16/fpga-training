module clockdivider(
	input clk,
	input reset,
	output div
	);
	
	reg [24:0] counter;
	
	always @(posedge clk) begin
		if(~reset)
			counter <= 0;
		else
			counter <= counter + 1;
	end 
	
	assign div = counter[24];
	
endmodule 