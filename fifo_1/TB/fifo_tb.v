module fifo_tb ();
reg clk, rst,wr_en,rd_en;
reg[7:0] wr_data;

wire[7:0]rd_data;
wire empty,full;

fifo dut (.clk(clk),.rst(rst),.rd_data(rd_data),.wr_data(wr_data),.rd_en(rd_en),.wr_en(wr_en),.full(full),.empty(empty));

initial
begin
clk=1;
forever
#5 clk=!clk;
end

initial
begin
rst= 1'b1;
wr_en =1'b1;
rd_en = 1'b0;
#10;

rst=1'b0;
wr_data =$random;
wr_en=1'b1;
rd_en=1'b0;
#10;

rst=1'b0;
wr_data =$random;
wr_en=1'b1;
rd_en=1'b0;
#10;

rst=1'b0;
wr_data =$random;
wr_en=1'b1;
rd_en=1'b0;
#10;

rst=1'b0;
wr_data =$random;
wr_en=1'b1;
rd_en=1'b0;
#10;

rst=1'b0;
wr_data =$random;
wr_en=1'b1;
rd_en=1'b0;
#10;

rst = 0;
wr_en=1'b0;
rd_en=1'b1;
#10;

rst = 0;
wr_en=1'b0;
rd_en=1'b1;
#10;


wr_en=1'b0;
rd_en=1'b1;
#10;

wr_en=1'b0;
rd_en=1'b1;
#10;


wr_en=1'b0;
rd_en=1'b1;
#10;

$finish;

end
endmodule

