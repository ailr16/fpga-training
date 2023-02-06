module testProject_tb;

	reg [3:0] a;
	reg [3:0] b;
	wire [3:0] z;
	
	initial
	$monitor ("a = %b, b = %b, z = %b", a, b, z);

	initial begin
		#0		a = 4'b0000;
				b = 4'b0000;
				
		#10	a = 4'b0000;
				b = 4'b1111;
				
		#10	a = 4'b1111;
				b = 4'b0000;
				
		#10	a = 4'b1111;
				b = 4'b1111;
				
		#10	$stop;
		
	end

		testProject inst1(.a(a), .b(b), .z(z));
		
endmodule 