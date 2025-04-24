/*******************************************************************
 *
 * ETF Comment header
 *
 *******************************************************************/

/*******************************************************************
 *
 * Task 2. Projektovati mrežu koja realizuje funkciju 
 * f(1) = {0, 4, 6, 7}. Na raspolaganju su jedan dekoder DEK 3/8 i 
 * jedno ILI logičko kolo sa potrebnim brojem ulaza
 *
 *******************************************************************/

/*******************************************************************/
module dec_3_8 (input [2 : 0] i_A, input i_CS, output reg [7 : 0] o_Y);
    always @(i_A or i_CS) begin
        if (1 == i_CS) begin
            o_Y = 8'b0000_0000;
            case (i_A)
                3'b000: o_Y[0] = 1;
                3'b001: o_Y[1] = 1;
                3'b010: o_Y[2] = 1;
                3'b011: o_Y[3] = 1;
                3'b100: o_Y[4] = 1;
                3'b101: o_Y[5] = 1;
                3'b110: o_Y[6] = 1;
                3'b111: o_Y[7] = 1;
            endcase
            end else begin
            o_Y = 8'b0000_0000;

        end 
        // if (1 == i_CS)
    end // always @(i_A or i_CS)
endmodule : dec_3_8
/*******************************************************************/

/*******************************************************************/
module or_4_gate (input i_A, input i_B, input i_C, input i_D, output o_Y);
    assign o_Y = i_A | i_B | i_C | i_D;
endmodule : or_4_gate
/*******************************************************************/

/*******************************************************************/
module task_2_gate (
    input i_A,
    input i_B,
    input i_C,
    input i_D,
    output [7 : 0] o_Y
);
   wire [2:0] w_Decoder_Input = {i_A, i_B, i_C};
   wire [7:0] w_Decoder_Output;
   wire w_OR_Output;
   dec_3_8 decoder (
    .i_A (w_Decoder_Input),
    .i_CS(1'b1),
    .o_Y(w_Decoder_Output)
   );

   or_4_gate or_4_gate (
    .i_A(w_Decoder_Output[0]),
    .i_B(w_Decoder_Output[4]),
    .i_C (w_Decoder_Output[6]),
    .i_D (w_Decoder_Output[7]),
    .o_Y (w_OR_Output)
   );
   
    assign o_Y = {7'b0, w_OR_Output};

endmodule : task_2_gate
/*******************************************************************/

