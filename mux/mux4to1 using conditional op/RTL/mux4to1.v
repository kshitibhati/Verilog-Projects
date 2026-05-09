module mux4to1 (a,sel,f);
input [3:0] a;
input [1:0] sel;
output f;

assign f = (sel[1]==1)?((sel[0]==0)?a[2]:a[3]):(sel[0]==0)?a[0]:a[1];


endmodule
