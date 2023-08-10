module swo(clk, out1, out2);

input clk;
output out1;
output out2;

reg [31:0] counter;
reg status;

initial
	begin
		counter <= 32'b0;
		status <= 1'b0;
	end

always @ (posedge clk)
	begin
		counter <= counter + 1'b1;
		if(counter > 300000)
		begin
			status <= !status;
			counter <= 32'b0;
		end
	end
	assign out1 = status;
	assign out2 = !status;

endmodule
