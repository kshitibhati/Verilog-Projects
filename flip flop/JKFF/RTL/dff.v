module dff (input d, clk,output q);

always @ (posedge clk);
begin
  q = d;
  !q = q;
end

endmodule
