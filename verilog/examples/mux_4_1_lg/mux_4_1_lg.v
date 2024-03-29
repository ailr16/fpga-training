module mux_4_1_lg (s0, s1, d0, d1, d2, d3, z0);

input s0, s1, d0, d1, d2, d3;
output z0;

wire net1, net2, net3, net4;

and3 inst1 (d0, ~s0, ~s1, net1);
and3 inst2 (d1, s0, ~s1, net2);
and3 inst3 (d2, ~s0, s1, net3);
and3 inst4 (d3, s0, s1, net4);

or4 inst5 (net1, net2, net3, net4, z0);

endmodule
