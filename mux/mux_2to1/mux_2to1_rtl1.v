module mux2to1 (sel,a,b,f);
input sel,a,b;
output f;
wire t1,t2,~sel;
and g1 (t1,a,sel);
and g2 (t2,b,~sel);
or g3 (f,t1,t2);
endmodule
