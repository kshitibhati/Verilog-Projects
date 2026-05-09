module d_to_jk(j,k,reset, clk,q);
input j,k;
input clk;
input reset;
output q;
wire d;
//dff ff (.d(jk),.reset(reset),.clk(clk),.q(w));
assign d = ((j&~q)| (~k&q));
dff ff (.d(d),.clk(clk),.reset(reset),.q(q));
/*
always @ (posedge clk)
begin
if (reset)
q<=0;

 if ( jk == 2'b01)
   q <= 0;
else if ( jk == 2'b00)
   q <= q;
else if ( jk == 2'b10)
   q <= 1;
else if ( jk == 2'b11)
   q <= 0;
else q <= ~q;
end*/
endmodule


