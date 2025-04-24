/*******************************************************************
 *
 * ETF Comment header
 *
 *******************************************************************/

/*******************************************************************
 *
 * Task 3. Projektovati mrežu koja realizuje funkciju
 * f(D,C,B,A) = ∑(3,5,6,7,9,10,11,12,13,14,15). Na raspolaganju je 
 * multiplekser MX 4/1 i standardna logička kola.
 *
 *******************************************************************/

/*******************************************************************/
module mux_4_1(input i_I3, input i_I2, input i_I1, input i_I0, input [1 : 0] i_SEL, output reg o_Y);
    always @(i_I3, i_I2, i_I1, i_I0, i_SEL) begin
        case (i_SEL)
            2'b00: o_Y = i_I0;
            2'b01: o_Y = i_I1;
            2'b10: o_Y = i_I2;
            2'b11: o_Y = i_I3;
            default: o_Y = 1'b0;
        endcase

        
    end // always @(i_I3, i_I2, i_I1, i_I0, i_SEL)
endmodule : mux_4_1
/*******************************************************************/

/*******************************************************************/
module or_2_gate(input i_A, input i_B, output o_Y);
    assign o_Y = i_A | i_B;
endmodule : or_2_gate
/*******************************************************************/


/*******************************************************************/
module and_2_gate(input i_A, input i_B, output o_Y);
    assign o_Y = i_A & i_B;
endmodule : and_2_gate
/*******************************************************************/

module task_3_gate(
    input i_A,
    input i_B,
    input i_C,
    input i_D,
    output [7 : 0] o_Y
);
    /** 
     * Zadatak 3. Ispod instancirati odgovarajuce komponente i povezati 
     * ih tako da dato kolo obavlja funkciju datu u zadatku! 
     */
    wire [1:0] w_Sel = {i_A, i_B};
    wire w_I0, w_I1, w_I2, w_I3;
    wire w_Output;
    assign w_I0 = (i_D&i_C&(~i_B)&(~i_A));
    assign w_I1 = ((i_D|i_C)&i_B&(~i_A));
    assign w_I2 = ((i_D|i_C)&(~i_B)&i_A);
    and_2_gate and_I3 (
        .i_A(i_B),
        .i_B(i_A),
        .o_Y(w_I3)
    );
    mux_4_1 u_mux (
        .i_I3(w_I3),
        .i_I2(w_I2),
        .i_I1(w_I1),
        .i_I0(w_I0),
        .i_SEL(w_Sel),
        .o_Y(w_Output)
    );

    assign o_Y = {7'b0, w_Output};

endmodule : task_3_gate
/*******************************************************************/

