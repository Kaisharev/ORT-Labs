 
typedef enum {
    S0 = 3'b000,
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100
} eFSM_state_t;

module task_3_gate(
    input i_clk,
    input i_rst_n,
    input [7 : 0] i_DATA,
    output [7 : 0] o_DATA
); 
    wire val_one = i_DATA[0];
    reg [3:0] state;
    eFSM_state_t current_state;
    eFSM_state_t next_state;
    
    always @(posedge i_clk) begin
        if (0 == i_rst_n) begin
            current_state <= S0;
        end else begin
            current_state <= next_state;
        end
    end

    always @(posedge i_clk) begin
        if (0 == i_rst_n) begin
            state<=0;
        end
        else begin
            if (val_one==1) begin
                if (state==4)
					state<=0;
				else state<=state + 1;
			end

		else begin
			if (state==0)
				state<=4;
			else state<=state-1;
			end
		end
	end

    assign o_DATA = {4'h0, state};

    
endmodule : task_3_gate

