module edge_detector(
	input clk,
	input in,
	output reg pedge,
	output reg led_new_clock);
	
	reg intermediate;
	wire new_clock;
	
	freq_divider inst1(.clock(clk), .clk_out(new_clock));
	
	always @(posedge new_clock) begin
		led_new_clock <= ~led_new_clock;
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
		if(counter == 32'd50000000) begin
			counter <= 32'd0;
			clk_out <= ~clk_out;
		end
	end 
	
endmodule 