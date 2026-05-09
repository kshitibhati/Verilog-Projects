module mux2to1 (a,b,sel,f);

input a,b,sel;
output f;

assign f = ((a&~sel) | (sel&b));

endmodule
