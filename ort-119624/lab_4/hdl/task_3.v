/*******************************************************************
 *
 * ETF Comment header
 *
 *******************************************************************/
 
/*******************************************************************
 *
 * JK flip-flop
 *
 * RSTn | SETn | J | K | Qn+1
 * -------------------------------------
 *   0  |  x   | x | x | 0
 *   1  |  0   | x | x | 1
 * -------------------------------------
 *   1  |  1   | 0 | 0 | Qn (no change)
 *   1  |  1   | 0 | 1 | 0 
 *   1  |  1   | 1 | 0 | 1
 *   1  |  1   | 1 | 1 | !Qn (toggles)
 *
 *******************************************************************/
module jk_ff(input i_clk, input i_rst_n, input i_pre_n, input i_J, input i_K, output o_Q, output o_Q_n);
    reg q; 
      always @(negedge i_clk or negedge i_rst_n or negedge i_pre_n) begin
        if (!i_rst_n) 
            q <= 0;
        else if (!i_pre_n) 
            q <= 1;
        else begin
            case ({i_J, i_K})
                2'b00: q <= q; 
                2'b01: q <= 0; 
                2'b10: q <= 1; 
                2'b11: q <= ~q; 
            endcase
        end
    end

    assign o_Q = q;
    assign o_Q_n = ~q;
    /* Mapiranje izlaza */ 
    
endmodule : jk_ff
/*******************************************************************/

/*******************************************************************
 *
 * NAND2 
 *
 *******************************************************************/
module nand_2_gate(input i_A, input i_B, output o_Y);
    assign o_Y = ~(i_A & i_B);
endmodule : nand_2_gate
/*******************************************************************/

/*******************************************************************
 *
 * Zadatak 3. Projektovati (realizovati) dekadni serijski brojač.
 *
 *******************************************************************/
module task_3_gate(
    input i_clk,
    input i_rst_n,
    input [7 : 0] i_DATA,
    output [7 : 0] o_DATA
); 
  reg [3:0] count;

    always @(posedge i_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            count <= 4'b0000; 
        else if (count == 4'b1001)
            count <= 4'b0000; 
        else
            count <= count + 1; 
    end

    assign o_DATA = {7'b0000000,count};


    
endmodule : task_3_gate
/*******************************************************************/


