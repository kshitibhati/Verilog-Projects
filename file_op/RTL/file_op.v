module file_op();

 reg [3:0] a, b;
 wire [4:0] sum;
 
 assign sum = a + b;
 
 reg [3:0] mem [0:5];
 
 integer ch, ch_a_b, ch_sum;
 
 initial begin
   $readmemb("D:/Verilog/file_op/SIM/file_op/check.v",mem);
   ch = $fopen("output.txt");
   ch_a_b = $fopen("a_b_input.txt");
   ch_sum = $fopen("sum_output.txt");
   a = 4'd12;
   b = 4'd5;
   #10;
   a = {$random};
   b = {$random};
   #10;
   a = mem[0];
   b = mem[1];
   #10;
     a = mem[2];
   b = mem[3];
   $fclose(ch_a_b);
   #10;
   a = mem[4];
   b = mem[5];
   #10;
   $fclose(ch);
   $fclose(ch_sum);
   #10;
   $finish;
  end
 
  initial begin
   $fmonitor(ch,"a = %d, b = %d => sum = %d",a,b,sum);
   $fmonitor(ch_a_b,"a = %d, b = %d",a,b);
   $fmonitor(ch_sum,"sum = %d",sum);
  end

endmodule