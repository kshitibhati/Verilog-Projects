module mux_2to1 (a,sel,y);

input a,sel;
output y;

assign y = ((a&sel)|(a&~sel));

endmodule
