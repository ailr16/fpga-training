module cla4_tb();

	reg  [3:0] a;
	reg  [3:0] b;
	reg		  cin;
	wire [3:0] sum;
	wire 		  cout;
	
	cla4 dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
	
	initial begin
		#0		a   = 4'b0000;
				b   = 4'b0000;
				cin = 1'b0;
				
		#10	a   = 4'b0000;
				b   = 4'b0000;
				cin = 1'b1;
				
		#10	a   = 4'b0001;
				b   = 4'b0010;
				cin = 1'b0;
				
		#10	a   = 4'b0001;
				b   = 4'b0010;
				cin = 1'b1;
				
		#10	a   = 4'b1111;
				b   = 4'b1111;
				cin = 1'b0;
		
		#10	a   = 4'b1111;
				b   = 4'b1111;
				cin = 1'b1;
	end
	initial begin
		$monitor("A=%b\tB=%b\tCin=%b\tS=%b\tC=%b", a, b, cin, sum, cout);
		#60 $finish;
	end
	
endmodule