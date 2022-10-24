module buzzer(clk, sw1, sw2, buzzer_pin);

input clk;
input sw1;
input sw2;

output buzzer_pin;

reg [31:0] counter;
reg selection;
reg [31:0] value_comp;
reg status;

initial begin
		counter <= 32'b0;
		status <= 1'b0;
		selection <= 1'b0;
		value_comp <= 32'd300000;
	end

always @ (posedge clk) begin
	counter <= counter + 1'b1;
	selection <= sw1;
	if(selection == 1'b0) value_comp <= 32'd300000;
	else value_comp <= 32'd100000;
	if(counter > value_comp) begin
		status <= !status;
		counter <= 32'b0;
	end
end

assign buzzer_pin = status;

endmodule