module Register_PC(
	input 		[7:0] Data,
	input 				load,
	input 				rst,
	input					inc,
	input					clk,
	output reg 	[7:0]	Output
);

	always @(posedge clk or negedge rst) begin
		if(rst == 0) begin
			Output <= 0;
		end
		else if(inc == 1) begin
			Output <= Output + 1;
		end
		else if(load == 1) begin
			Output <= Data;
		end
	end

endmodule