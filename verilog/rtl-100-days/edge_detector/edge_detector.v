module edge_detector(
	input clk,
	input in,
	output reg pedge,
	output led_new_clock);
	
	reg intermediate;
	wire new_clock;
	
	freq_divider inst1(.clock(clk), .clk_out(new_clock));
	
	assign led_new_clock = new_clock;
	
	always @(posedge new_clock) begin
		intermediate <= ~in;
		pedge <= ((~intermediate) & in);
	end 
	
endmodule 


module freq_divider(
	input clock,
	output reg clk_out);

	reg [31:0] counter;
	
	always @(posedge clock) begin
		counter <= counter + 32'd1;
		if(counter == 32'd5) begin
			counter <= 32'd0;
			clk_out <= ~clk_out;
		end
	end 
	
endmodule 
