
typedef enum{
	IDLE = 4'b0001,
	LOAD = 4'b0010,
	SHR = 4'b0100,
	SHL = 4'b1000
} FSM_States;

module task_2_gate(
    input i_clk,
    input i_rst_n,
    input [7 : 0] i_DATA,
    output [7 : 0] o_DATA
);

    FSM_States state;
	wire [1:0] OP;
	reg write_left;
	reg write_right;
	reg [3:0] input_data;
	reg [3:0] register_data;
	assign OP = {i_DATA[7], i_DATA[6]};
	
	always @(posedge i_clk) begin
        if (0 == i_rst_n) begin
            write_left <= 1'b0;
			write_right <= 1'b0;
			input_data<=0;
        end else begin 
            write_left <= i_DATA[5];
			write_right <= i_DATA[4];
			input_data<=i_DATA[3:0];
        end
    end 
		
	always @(posedge i_clk) begin
        if(0 == i_rst_n)begin
			state <= IDLE;
			register_data <= 0;
        end else begin 
			case (state)
				IDLE: begin
					register_data<=register_data;
					if(2'b11 == OP) begin
						state <=SHR;
					end else if(2'b10 == OP)begin
						state <= SHL;
					end else if(2'b01 == OP)begin
						state <=LOAD;
					end else begin
						state <= IDLE;
					end
				end
				LOAD: begin
					register_data<=input_data;
					if(2'b11 == OP) begin
						state <=SHR;
					end else if(2'b10 == OP)begin
						state <= SHL;
					end else if(2'b00 == OP)begin
						state <=IDLE;
					end else begin
						state <= LOAD;
					end
				end
				SHR: begin
					register_data<={write_left, register_data[3:1]};
					if(2'b00 == OP) begin
						state <=IDLE;
					end else if(2'b10 == OP)begin
						state <= SHL;
					end else if(2'b01 == OP)begin
						state <=LOAD;
					end else begin
						state <= SHR;
					end
				end
				SHL: begin
					register_data<={register_data[2:0], write_right};
					if(2'b00 == OP) begin
						state <=IDLE;
					end else if(2'b11 == OP)begin
						state <= SHR;
					end else if(2'b01 == OP)begin
						state <=LOAD;
					end else begin
						state <= SHL;
					end
				end
			endcase
		end
    end // always @(posedge i_clk)
	assign o_DATA = {4'h0, register_data};
endmodule : task_2_gate
/*******************************************************************/

