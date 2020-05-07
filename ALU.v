module ALU(A,B,Select,C,N,V,Z,Result);
input [7:0] A,B;
input [2:0] Select;
output reg [7:0] Result;
output C,N,V,Z;
reg control_signal;

wire [7:0] wire_of_adder;

adder_subtracter ADD_OR_SUB(.Carry_out(C),.SUM(wire_of_adder),.in_A(A),.in_B(B),.control_in(control_signal),.Negative(N),.Overflow(V),.zero(Z));

always @(*)
begin

case(Select)
	3'b000: Result <= A & B;
			  
	3'b001: Result <= A | B;
			  
	3'b010: begin
				control_signal = 0;
				Result = wire_of_adder;
				end
	3'b011: Result = 8'bz;
	3'b100: Result <= A & (~B);
	3'b101: Result <= A | (~B);
	3'b110: begin
				control_signal = 1;
				Result = wire_of_adder;
				end
	3'b111: begin
				control_signal = 1;
			   case(wire_of_adder[7])
				1'b1: Result = 8'b1;
				1'b0: Result = 8'b0;
				endcase
				end
	endcase
	end
	
	endmodule
