module bidirectional_tb ();

wire i,f;
reg temp_i, temp_f,c ;

bidirectional_buff DUI (.c(c),.i(i),.f(f));
assign i=temp_i;
assign f=temp_f;
initial
begin
c=0; temp_i=1'bz;temp_f=1; #10;
c=1; temp_f=1'bz;temp_i=1; #10;
c=0; temp_i=1'bz;temp_f=0; #10;
c=1; temp_f=1'bz;temp_i=0; #10;
$finish;
end
endmodule
 