module mux_2to1tb ();

reg sel;
reg [1:0] a;
wire y;

mux_2to1 xiti (.a(a),.sel(sel),.y(y));

initial
begin
  a =  2'b00; sel = 0;
  #10;
  a = 2'b01;  sel = 1;
  #10;
$finish;
end
endmodule

