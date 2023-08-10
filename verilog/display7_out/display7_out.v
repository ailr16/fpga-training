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
	reg mon_clk_reg;
	
	wire [3:0] test_wireIn, test_wireOut;
	wire [15:0] test_wireOut2;
	

	led_blink #(.N(125000)) clock_1khz (.clk(clk), .LED(wire1));
	
	
	shift_register4 enable_outputs(.clk(wire1), .bit_in(wire2), .parallel_out(display_enable), .bit_out(wire2));
	nibble_shift_register #(.N(12984)) instance1 (.clk(wire1), .nibble_in(test_wireOut), .parallel_out(test_wireOut2), .nibble_out(test_wireOut));
	
	wire [3:0] decNumber= 15;
	
	bcd_decoder display1 (.A1(test_wireOut2[15]), .B1(test_wireOut2[14]), .C1(test_wireOut2[13]), .D1(test_wireOut2[12]), .ya(ya), .yb(yb), .yc(yc), .yd(yd), .ye(ye), .yf(yf), .yg(yg), .yp(yp));
	
endmodule
