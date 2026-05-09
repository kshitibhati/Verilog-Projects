module counter  (reset,clk,rd_enb,y);
output reg[1:0] y;
input reset,rd_enb,clk;



always @ (posedge clk)
begin
if (reset == 1 && rd_enb==0)
   y = 2'b00; 
else 
   y = y + 1;
end
endmodule
