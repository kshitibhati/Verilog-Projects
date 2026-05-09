//-----// fifo synchronous self check TB //---------------------------------------------------//

module fifo_sync_tb ();
//-----// port direction//-------------------------------------//      
	reg clk, rst ;
		
//-----// write signals//-------------------------------------//
    reg wr_en;
	reg [7:0] wr_data;
		
//-----// read signals//-------------------------------------//	
    reg rd_en;
    wire [7:0] rd_data;
	   
//-----// output flags//-------------------------------------//	   
	wire  full;
	wire empty;
	reg [3:0] wr_ptr; 
	reg [3:0] rd_ptr;
  //wire [15:0]rd_ptr;
	 
	fifo dut(.clk(clk),.rst(rst),.wr_data(wr_data),.wr_en(wr_en),.rd_en(rd_en),.rd_data(rd_data),.full(full),.empty(empty));
				  
//-----//reference model//----------------------------------//
  reg [7:0] rm [0:15];
  
  reg [7:0] temp_data;			  
				  
//-----//Reset task//-------------------------------------//
    task reset();
	  begin
      @(negedge clk);
        rst = 1 ;
      @(negedge clk);
        rst = 0 ;
      end
    endtask
	
//-----// Clock Generation//-----------------------------//
    initial begin
      clk = 0;
      forever #5 clk = ~clk;  
    end
   
//-----//Write task//------------------------------------//
    task write_fif0(input [7:0] wrr_data );
     begin
       @(negedge clk);
         wr_en = 1;
         wr_data = wrr_data ;
     end
    endtask
	
//-----//reset check//-----------------------------------//
  task reset_check();
    begin
      @(negedge clk);
      rst     = 1'b1;
      wr_en  = 1'b1;
      wr_ptr = 4'd10;
      wr_data = 8'd23;	  
      @(negedge clk);
      rd_en  = 1'b1;
      rd_ptr = 4'd10;
      @(posedge clk);
      if (rd_data !== 0)
	      $display("oops ! RESET IS NOT WORKING FINE !");
      else
          $display("RESET IS WORKING FINE !");
     end
  endtask
   
//-----//reference model logic//-------------------------//   
  initial begin
    forever begin
	 @(posedge clk);
	 if(!rst) begin // important to write as behaviour of rtl and tb will differ
	 if (wr_en && !full )begin
	    rm[wr_ptr] <= wr_data;
	   wr_ptr <= wr_ptr + 1;
	 end
	 if (rd_en && ! empty)begin
	    temp_data <= rm[rd_ptr];
		rd_ptr  <= rd_ptr + 1 ;
	    end
      end
     end
   end
   
  always@(posedge clk)
   if (rd_data !== 0 && rd_data !== 8'dx) begin
      if (rd_data !== temp_data)
	      $display($time," : DATA MISMATCH ! rd_data = %d : %d = temp_data",rd_data,temp_data);
	  else
          $display($time," : SUCCESS ! rd_data = %d : %d = temp_data",rd_data,temp_data);
   end

   initial begin
   reset_check();
     reset();
	  wr_en = 1;
	  rd_en = 0;
     repeat (15) write_fif0({$random});
   /*write_fif0(8'b00001010);
   write_fif0(8'b00001101);
	write_fif0(8'b00001111);
	write_fif0(8'b00000110);
   write_fif0(8'b00001010);
   write_fif0(8'b00001101);
	write_fif0(8'b00001111);
	write_fif0(8'b00000100);
   write_fif0(8'b10001010);
   write_fif0(8'b01001101);
	write_fif0(8'b00101111);
	write_fif0(8'b11000110);
   write_fif0(8'b01111010);
   write_fif0(8'b00011101);
	write_fif0(8'b0111_1101);*/
	
     @(negedge clk);
	 wr_en =0;
   	 rd_en=1;
	 repeat(3)@(negedge clk);
	 rd_en=0;
	 repeat(6)
	 write_fif0({$random});
	 @(negedge clk);
	 wr_en=0;
	 repeat(20)@(negedge clk);
	 rd_en=0;
	 @(negedge clk);
	 rd_en=1;
	 repeat(20)@(negedge clk);
	 @(negedge clk);
	 rd_en=0;
	 @ (negedge clk);
     $finish;
   end
 endmodule
   
   
	
