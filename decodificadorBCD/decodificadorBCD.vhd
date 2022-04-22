library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_arith.all;

entity decodificadorBCD is
	port(
		A, B, C, D: in std_logic;
		Ya, Yb, Yc, Yd, Ye, Yf, Yg, Yp, Yen: out std_logic);
end decodificadorBCD;

architecture andLogic of decodificadorBCD is
begin
	Yen <= '0';
	Ya <= (A and not C) or (not B and not D) or (not C and not D) or (not A and B and C and D);
	Yb <= (not C and not D) or (not B and not D) or (A and not B and not C) or (not A and B and not C);
	Yc <= (A and not B and C) or (not B and not D) or (not C and not D);
	Yd <= (not B and not D) or (not A and not D) or (A and B and not C) or (not A and B and C) or (not A and not B and not C);
	Ye <= not A or (not B and not D) or (B and not C);
	Yf <= (not B and C) or (not C and not D) or (not A and C and D) or (not A and not B);
	Yg <= (not C and not D) or (not B and not D) or (B and C and D) or (not A and not B and not C);
	Yp <= A or (not B and not D) or (not C and not D);
end andLogic;