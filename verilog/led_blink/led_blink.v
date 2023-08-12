module led_blink(clk, LED, PIN);

input clk;
output LED;
output PIN;

reg [31:0] counter;
reg LED_status;

initial
	begin
		counter <= 32'b0;
		LED_status <= 1'b0;
	end

always @ (posedge clk)
	begin
		counter <= counter + 1'b1;
		if(counter > 2500000)
		begin
			LED_status <= !LED_status;
			counter <= 32'b0;
		end
	end
	assign LED = LED_status;
	assign PIN = LED_status;

endmodule
