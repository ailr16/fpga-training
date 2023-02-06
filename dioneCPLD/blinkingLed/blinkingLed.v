module blinkingLed (input wire clk, output wire [7:0] LED);
	led_blink inst1 (.clk(clk), .LED(LED[0]));
	led_blink inst2 (.clk(clk), .LED(LED[1]));
	led_blink inst3 (.clk(clk), .LED(LED[2]));
	led_blink inst4 (.clk(clk), .LED(LED[3]));
	led_blink inst5 (.clk(clk), .LED(LED[4]));
	led_blink inst6 (.clk(clk), .LED(LED[5]));
	led_blink inst7 (.clk(clk), .LED(LED[6]));
	led_blink inst8 (.clk(clk), .LED(LED[7]));
endmodule 