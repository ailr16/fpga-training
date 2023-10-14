module parityGenerator_tb();
	
	reg x;
	reg y;
	reg z;
	wire result;
	integer i;
	
	parityGenerator DUT(x, y, z, result);
	
	initial begin
		for( i = 0; i < 8; i = i + 1 ) begin
			#10;
			{x, y, z} = i;
			$monitor ("xyz=%b \t out=%b", {x,y,z}, result);
		end
	end
	
endmodule