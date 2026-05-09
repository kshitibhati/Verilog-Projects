module mux4to1 (i,sel,f);

input [0:3] i;
input [1:0] sel;
output reg   f;
reg [1:0] m;

function mux2to1 (input[0:1] i, sel);
begin
mux2to1 = (sel==01?i[0]:i[1]);
end
endfunction


always @ (m,sel)
begin
m[0] = mux2to1(i[0:1],sel[0]);
m[1] = mux2to1(i[2:3],sel[0]);

f = mux2to1(m[1:0] ,sel[1]);
end
endmodule


