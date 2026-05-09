module full_adder (a,b,c_in,sum,carry);
input a,b,c_in;
output sum,carry;
wire sum1,sum2,carry1,carry2;

half_adder g1(.a(a),.b(b),.sum(sum1),.carry(carry1));
half_adder g2(.a(sum1),.b(c_in),.sum(sum2),.carry(carry2));
or c (carry,carry1,carry2);
endmodule


