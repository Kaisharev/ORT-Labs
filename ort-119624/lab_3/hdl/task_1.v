/*******************************************************************
 *
 * ETF Comment header
 *
 *******************************************************************/

/*******************************************************************
 *
 * Task 1. Projektovati konvertor NBCD/7S (konvertor NBCD koda za 
 * prikaz cifara na 7-segmentnom displeju) korišćenjem standardnih 
 * logičkih kola. U slučaju pojave nedozvoljenog stanja na ulazu 
 * mreže na displeju ispisati odgovarajuću grešku.
 *
 *******************************************************************/

/*******************************************************************/
module nbcd_7s_converter(input [3 : 0] i_NBCD, output reg [6 : 0] o_SEG);
    always @(i_NBCD) begin
        case (i_NBCD)
            // GFE_DCBA
            4'b0000: o_SEG = 7'h7e; // 0 
            4'b0001: o_SEG = 7'h30; // 1 
            4'b0010: o_SEG = 7'h6d; // 2
            4'b0011: o_SEG = 7'h79; // 3
            4'b0100: o_SEG = 7'h33; // 4
            4'b0101: o_SEG = 7'h5b; // 5
            4'b0110: o_SEG = 7'h5f; // 6
            4'b0111: o_SEG = 7'h72; // 7
            4'b1000: o_SEG = 7'h7f; // 8
            4'b1001: o_SEG = 7'h7b; // 9
            default: o_SEG = 7'h4f; // Greška
        endcase
        
        
    end // always @(i_NBCD)
endmodule : nbcd_7s_converter
/*******************************************************************/

/*******************************************************************/
module task_1_gate(
    input i_A,
    input i_B,
    input i_C,
    input i_D,
    output [7 : 0] o_Y
);
    wire [3:0] w_NBCD_Input = {i_A, i_B, i_C, i_D};
    wire [6:0] w_NBCD_Output;
    nbcd_7s_converter nbcd_to_7s_converter (
        .i_NBCD(w_NBCD_Input),
        .o_SEG(w_NBCD_Output)
    );
    
    /** 
     * Zadatak 1. Ispod instancirati odgovarajuce komponente i povezati 
     * ih tako da dato kolo obavlja funkciju datu u zadatku! 
     */
     assign o_Y = {0, w_NBCD_Output};
    
endmodule : task_1_gate
/*******************************************************************/

