module mux2to1 (a,sel,f);

input [1:0]  a;
input sel;
output f;

assign f = sel==0 ? a[0]:a[1];

endmodule
