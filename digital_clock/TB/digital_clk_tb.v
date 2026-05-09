module digital_clk_tb ();

    reg clk;
    reg reset;
	 
    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours;

    
digital_clk xiti (.clk(clk), .reset(reset), .seconds(seconds), .minutes(minutes), .hours(hours));  
   
    
initial 
begin
  clk = 1;
end
initial
  forever
  #5 clk = !clk; 
  
initial
begin
@ (negedge clk);
reset = 1;
@ (negedge clk);
reset = 0;
@ (negedge clk);
end

      
endmodule
