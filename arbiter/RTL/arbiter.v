module arbiter (clk,rst,rq0,rq1,rq2,gt1,gt2,gt0,timeout);
input clk,rst;
input rq0, rq1, rq2;
output gt0,gt1,gt2;
reg [2:0] pr_state,next_state,temp_state; 
reg [3:0] timer;
wire state_change;
output timeout;

parameter idle=3'b000,
          grnt0=3'b001,
          grnt1=3'b010,
          grnt2=3'b011;
			 
always @(posedge clk)  
temp_state <= pr_state;

assign state_change = (pr_state!=temp_state)?1:0;
assign timeout = (timer == 3'd5)?1:0;
			 

always @ (posedge clk) begin
if (rst)begin
    pr_state <= idle;
//timer <= 0;
end
else
   pr_state <= next_state;
end

always @ (posedge clk) begin
if (timer ==3'd5 || state_change)
    timer <= 0;
else
    timer<= timer + 1;
end

always @ ( pr_state , rq0 , rq1 ,rq2)
begin
case (pr_state)

idle : if (rq0)
       next_state <= grnt0;
       else if (rq1)
       next_state <= grnt1;
       else if (rq2)
       next_state <= grnt2;
       else next_state <= idle;

grnt0 : if ((!rq0 && rq1) || (rq0 && rq1 && timeout))
        next_state <= grnt1;
        else if ((!rq0 && !rq1 && rq2) || (rq0 && !rq1 && rq2 && timeout))
        next_state <= grnt2;
		  else if (!rq0 && !rq1 && !rq2)
		  next_state <= idle;
        else next_state <= grnt0;

grnt1 : if ((rq0 && !rq1 ) || (rq0 && !rq1 && timeout))
        next_state <= grnt0;
        else if ((!rq0 && !rq1 && rq2)|| (!rq0 && rq1 && rq2 && timeout))
        next_state <= grnt2;
		  else if (!rq0 && !rq1 && !rq2)
		  next_state <= idle;
        else next_state <= grnt1;

grnt2: if ((rq0 && !rq2) || (rq0 && !rq1 && rq2 && timeout))
       next_state <= grnt0;
       else if ((!rq0 && rq1 && !rq2)|| (!rq0 && rq1 && rq2 && timeout))
       next_state <= grnt1;
		 else if (!rq0 && !rq1 && !rq2)
		 next_state <= idle;
       else next_state <= grnt2;  
endcase
end

/*always @ (pr_state)
begin if (pr_state==grnt1)
      grnt[1] = 1;
      else if (pr_state==grnt2)
      grnt[2] = 1;
      if (pr_state==grnt0)
      grnt[0] = 1;*/

assign gt0 = (pr_state == grnt0);
assign gt1 = (pr_state == grnt1);
assign gt2 = (pr_state == grnt2);

endmodule


