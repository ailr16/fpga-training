module state_machine(
	input        clk,
    input        rst,
	output [1:0] led,
    output       n_clk
);

    wire [1:0] state_wire;
    wire       new_clk;
    
    clockdivider clk_divider(
        .clk(clk),
        .reset(rst),
        .div(new_clk)
    );
    
    SM st_machine(
        .clk(new_clk),
        .rst(rst),
        .state(state_wire)
    );
    
    assign n_clk = new_clk;
    assign led   = ~state_wire;
	
endmodule 