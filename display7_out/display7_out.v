module display7_out (input x1,
							input x2,
							input x3,
							input x4,
							input clk,
							output ya,
							output yb,
							output yc,
							output yd,
							output ye,
							output yf,
							output yg,
							output yp,
							output [3:0] display_enable);
	wire wire1, wire2, wire3;
	wire [3:0] wire4;

	led_blink #(.N(125000)) clock_1khz (.clk(clk), .LED(wire1));
	
	assign leds = 4'b1111;
	
	shift_register4 enable_outputs(.clk(wire1), .bit_in(wire2), .parallel_out(display_enable), .bit_out(wire2));
	
	bcd_decoder display1 (.A(x1), .B(x2), .C(x3), .D(x4), .ya(ya), .yb(yb), .yc(yc), .yd(yd), .ye(ye), .yf(yf), .yg(yg), .yp(yp));
endmodule
