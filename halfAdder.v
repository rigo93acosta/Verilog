module halfAdder(
	input A,
	input B,
	output S,
	output Cout
);

	and(Cout, A, B);
	xor(S, A, B);
endmodule