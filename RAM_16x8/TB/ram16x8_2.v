//RAM 16x8
`define ADDR_WIDTH 16
`define DATA_WIDTH 8
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

initial
begin	
clk = 0;
forever
#5 clk = !clk;
end

//task reset
task reset();
begin	
@ (negedge clk);
  rst = 1'b1;
@ (negedge clk);
  rst = 1'b0;
end
endtask

//task write
task write (input [(`ADDR_WIDTH/4)-1:0] write_addr, input [`DATA_WIDTH-1:0] write_data);
begin	
@ (negedge clk);
rst = 1'b0;
wr_enb = 1'b1;
wr_addr = write_addr;
wr_data = write_data;
end
endtask

//task read
task read ( input [(`ADDR_WIDTH/4)-1:0] read_addr , output [`DATA_WIDTH-1:0] rd_data );
begin	
rst = 1'b0;
rd_enb = 1'b1;
rd_addr = 2'b11;
rd_data = ({$random});
end
endtask

initial
begin
@ (negedge clk);	
rst = 1'b1;
@ (negedge clk);
rst = 1'b0;
@ (negedge clk);
wr_enb = 1'b1;
wr_addr = 3'd6;
wr_data = 8'd15;
@ (negedge clk);
rd_enb = 1'b1;
rd_addr = 2'b11;
@ (negedge clk);
 

end
endmodule


