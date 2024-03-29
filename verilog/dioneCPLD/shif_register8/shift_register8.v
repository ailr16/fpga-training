module shift_register8 (input wire clk, input wire bit_in, output wire bit_out, output wire [7:0] parallel_out);
	wire out2in1;
	shift_register4 inst1 (.clk(clk), .bit_in(bit_in), .bit_out(out2in1), .parallel_out(parallel_out[3:0]));
	shift_register4 inst2 (.clk(clk), .bit_in(out2in1), .bit_out(bit_out), .parallel_out(parallel_out[7:4]));
	
endmodule 