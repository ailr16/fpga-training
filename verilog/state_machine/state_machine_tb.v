module state_machine_tb();
    reg        clk;
    reg        rst;
    wire [1:0] state;
    
    state_machine DUT(
        .clk(clk),
        .rst(rst),
        .state(state)
    );
    
    initial begin
        clk = 0;
        rst = 0;
    end
    
    initial begin
        #40     rst = 1;
        #20     rst = 0;
        #100    $finish;
    end
    
    always begin
        #1  clk = ~clk;
    end
    
endmodule 