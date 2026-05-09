module full_adder (a,b,c_in,sum,carry);
input a,b,c_in;
output sum,carry;
wire w1,w2,w3;
xor s1 (w1,a,b);
xor s2 (sum,w1,c_in);
and p1 (w2,w1,c_in);
and p2 (w3,a,b);
or cr (carry,w2,w3);
endmodule 
