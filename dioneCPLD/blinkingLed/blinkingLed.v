module blinkingLed (input wire clk, output wire LED);
	integer counter;
	reg state;
	
	always @ (posedge clk) begin
		counter <= counter + 1;
		if(counter >= 240) begin
			counter <= 0;
			state <= !state;
		end
	end
	assign LED = state;
endmodule 