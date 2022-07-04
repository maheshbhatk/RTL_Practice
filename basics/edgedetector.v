module edgedetector(
    input clk,
    input reset,
    input a_i,
    output rising_edge_o,
    output falling_edge_o
    );
    reg a_delayed;
    always@(posedge clk or posedge reset)
    if (reset)
        a_delayed<=0;
    else
        a_delayed<=a_i;
    
    assign rising_edge_o = ~a_delayed & a_i;
    assign falling_edge_o = a_delayed & ~a_i;
endmodule
