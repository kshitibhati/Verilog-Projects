module mux4to1tb ();

reg [3:0] i ;
reg [1:0] sel;
wire f;

mux4to1 xiti (.i(i),.sel(sel),.f(f));

initial
begin

i=4'b1010;
sel = 2'b10;  #10;
sel = 2'b01;  #10;
sel = 2'b00;  #10;
sel = 2'b11;  #10;
$finish;
end
endmodule
