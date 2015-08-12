`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:40:46 08/11/2015
// Design Name:   sseg_display
// Module Name:   C:/Users/Pablo/Documents/Academico/ITCR Electronica/ProyectoDigitales/sseg_display_tb.v
// Project Name:  ProyectoDigitales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sseg_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sseg_display_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] hexa3;
	reg [3:0] hexa2;
	reg [3:0] hexa1;
	reg [3:0] hexa0;
	reg [3:0] dps;

	// Outputs
	wire [3:0] selec_disp;
	wire [7:0] sseg;

	// Instantiate the Unit Under Test (UUT)
	sseg_display uut (
		.clk(clk), 
		.reset(reset), 
		.hexa3(hexa3), 
		.hexa2(hexa2), 
		.hexa1(hexa1), 
		.hexa0(hexa0), 
		.dps(dps), 
		.selec_disp(selec_disp), 
		.sseg(sseg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		hexa3 = 4'h0;
		hexa2 = 4'h0;
		hexa1 = 4'h0;
		hexa0 = 4'h0;
		dps = 4'h0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		forever #50 clk=~clk;
		end
		
		initial begin
		
		#100
		reset = 0;
		hexa3 = 4'h1;
		hexa2 = 4'h2;
		hexa1 = 4'h3;
		hexa0 = 4'h4;
		dps = 4'hf;
		
		#300
		
		$stop;

	end
      
endmodule

