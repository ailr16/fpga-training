module bcd_decoder (A, B, C, D, ya, yb, yc, yd, ye, yf, yg, yen);

input A, B, C, D;
output ya, yb, yc, yd, ye, yf, yg, yen;

assign yen = 0;
assign ya = (A & ~C) | (~B & ~D) | (~C & ~D) | (~A & B & C & D);
assign yb = (~C & ~D) | (~B & ~D) | (A & ~B & ~C) | (~A & B & ~C);
assign yc = (A & ~B & C) | (~B & ~D) | (~C & ~D);
assign yd = (~B & ~D) | (~A & ~D) | (A & B & ~C) | (~A & B & C) | (~A & ~B & ~C);
assign ye = ~A | (~B & ~D) | (B & ~C);
assign yf = (~B & C) | (~C & ~D) | (~A & C & D) | (~A & ~B);
assign yg = (~C & ~D) | (~B & ~D) | (B & C & D) | (~A & ~B & ~C);

endmodule
