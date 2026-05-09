module tff (input t,clk,reset,output reg q);

always @ ( posedge clk)

begin
if (reset == 1)
   q = 0;
else q = ~q;	

end

endmodule
