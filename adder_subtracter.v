module adder_subtracter(Carry_out,zero,Overflow,Negative,SUM,in_A,in_B,control_in);
input wire [7:0] in_A,in_B;
input wire control_in;
wire interstage_carry,Carry_out_prev;
output [7:0] SUM;
output Carry_out;
output reg Overflow,Negative,zero;
wire [7:0] in_B_wire;


assign in_B_wire = control_in ? (~in_B):(in_B);

sum_generator LSB_four_bits(.CLA_sum(SUM[3:0]),.CLA_Cout(interstage_carry),.CLA_A(in_A[3:0]),.CLA_B(in_B_wire[3:0]),.CLA_Cin(control_in));

sum_generator MSB_four_bits(.CLA_sum(SUM[7:4]),.CLA_Cout(Carry_out),.CLA_Cout_prev(Carry_out_prev),.CLA_A(in_A[7:4]),.CLA_B(in_B_wire[7:4]),.CLA_Cin(interstage_carry));


always @(*)
begin

Overflow = Carry_out^Carry_out_prev;

	if(SUM==0)begin
	zero=1;
	end
	if(SUM[7]==1)begin
	Negative = 1;
	end
	if(SUM[7]!=1)begin
	Negative = 0;
	end
	if(SUM!=0)begin
	zero=0;
	end	
end
endmodule