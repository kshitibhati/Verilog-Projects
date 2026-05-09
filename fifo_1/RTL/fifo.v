module fifo (clk,rst,rd_en,wr_en,wr_data,rd_data,full,empty);
input clk,rst,rd_en,wr_en;
input [7:0] wr_data; 
output reg [7:0] rd_data;
output reg full, empty;
parameter depth = 3,
          max_count =3'b111;
reg[(depth-1):0] wr_ptr;
reg[(depth-1):0] rd_ptr;
reg[(depth-1):0] count;
reg[7:0] fifo_mem [0:max_count];

always @ (posedge clk)
begin
if (rst==1)
count<=3'b000;
else
case({rd_en,wr_en})
2'b00 : count<=count;
2'b01 : if (count!=max_count)
count<= count+1;
2'b10 : if (count!= 3'b000)
count<=count-1;
2'b11 : count<=count;
default : count<=count;
endcase 
end

always @ (posedge clk)
begin
if (count==max_count)
full<=1;
else
full<=0;
end

always@ (posedge clk)
begin if (count == 3'b000)
empty<=1;
else empty<=0;
end

always@ (posedge clk)
begin
if (rst == 1)
wr_ptr<=0;
else if (wr_en==1 && full==0)
wr_ptr<=wr_ptr+1;
end

always@ (posedge clk)
begin
if (rst ==1)
rd_ptr<=0;
else if (rd_en==1 && empty == 0)
rd_ptr<=rd_ptr+1;
end

always @ (posedge clk)
begin
if (wr_en==1 && full==0)
fifo_mem [wr_ptr]=wr_data;
else
fifo_mem[wr_ptr]= fifo_mem[wr_ptr];
end

always@(posedge clk)
begin
if (rst==1)
rd_data=0;
else if (rd_en==1&&empty==0)
rd_data = fifo_mem[rd_ptr];
else
rd_data=rd_data;
end
endmodule
