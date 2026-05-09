module bidirectional_buff (c,i,f);;
inout i,f;
input c;

bufif1 r (f,i,c);
bufif0 z (i,f,c);
endmodule
