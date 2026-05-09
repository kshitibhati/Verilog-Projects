 module mux4to1_2to1( a,sel,f);

input [3:0] a; 
input [1:0] sel;
output f;
wire [1:0] x;

mux2to1 m1 (.a(a[0]),.b(a[1]),.sel(sel[0]),.f(x[0]));
mux2to1 m2 (.a(a[2]),.b(a[3]),.sel(sel[0]),.f(x[1]));
mux2to1 m3 (.a(x[0]),.b(x[1]),.sel(sel[1]),.f(f));

endmodule 