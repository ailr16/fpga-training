module majorityFunction_tb();

	reg [5:1] x;
	wire z;
	integer i;
	
	majorityFunction DUT(.x(x), .z(z));
	
	initial begin
		for(i = 0; i < 32; i = i + 1) begin
			{x[5], x[4], x[3], x[2], x[1]} = i;
			#10 $display ("x1 x2 x3 x4 x5 = %b \t Output = %b", { x[1], x[2], x[3], x[4], x[5] }, z);
		end
	end
	
endmodule