module led_blink #(parameter  N = 250)(input wire clk, output wire LED);
	integer counter;
	reg state;
	
	always @ (posedge clk) begin
		counter <= counter + 1;
		if(counter >= N) begin
			counter <= 0;
			state <= !state;
		end
	end
	assign LED = state;
endmodule 