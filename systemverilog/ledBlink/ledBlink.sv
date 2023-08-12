module ledBlink(
	input logic  clk,
	output logic led,
	output logic pin
);

	reg [25:0] 	counter = 0;
	logic 		state = 0;
	localparam 	DIVISOR = 26'd50000000;				//2Hz, 50% DC
	
	assign pin = state;
	assign led = state;
	
	always_ff @(posedge clk) begin
		counter <= counter + 1;
		if (counter == (DIVISOR - 1)) begin
			state <= ~state;
			counter <= 26'd0;
		end
	end
endmodule
