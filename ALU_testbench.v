module ALU_testbench();
reg [7:0] A,B;
reg [2:0] Select;
reg [7:0] Resultx;
reg Cx,Vx,Nx,Zx;
wire [7:0] Result;
wire N,V,C,Z;
integer K;

parameter vecs = 21;
reg [30:0] vec [0:vecs-1];

ALU DUT(.A(A),.B(B),.Select(Select),.Result(Result),.N(N),.C(C),.V(V),.Z(Z));

initial begin
A=0;
B=0;

$readmemb("C:\\Users\\soura\\Desktop\\ALU module\\testalu.txt", vec);
#100;
	for(K=0;K<vecs;K=K+1)
	begin
	{Select,A,B,Resultx,Nx,Vx,Zx,Cx}=vec[K];
	#5;
	if({Resultx,Nx,Vx,Cx}!={Result,N,V,C})
	$display ("Mismatch on vector %0h, Expected %0b, Actual %0b", K, {Resultx,Nx,Vx,Zx,Cx}, {Result,N,V,Z,C});
	else
	$display ("Vector %0b OK", K);
	end

end
endmodule