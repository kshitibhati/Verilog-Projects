
 module demux1to4(
     wr_data,
     wr_sel,
    a,b,c,d,wr_enb,reset,
   clk);

    input [3:0] wr_data;
    output [1:0] wr_sel;
    input wr_enb, clk, reset;
    output reg[3:0] a,b,c,d;
    
 counter dut (.wr_enb(wr_enb),.x(wr_sel),.reset (reset),. clk(clk));
assign x = wr_sel; 

 always @(wr_data or wr_sel)
    begin
        case (wr_sel)  
         
            2'b00 :a = wr_data[0]; 
                       
            2'b01 :b = wr_data[1];
                       
            2'b10 : c = wr_data[2];
                        
            2'b11 : d = wr_data[3];
        endcase
end

endmodule
   


