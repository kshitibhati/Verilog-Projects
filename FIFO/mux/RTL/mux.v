

module mux (e,f,g,h ,rd_sel,rd_data,rd_enb,reset,clk);
input [3:0]e,f,g,h;
input reset,rd_enb,clk;
output reg rd_data;
output [1:0] rd_sel ;


counter dut (.rd_enb(rd_enb),.y(rd_sel),.reset(reset),.clk(clk));
assign y = rd_sel;
always @(rd_sel or e or f or g or h)
    begin
        case (rd_sel)  
         
            2'b00 :rd_data = e;
                       
            2'b01 :rd_data = f;
                       
            2'b10 :rd_data = g;
                        
            2'b11 :rd_data = h;
        endcase
     end


endmodule













