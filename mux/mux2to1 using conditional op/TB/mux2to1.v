module mux2to1_tb ();
reg [1:0] a;
reg sel;
wire f; 

mux2to1 xiti (.a(a),.sel(sel),.f(f));


initial
begin
a = 01;	
sel = 1'b0;  #10;
sel = 1'b1;  #10;
$finish;
end

endmodule
