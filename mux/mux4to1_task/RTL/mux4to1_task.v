module mux4to1 (i,sel,f);

input [3:0] i;
input [1:0] sel;
output reg  f;


task mux ( input [1:0] sel,input [3:0]i, output f);
begin
case (sel)
2'b00 : f = i[0];
2'b01 : f = i[1];
2'b10 : f = i[2];
2'b11 : f = i[3];

endcase
end
endtask
always @(*)
mux (sel,i,f);
endmodule




