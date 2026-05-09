module d_to_jk_tb();
reg j,k;
reg clk;
reg reset;
wire q;
d_to_jk xiti (.j(j),.k(k),.reset(reset),.clk(clk),.q(q));


initial
begin
clk=1;
forever
#10 clk=!clk;
end

initial
begin
reset=1;#11;
reset = 0;
j= 1'b0;k= 1'b1; #20;
j= 1'b0;k= 1'b0; #20;
j= 1'b1;k= 1'b0; #20;
j= 1'b1;k= 1'b1; #20;
$finish;
end
endmodule
