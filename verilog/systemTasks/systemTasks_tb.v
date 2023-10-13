module systemTasks_tb();

	reg  [7:0] x;
	wire [7:0] z;
	
	systemTasks DUT(x, z);
	
	initial begin
		#0;
		x = 8'd16;
		$display("x=%d \t z=%d t=%t", x, z, $time);
		#10;
		x = 8'd32;
		$display("x=%d \t z=%d t=%t", x, z, $time);
		#20;
		
	end

endmodule