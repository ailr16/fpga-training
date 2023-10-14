module systemTasks_tb();

	reg  [7:0] x;
	wire [7:0] z;
	
	systemTasks DUT(x, z);
	
	initial begin
		#0;
		x = 8'd1;
		$display("THIS IS A DISPLAY TASK x=%d \t\t z=%d t=%t", x, z, $time);		//Displayed in active region as integers
		$monitor("THIS IS A MONITOR TASK x=%b \t z=%b t=%t", x, z, $time);		//Displayed in postpone region in binary radix every value is updated
		#10;
		x = 8'd2;
		$display("THIS IS A DISPLAY TASK x=%c \t z=%c t=%t", x, z, $time);		//Displayed in active region as characters
		#10;
		x = 8'd4;
		$strobe("THIS IS A STROBE  TASK x=%b \t z=%b t=%t", x, z, $time);		//Displayed in postpone region in binary radix
		#10;
		x = 8'd8;
		$strobe("THIS IS A STROBE  TASK x=%H \t z=%H t=%t", x, z, $time);		//Displayed in postpone region in hex radix
		#10;
		x = 8'd16;
		$write("THIS IS A WRITE   TASK x=%H \t z=%H t=%t", x, z, $time);			//Displayed in active region in hex radix without new line
		#10;
		
	end

endmodule