module tb_demux;

    
    reg [3:0] wr_data;
    wire [1:0] wr_sel;
    reg wr_enb, rst,clk;
    wire [3:0] a,b,c,d;

    
    demux1to4 uut (
        .wr_data(wr_data),.wr_enb(wr_enb),.rst(rst),
        .wr_sel(wr_sel), 
        .a(a),.b(b),.c(c),.d(d),.clk(clk));
		  
		  initial begin
		  clk = 0;
		  forever
		  #2 clk = !clk;
		  end
  

    initial begin
	 @ (negedge clk);
        rst = 1; #10; wr_enb = 0;
		  @ (negedge clk);
		  rst = 0; wr_enb = 1;#10;
	     wr_data = 4'b0010; #10;
		  rst = 0; wr_enb = 1;
		  wr_data = 4'b1000; #10;
		  $finish;
   
	 end
    endmodule
