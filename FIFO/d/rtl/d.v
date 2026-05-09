module demux1to4(
     wr_data,
     wr_sel,
    a,b,c,d,wr_enb,rst,
   clk);

    input [3:0] wr_data;
    output [1:0] wr_sel;
    input wr_enb, clk, rst;
    output reg[3:0] a,b,c,d;
reg [1:0] count;
reg [1:0] temp;

always @ (posedge clk)begin
if (rst) begin
temp <= 0;
count <= 0;
end
else if (temp== 2'd3)begin
temp=0;
count<=count+1;
end
else if (count==2'd3)
count<=0;
else temp<=temp+1;
end

assign wr_sel=count;
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

