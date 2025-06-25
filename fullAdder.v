module fullAdder(
    input A, 
    input B, 
    input Cin, 
    output S, 
    output Cout
	);

	wire P, G, H;
	halfAdder ha1(A,B,P,G);
	halfAdder ha2(P,Cin,S,H);
	// // Otra forma de instanciar
	// // No tiene que respetarse el
	// // Orden
	// half_adder ha2(
	// 	.A(P),
	// 	.B(Cin),
	// 	.S(S),
	// 	.Cout(H)
	// );

	or(Cout, G, H);

endmodule