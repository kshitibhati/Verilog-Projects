//RAM 16x8
`define DEPTH 16
`define DATA_WIDTH 8 
`define ADDR_WIDTH 4
module ram_tb ();
reg clk,rst;
//write
reg  wr_enb;
reg [`ADDR_WIDTH-1:0] wr_addr;
reg [`DATA_WIDTH-1:0] wr_data;
//read
reg  rd_enb;
reg  [`ADDR_WIDTH-1:0] rd_addr;
wire [`DATA_WIDTH-1:0] rd_data;


ram xiti (.clk(clk),.wr_addr(wr_addr),.wr_data(wr_data),.rst(rst),.wr_enb(wr_enb),.rd_enb(rd_enb),.rd_addr(rd_addr),.rd_data(rd_data));

reg [`DATA_WIDTH-1:0] rm [0:`ADDR_WIDTH-1];
  
reg [`DATA_WIDTH-1:0] temp_data;

initial
begin
clk = 0;
forever
#5 clk=!clk;
end

initial
begin
@ (negedge clk);
rst = 1;
#10;
@ (negedge clk);
rst = 0;
wr_enb = 1'b1;
wr_addr = 10;
wr_data = 23;


@(negedge clk);
rst = 0;
rd_enb = 1'b1;
rd_addr = 5;
rd_data = {$random};
end
endmodule



            
            
