/*
Author: Ian Taylor

Data types:
	wire, reg, integer, tri,...
	logic

verilog review week1_1
	Link: C:\Learning\GeneralInformation - CurrentQuarter\Spring2021\ECE544_EmbeddedSystemDesign\SV_Workshop_Review\ece508vlogwkspf20_week1_1_lecnotes.pdf
	Course overview
	Intro to SystemVerilog
	Tech Overview
*/

//D-Flip-Flop Structural (gate level) model

module DFF_Struct ( q, d, clk, reset);
	output logic q;
	input logic  d;
	input logic clk, reset;
	
	logic s, sbar, r, rbar, q, qbar;
	logic clkbar, cbar;
	
	not inv1(cbar, clear);
	not inv2(clkbar, clk);
	
	nand sr1g1(sbar,rbar, s);
	nand srig2(s, sbar, cbar, clkbar);
	
	nand sr2g1(r,rbar, clkbar,s);
	nand sr2g2(rbar, r, cbar, d);

	nand sr3g1(q, s, qbar);
	nand sr3g2(qbar, q, r, cbar);

endmodule 

//D Flip-Flop Behavioral Model --> RTL Model

module DFF_RTL(q, d, clk, reset);
	output logic q;
	input logic d, clk, reset;
	
	always_ff @(negedge clk or posedge reset) begin
		if (reset)
			q <= 1'b0;
		else
			q <= d;
	end
endmodule