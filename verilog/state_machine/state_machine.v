module state_machine(
	input            clk,
    input            rst,
	output reg [1:0] state
);

    parameter STATE_0 = 2'b00;
    parameter STATE_1 = 2'b01;
    parameter STATE_2 = 2'b10;
    parameter STATE_X = 2'b11;
    
    reg [1:0] current_state;
    reg [1:0] next_state;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= STATE_0;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            next_state <= STATE_0;
        end
        else begin
            case (current_state)
                STATE_0 : next_state <= STATE_1;
                STATE_1 : next_state <= STATE_X;
                STATE_X : next_state <= STATE_2;
                STATE_2 : next_state <= STATE_0;
                default : next_state <= STATE_0;
            endcase
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= STATE_0;
        end
        else begin
            state <= current_state;
        end
    end
	
endmodule 