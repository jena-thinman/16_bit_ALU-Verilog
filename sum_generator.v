module sum_generator(CLA_sum,CLA_Cout,CLA_Cout_prev,CLA_A,CLA_B,CLA_Cin);
input wire [3:0] CLA_A,CLA_B;
input wire CLA_Cin;
wire [3:0] CLA_Prop,CLA_carry;
output reg [3:0] CLA_sum;
output reg CLA_Cout,CLA_Cout_prev;

propagate_generate G_P_instant(.propagate(CLA_Prop),.cout(CLA_carry),.A(CLA_A),.B(CLA_B),.Cin(CLA_Cin));

always @(*)
begin

CLA_sum[0] <= CLA_Prop[0]^CLA_Cin;
CLA_sum[1] <= CLA_Prop[1]^CLA_carry[0];
CLA_sum[2] <= CLA_Prop[2]^CLA_carry[1];
CLA_sum[3] <= CLA_Prop[3]^CLA_carry[2];
CLA_Cout <= CLA_carry[3];
CLA_Cout_prev <= CLA_carry[2];
end
endmodule