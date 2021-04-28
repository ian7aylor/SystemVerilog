/*
Author: Ian Taylor


verilog review week1_2
	Link: C:\Learning\GeneralInformation - CurrentQuarter\Spring2021\ECE544_EmbeddedSystemDesign\SV_Workshop_Review\ece508vlogwkspf20_week1_1_lecnotes.pdf
	Gate level modeling
	Language rules
	Simulating digital systems

	Notes:
		Basic Gate Type primitives
			and, or, xor, nand, nor, xnor
			buf (non-inverting), not 
			bufif1, notif1, bufif0, notif0 - tri-state buffers
			
			syntax    <gate_type> <instancename>(out,in1,in2...);
			
			x is unknown, can be a 1 or 0
			z is Hi-Z - open circuit
			
	SV is similar to C
		Case sensitive
	3 types of operators
		unary
		binary
		ternary
	
			
*/

//D-Flip-Flop Structural (gate level) model

module gate_adder ( a, b, cin, sum, cout);
	output logic sum, co;
	input logic  a, b, cin;
	logic n1, n2, n3;
	
	// all gates have 0 delay
	
	xor 	g1(n1, a, b);
	xor		g2(sum, n1, cin);
	and 	g3(n2, a, b);
	and 	g4(n3, n1, cin);
	or		g5(cout, n2, n3);
endmodule