module SM(
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
    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            current_state <= STATE_0;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            next_state <= STATE_0;
        end
        else begin
            case (current_state)
                STATE_0 : begin
                            next_state <= STATE_1;
                          end
                          
                STATE_1 : begin 
                            next_state <= STATE_X;
                          end
                          
                STATE_X : begin
                            next_state <= STATE_2;
                          end
                          
                STATE_2 : begin 
                            next_state <= STATE_0;
                          end
                          
                default : begin 
                            next_state <= STATE_0;
                          end
            endcase
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            state <= STATE_0;
        end
        else begin
            state <= current_state;
        end
    end
	
endmodule 