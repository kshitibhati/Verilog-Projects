
`define ADDR_WIDTH 16
`define DATA_WIDTH 8

module ram_tb(); 

  reg clk,rst;
 
 //write signals
  reg wr_enb;
  reg [(`ADDR_WIDTH/4)-1:0] wr_addr;
  reg [`DATA_WIDTH-1:0] wr_data;

 //read signals
  reg rd_enb;
  reg [(`ADDR_WIDTH/4)-1:0] rd_addr;
  wire[`DATA_WIDTH-1:0] rd_data;

integer wr_out,rd_out;
  
  //DUT Intantiation
  ram DUT (clk,rst,wr_enb,wr_addr,wr_data,rd_enb,rd_addr,rd_data);
  
//reference model
  reg [`DATA_WIDTH-1:0] mem [0:`ADDR_WIDTH-1];
  


//clk
initial
begin
clk = 0;
forever
#5 clk = !clk;
end

//rst
initial
begin
@(negedge clk);
rst = 1;
@(negedge clk);
rst = 0;
@(negedge clk);
end

//write
initial
begin
$readmemb("D:/Verilog/RAM_16x8/New folder/SIM_2/write.v",mem);
wr_out = $fopen ("D:/Verilog/RAM_16x8/New folder/SIM_2/wr_output.v");
wr_enb = 1'b1;
rd_enb = 1'b0;
#10;
wr_addr = mem[0];
wr_data = mem[1];
#10;
wr_addr = mem[2];
wr_data = mem[3];
#10;
wr_addr = mem[4];
wr_data = mem[5];
#10;
wr_addr = mem[6];
wr_data = mem[7];
#10;
wr_addr = mem[8];
wr_data = mem[9];
#10;
wr_addr = mem[10];
wr_data = mem[11];
#10;
wr_addr = mem[12];
wr_data = mem[13];
#10;
wr_addr = mem[14];
wr_data = mem[15];
#10;
$fclose(wr_out);
#10;
$finish;
end

//read
initial
begin
$readmemb("D:/Verilog/RAM_16x8/New folder/SIM_2/read.v",mem);
rd_out = $fopen("D:/Verilog/RAM_16x8/New folder/SIM_2/re_output.v");
wr_enb = 1'b0;
rd_enb = 1'b1;

#10;
rd_addr = mem[0];

#10;
rd_addr = mem[1];

#10;
rd_addr = mem[3];

#10;
rd_addr = mem[4];

#10;
rd_addr = mem[5];

#10;
rd_addr = mem[6];
#10;
rd_addr = mem[7];

#10;
rd_addr = mem[8];

#10;
rd_addr = mem[9];
#10;
rd_addr = mem[10];
#10;
rd_addr = mem[11];
#10;
rd_addr = mem[12];
#10;
rd_addr = mem[13];
#10;
rd_addr = mem[14];
#10;
rd_addr = mem[15];
#10;

$fclose(rd_out);
#10;
$finish;
end

initial
begin
$fmonitor(wr_out,"wr_addr = %d, wr_data = %d",wr_addr,wr_data);
$fmonitor(rd_out,"rd_addr = %d, rd_data = %d ",rd_addr,rd_data);
end

endmodule
