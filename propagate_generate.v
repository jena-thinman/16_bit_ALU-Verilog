module propagate_generate(propagate,cout,A,B,Cin);
input wire [3:0] A,B;
input wire Cin;
output reg [3:0] propagate,cout;


always @(A,B,Cin)
begin

cout[0] = ((A[0]&B[0])|((A[0]^B[0])&(Cin)));
cout[1] = ((A[1]&B[1])|((A[1]^B[1])&(cout[0])));
cout[2] = ((A[2]&B[2])|((A[2]^B[2])&(cout[1])));
cout[3] = ((A[3]&B[3])|((A[3]^B[3])&(cout[2])));

propagate[0] <= (A[0]^B[0]);
propagate[1] <= (A[1]^B[1]);
propagate[2] <= (A[2]^B[2]);
propagate[3] <= (A[3]^B[3]);
end
endmodule