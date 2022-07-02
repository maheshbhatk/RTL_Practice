`timescale 1ns / 1ps

module auto7seg(  input clk,rst,output reg [6:0] z);
reg [3:0]counter_up;
always @(posedge clk or posedge rst)
begin
if(rst)
    counter_up <= 4'd0;
else
    if(counter_up==4'd9)
         counter_up<=4'd0;
    else
         counter_up <= counter_up + 4'd1;
end 

always @(posedge clk or posedge rst)
begin
if(rst)
    z<=7'd0;
else
case(counter_up)
4'b0000 :    z = 7'b1111110;
4'b0001 :    z = 7'b0110000;
4'b0010 :  	 z = 7'b1101101; 
4'b0011 : 	 z = 7'b1111001;
4'b0100 :	 z = 7'b0110011;
4'b0101 :	 z = 7'b1011011;  
4'b0110 :	 z = 7'b1011111;
4'b0111 :	 z = 7'b1110000;
4'b1000 :    z = 7'b1111111;
4'b1001 :    z = 7'b1111011;
endcase
end
endmodule
