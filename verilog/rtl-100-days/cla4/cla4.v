module cla4 (
	input  [3:0] a,
	input  [3:0] b,
	input        cin,
	output [3:0] sum,
	output 		 cout);
	
	and (g0, a[0], b[0]),
		 (g1, a[1], b[1]),
		 (g2, a[2], b[2]),
		 (g3, a[3], b[3]);
	
	xor (p0, a[0], b[0]),
		 (p1, a[1], b[1]),
		 (p2, a[2], b[2]),
		 (p3, a[3], b[3]);
		 
	xor (sum[0], p0, cin),
		 (sum[1], p1, c1),
		 (sum[2], p2, c2),
		 (sum[3], p3, c3);
		 
	assign c1 = g0 | (p0 & cin);
	assign c2 = g1 | (g0 & p1) | (cin & p0 & p1);
	assign c3 = g2 | (g0 & p1 & p2) | (g1 & p2) | (cin & p0 & p1 & p2);
	assign c4 = g3 | (g0 & p1 & p2 & p3) | (g1 & p2 & p3) | (g2 & p3) | (cin & p0 & p1 & p2 & p3);
	
	assign cout = c3;
		 
endmodule