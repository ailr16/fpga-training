module Register_base(
	input 		[7:0] Data,
	input 				load,
	input					rst,
	input					clk,
	output reg 	[7:0]	Output
	);

	always @(posedge clk or negedge rst) begin
		if(rst == 0) begin
			Output <= 0;
		end
		else if(load == 1) begin
			Output <= Data;
		end
	end
	
endmodule