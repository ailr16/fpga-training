module oneHotEncoder_tb();

  localparam BIN_W = 4;
  localparam ONE_HOT_W = 16;
  integer i;
  

  reg [BIN_W-1:0] in;
  wire [ONE_HOT_W-1:0] out;

  oneHotEncoder dut(in,out);

  initial 
  begin
    for( i=0; i<16; i=i+1)
	begin
		in = i;
      #5;
    end
	
  
  end
  
  initial
  begin
  $monitor("Binary Value: %b | One hot encoded value : %b", in,out);
  #300 $finish;
  end

endmodule