module bcd_counter(
	input clock,
	input clear,
	output reg [3:0] count);
	
	always @(posedge clock) begin
		if(count == 4'd9 || clear) begin
			count <= 4'd0;
		end
		else begin
			count <= count + 1;
		end
	end
	
endmodule