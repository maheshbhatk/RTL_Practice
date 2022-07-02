`timescale 1ns / 1ps

module mealy1011(input clk,rst,din,output reg out  );
parameter s0=3'b000,
          s1=3'b001,
          s2=3'b010,
          s3=3'b011;         
reg [2:0]state;
always@(posedge clk)
if(rst==0)
state<=s0;
else
case(state)
s0: if(din==1'b1)   state<=s1;
    else state<=s0;
s1: if(din==1'b0)   state<=s2;
    else state<=s1;
s2:if(din==1'b1)    state<=s3;
    else state<=s0;
s3:if(din==1'b1)    state<=s1;
    else state<=s0;
endcase
always@(posedge clk)
if(rst==0)
out<=0;
else
case(state)
s0:out<=0;
s1:out<=0;
s2:out<=0;
s3:if(din==1)out<=1;
    else out<=0;
endcase
endmodule
