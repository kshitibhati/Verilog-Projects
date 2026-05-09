module dff_tb();
reg d,clk,reset;
wire q;

dff xiti (.d(d),.clk(clk),.reset(reset),.q(q));
initial
begin
clk = 0;
forever 
#10 clk=~clk;
end


initial begin
reset=1; #20;
reset=0; 
d = 1'b0; #20;
d = 1'b1;#20;
d=~d;#20;
end

endmodule
