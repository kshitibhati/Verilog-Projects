module jkff_tb();
reg j,k,clk;
wire q;
jkff xiti (.j(j),.k(k),.clk(clk),.q(q));


initial
begin
clk=1;
forever
#10 clk=!clk;
end

initial
begin

j=1'b1; k=0'b0; #20;
j=1'b0; k=1'b1; #20;
j=1'b0; k=0'b0; #20;
j=1'b1; k=1'b1; #20;
$finish;
end
endmodule 
