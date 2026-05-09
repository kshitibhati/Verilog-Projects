module buffer_tb();
reg i,c;
wire f;

buffer bg (.i(i),.c(c),.f(f));

initial
begin

c=0; i=0; #10;
c=0; i=1; #10;
c=1; i=0; #10;
c=1; i=1; #10;
$finish;
end
endmodule
