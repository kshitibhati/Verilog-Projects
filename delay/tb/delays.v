/*  */
module delays();

reg a,b,c,d,e,f;

reg [2:0] x;

//additive nature of regular & Intra delay
initial begin
 a = 1'b1; //0 simulation time
 b = #5 1'b0; //5 ns simulation time            //temp =  1'b0; #5 b = temp;
 c <= #10 1'b1;// 15 ns simulation time
 #25;
 d = 1'b1; // 30ns simulation time. it won't concider non-blocking delay.
 a = #10 1'b0;//40ns
 #20;
 e = 1'b0;//60ns
 b <= 1'b1;//60ns
 f <= #10 1'b1; // 70ns
 #20 $finish; //80ns
end

//intra assignment delay effect
initial begin
x = 0;//0ns
#5;
x <= #10 3'd6;//15ns
x = 3'd7;//5ns
end

initial begin
#10;
x = 3'd3;// 10ns
//x <= #20 3'd3;
#15 $finish;
end

endmodule
 
