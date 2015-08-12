`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:46:15 08/11/2015
// Design Name:   FSM
// Module Name:   C:/Users/Pablo/Documents/Academico/ITCR Electronica/ProyectoDigitales/FSM_tb.v
// Project Name:  ProyectoDigitales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_tb;

	// Inputs
	reg clk;
	reg reset;
	reg humo;
	reg [2:0] corriente;

	// Outputs
	wire LuzNormal;
	wire LuzAlerta;
	wire AlarmaAlerta;
	wire [3:0] hexa3;
	wire [3:0] hexa2;
	wire [3:0] hexa1;
	wire [3:0] hexa0;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.reset(reset), 
		.humo(humo), 
		.corriente(corriente), 
		.LuzNormal(LuzNormal), 
		.LuzAlerta(LuzAlerta), 
		.AlarmaAlerta(AlarmaAlerta), 
		.hexa3(hexa3), 
		.hexa2(hexa2), 
		.hexa1(hexa1), 
		.hexa0(hexa0)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		humo = 0;
		corriente = 3'b000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever #50 clk=~clk;
	end
		
		initial begin
		
		#100
		reset= 1'b0;
		corriente= 3'b000;
		humo = 1'b0;
		
		#100
		reset= 1'b0;
		corriente= 3'b001;
		humo = 1'b0;
		
		#100
		reset= 1'b0;
		corriente= 3'b010;
		humo = 1'b0;
		
		#100
		reset= 1'b0;
		corriente= 3'b011;
		humo = 1'b0;
		
		#100
		reset= 1'b0;
		corriente= 3'b100;
		humo = 1'b0;
		
		#100
		reset= 1'b0;
		corriente= 3'b101;
		humo = 1'b0;
		
		#100
		reset= 1'b0;
		corriente= 3'b110;
		humo = 1'b0;
		
		#100
		reset= 1'b0;
		corriente= 3'b111;
		humo = 1'b0;
		
		#200
		reset= 1'b0;
		corriente= 3'b011;
		humo = 1'b1;
		
		#100
		reset= 1'b0;
		corriente= 3'b011;
		humo = 1'b0;
		
		#100
		reset= 1'b1;
		corriente= 3'b011;
		humo = 1'b0;
		
		#100
		reset= 1'b0;
		corriente= 3'b011;
		humo = 1'b0;
		
		#150
		
		$stop;
		
	end
	
endmodule

