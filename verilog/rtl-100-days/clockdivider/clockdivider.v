module clockdivider(
	input clk,
	input reset,
	output div2,
	output div4,
	output div8
	);
	
	reg [3:0] counter;
	
	always @(posedge clk) begin
		if(~reset)
			counter <= 0;
		else
			counter <= counter + 4'd1;
	end 
	
	assign div2 = counter[1];
	assign div4 = counter[2];
	assign div8 = counter[3];
	
endmodule 