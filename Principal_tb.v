`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:33:07 08/11/2015
// Design Name:   Principal
// Module Name:   C:/Users/Pablo/Documents/Academico/ITCR Electronica/ProyectoDigitales/Principal_tb.v
// Project Name:  ProyectoDigitales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Principal
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Principal_tb;

	// Inputs
	reg clk;
	reg reset;
	reg humo;
	reg [2:0] current;

	// Outputs
	wire Led1;
	wire Led2;
	wire Alarma2;
	wire [3:0] sel_display;
	wire [7:0] display;

	// Instantiate the Unit Under Test (UUT)
	Principal uut (
		.clk(clk), 
		.reset(reset), 
		.humo(humo), 
		.current(current), 
		.Led1(Led1), 
		.Led2(Led2), 
		.Alarma2(Alarma2), 
		.sel_display(sel_display), 
		.display(display)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		humo = 0;
		current = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
	#600000
	humo = 1;
	#600000
	humo = 0;
	#600000
	current = 3'b011;
	#600000
	current = 3'b100;
	#600000   
	reset = 1;
	#600000
	reset = 0;
	$stop;
	end  
	
endmodule

