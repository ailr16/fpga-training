module example_and2_tb;

reg x1, x2;
wire z1;

initial
$monitor ("x1 = %b, x2 = %b, z1 = %b", x1, x2, z1);

initial
begin
	#0		x1 = 1'b0;
			x2 = 1'b0;
	#10	x1 = 1'b0;
			x2 = 1'b1;
	#10	x1 = 1'b1;
			x2 = 1'b0;
	#10	x1 = 1'b1;
			x2 = 1'b1;
	#10	$stop;
end

example_and2 inst1(
	.x1(x1),
	.x2(x2),
	.z1(z1)
);

endmodule
	