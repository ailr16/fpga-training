module example11 (x1, x2, x3, x4, z1);

input x1, x2, x3, x4;
output z1;

nor	inst1(net1, x1, x2, x4);
nor	inst2(net2, x2, x4, ~x3);
nor	inst3(net3, ~x3, ~x2, ~x4);
nor	inst4(z1, net1, net2, net3);

endmodule

