module loadcounter (clk,reset,load,counter,data);
input  load,clk,reset;
input [3:0] data;
output reg [3:0] counter;


always @(posedge clk)
 if (reset) begin
   counter <= 4'b0000 ;
 end else if (load==1) begin
   counter <= data;
 end else if (load==0) begin
   counter <= counter+1;
 end

endmodule 

/*always @ (posedge clk)
if (reset==1)
begin
counter=4'b0000;
end
else if (load == 0)
begin
counter=counter +1;
end
else if (load == 1)
begin
counter=data;
end 

endmodule */