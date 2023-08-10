module bcd_decoder (A1, B1, C1, D1, ya, yb, yc, yd, ye, yf, yg, yp);

    input A1, B1, C1, D1;
    output ya, yb, yc, yd, ye, yf, yg, yp;
	 
	 wire A, B, C, D;
	 
	 assign A = ~A1;
	 assign B = ~B1;
	 assign C = ~C1;
	 assign D = ~D1;

    assign ya = (A & ~B & D) | (A & B & C & ~D) | (~A & B & ~C & ~D) | (~A & ~B & C & ~D);
    assign yb = (~B & ~C & D) | (~A & ~C & ~D) | (~A & ~B & D) | (A & ~B & C & ~D);
    assign yc = (~A & ~B & D) | (~A & ~B & ~C) | (A & B & ~C & D);
    assign yd = (B & C & ~D) | (~B & ~C & ~D) | (A & ~B & C & D) | (~A & B & ~C & D);
    assign ye = (A & ~D) | (B & C & ~D) | (A & ~B & C);
    assign yf = (A & B & ~D) | (A & B & ~C) | (A & ~C & ~D) | (~A & ~B & C & ~D);
    assign yg = (A & B & C) | (A & ~B & ~C & ~D) | (~A & ~B & C & D);
    assign yp = A | ~B | C | D;

endmodule
