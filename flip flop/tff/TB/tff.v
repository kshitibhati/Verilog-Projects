module tff_tb();
reg t,clk,reset;
wire q;

tff xiti (.t(d),.clk(clk),.reset(reset),.q(q));
initial
begin
clk = 0;
forever 
#10 clk=~clk;
end


initial begin
reset=1; #20;
reset=0; 
t = 1'b0; #20;
t = 1'b1;#20;

end

endmodule
