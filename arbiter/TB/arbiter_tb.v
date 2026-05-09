module arbiter_tb();
reg clk,rst;
reg rq0,rq1,rq2;
wire gt0,gt1,gt2;
wire timeout;

arbiter xiti (.clk(clk),.rst(rst),.gt0(gt0),.gt1(gt1),.gt2(gt2),.rq0(rq0),.rq1(rq1),.rq2(rq2),.timeout(timeout));
 
initial
begin
clk=1;
forever
#5 clk=~clk;
end

initial
begin
@(negedge clk)
rst=1;
@(negedge clk)
rst=0;
@ (negedge clk)
rq0=1;
rq1=0;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=1;
rq2=1;
@(negedge clk)
rst=0;
rq0=1;
rq1=0;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=0;
rq2=0;
@(negedge clk)
rst=0;
rq0=1;
rq1=1;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=0;
rq2=1;
@(negedge clk)
rst=0;
rq0=0;
rq1=1;
rq2=1;
@(negedge clk)
rst=0;
rq0=0;
rq1=1;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=0;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=1;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=0;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=0;
rq2=1;
@(negedge clk)
rst=0;
rq0=0;
rq1=0;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=1;
rq2=0;
@(negedge clk)
rst=0;
rq0=1;
rq1=0;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=1;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=1;
rq2=0;
@(negedge clk)
rst=0;
rq0=0;
rq1=0;
rq2=1;
@(negedge clk)
rst=0;
rq0=1;
rq1=0;
rq2=0;


end
endmodule
