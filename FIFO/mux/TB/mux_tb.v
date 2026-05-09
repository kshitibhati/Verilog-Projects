module mux_tb ();
reg [3:0] e,f,g,h;
reg reset,rd_enb,clk;
wire[1:0] rd_sel;
wire [3:0] rd_data;

mux xiti (.e(e),.f(f),.g(g),.h(h),.reset(reset),.rd_enb(rd_enb),.rd_sel(rd_sel),.rd_data(rd_data),.clk(clk));

initial
begin
clk=1;
forever
#5 clk =!clk;
end

initial
begin
@ (negedge clk);
  reset = 1; rd_enb = 0;
  @ (negedge clk);
  reset = 0; rd_enb = 1;
  e=4'b0010;#10;
  reset = 0; rd_enb = 1;#10;
  f=4'b0001; #10;
  $finish;
end

endmodule

