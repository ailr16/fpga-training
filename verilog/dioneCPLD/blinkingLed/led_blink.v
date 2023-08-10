module led_blink (input wire clk, output wire LED);
	integer counter;
	reg state;
	
	always @ (posedge clk) begin
		counter <= counter + 1;
		if(counter >= 3000000) begin
			counter <= 0;
			state <= !state;
		end
	end
	assign LED = state;
endmodule 