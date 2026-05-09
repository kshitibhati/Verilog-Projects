module mux2to1_tb();

reg x,y;
reg  z;
wire f;

mux2to1 xiti (.a(x),.b(y),.sel(z),.f(f));

initial
begin
  x = 1'b1; y = 1'b0; z = 1'b1;
  #10;
  x = 1'b1; y = 1'b0; z = 1'b0;
  #10;
$finish;
end

endmodule
 
