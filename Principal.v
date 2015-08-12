`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:57:48 08/10/2015 
// Design Name: 
// Module Name:    Principal 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Principal
#(parameter N = 3)
(
	input wire clk,reset, //	Clock y reset
	input wire humo,// Banderas de entrada
	input wire [N-1:0] current,
	output wire Led1,Led2, Alarma2,// Salidas
	output wire [3:0] sel_display,
	output wire [7:0] display
);

wire [3:0] hex3,hex2,hex1,hex0;

// Instantiate the module
FSM maquina_estados (
    .clk(clk), 
    .reset(reset), 
    .humo(humo), 
    .corriente(current), 
    .LuzNormal(Led1), 
    .LuzAlerta(Led2), 
    .AlarmaAlerta(Alarma2), 
    .hexa3(hex3), 
    .hexa2(hex2), 
    .hexa1(hex1), 
    .hexa0(hex0)
    );
	 
	 
// Instantiate the module
sseg_display cuatro_digitos (
    .clk(clk), 
    .reset(reset), 
    .hexa3(hex3), 
    .hexa2(hex2), 
    .hexa1(hex1), 
    .hexa0(hex0), 
    .dps(4'hf), 
    .selec_disp(sel_display), 
    .sseg(display)
    );
	 

endmodule
