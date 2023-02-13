module decimal2bcd #(parameter  N = 0)(output wire [3:0] bcd_output);
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