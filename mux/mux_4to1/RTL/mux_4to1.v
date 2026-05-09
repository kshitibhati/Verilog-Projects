module mux4to1 (i,sel,f);

input [3:0] i;
input [1:0] sel;
output f;
wire [0:3] w;


and g1 (w[0],~sel[0],i[0]);
and g2 (w[1],sel[1],i[1]);
and g3 (w[2],~sel[0],i[2]);
and g4 (w[3],sel[1],i[3]);

or f1 (f,w[0],w[1],w[2],w[3]);

endmodule
