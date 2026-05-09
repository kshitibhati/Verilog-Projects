module jkff (input j,k,clk, output reg q);

always @ (posedge clk)

begin
if (j==1'b0 && k==1'b0)
    q=q;
else if (j==1'b0 && k==1'b1)
    q=0;
else if ( j==1'b1 && k==1'b0)
    q=1;
else if(j==1'b1 && k==1'b1)
    q=!q;
else	q=1; 
end
endmodule
   

