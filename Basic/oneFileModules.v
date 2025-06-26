module operations (
    input A,
    input B,
    input C,
    output S
);

    wire w1;

    twoOperations op1(
        .A(A),
        .B(B),
        .S(w1)
    );
    twoOperations op2(
        .A(w1),
        .B(C),
        .S(S)
    );

endmodule

module twoOperations (
    input A,
    input B,    
    output S
);
    wire w1;
    not(w1, A);
    and(S, w1, B);
endmodule