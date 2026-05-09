module mux4to1_2to1_tb ();

reg [3:0] a ;
reg [1:0] sel;
wire f;

mux4to1_2to1 xiti (.a(a),.sel(sel),.f(f));

initial
begin

a=4'b1010;
sel = 2'b00;  #10;
sel = 2'b01;  #10;
sel = 2'b10;  #10;
sel = 2'b11;  #10;
$finish;
end
endmodule


