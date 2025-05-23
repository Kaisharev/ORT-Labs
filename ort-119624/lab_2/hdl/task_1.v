/*******************************************************************
 *
 * ETF Comment header
 *
 *******************************************************************/

/*******************************************************************
 *
 * Logic table:
 *     ---------------------
 *     | A | B | C | D | Y |
 *     ---------------------
 *     | 0 | 0 | 0 | 0 | 0 |
 *     ---------------------
 *     | 0 | 0 | 0 | 1 | 0 |
 *     ---------------------
 *     | 0 | 0 | 1 | 0 | 0 |
 *     ---------------------
 *     | 0 | 0 | 1 | 1 | 0 |
 *     ---------------------
 *     | 0 | 1 | 0 | 0 | 0 |
 *     ---------------------
 *     | 0 | 1 | 0 | 1 | 0 |
 *     ---------------------
 *     | 0 | 1 | 1 | 0 | 0 |
 *     ---------------------
 *     | 0 | 1 | 1 | 1 | 0 |
 *     ---------------------
 *     | 1 | 0 | 0 | 0 | 0 |
 *     ---------------------
 *     | 1 | 0 | 0 | 1 | 0 |
 *     ---------------------
 *     | 1 | 0 | 1 | 0 | 0 |
 *     ---------------------
 *     | 1 | 0 | 1 | 1 | 0 |
 *     ---------------------
 *     | 1 | 1 | 0 | 0 | 0 |
 *     ---------------------
 *     | 1 | 1 | 0 | 1 | 0 |
 *     ---------------------
 *     | 1 | 1 | 1 | 0 | 0 |
 *     ---------------------
 *     | 1 | 1 | 1 | 1 | 0 |
 *     ---------------------
 *
 *******************************************************************/
module task_1_gate(
    input i_A,
    input i_B,
    input i_C,
    input i_D,
    output o_Y
);
    /** Zadatak 1. Ispod unijeti logicku funkciju koja odgovara datim vrijednostima iz tabele! */

    assign o_Y = ((i_C & ~(i_D)) | (i_B & ~i_C & ~i_D) | (i_A & ~i_C & ~i_D));
endmodule : task_1_gate

