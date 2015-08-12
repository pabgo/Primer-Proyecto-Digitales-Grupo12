`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:04:22 08/08/2015 
// Design Name: 
// Module Name:    FSM 
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
module FSM
#(parameter N = 3)
	(
	input wire clk, reset, //	Clock y reset
	input wire humo,// Banderas de entrada
	input wire [N-1:0] corriente,
	output reg LuzNormal,LuzAlerta,AlarmaAlerta,// Salidas, definidas como reg
	output reg [3:0] hexa3,hexa2,hexa1,hexa0 //numeros en hexa
);

//*********************************************************

localparam [1:0] // Codificacion de los estados o etiquetas 
	inicio = 2'b00,
	estado_1 = 2'b01,
	estado_2 = 2'b10,
	estado_3 = 2'b11;

reg [1:0] estado, estado_proximo; // Reg, estado actual y siguiente 




//*********************************************************
//Parte Secuencial

always@(posedge clk, posedge reset)
	if (reset)
		estado <= inicio;
	else
		estado <= estado_proximo;


//*********************************************************

//Parte Combinacional
always@*
begin
   		
	estado_proximo = estado;
	LuzNormal = 1'b0;
	LuzAlerta = 1'b0;
	AlarmaAlerta = 1'b0;
	hexa3 = 4'h0;
	hexa2 = 4'h0;
	hexa1 = 4'h0;
	hexa0 = 4'h0;
	
	case(estado)

		inicio:
			begin
				LuzNormal = 1'b1;
				estado_proximo = estado_1;
				hexa3 = 4'h0;
				hexa2 = 4'h0;
				hexa1 = 4'h0;
				hexa0 = 4'h0;
			end
			
		estado_1:
			begin
			case (corriente)
			
				3'b000 : begin
					LuzNormal = 1'b1;
					estado_proximo = estado_2;
					hexa3 = 4'h8;
					hexa2 = 4'h4;
					hexa1 = 4'h9;
					hexa0 = 4'h7;
				end
				
				3'b001 : begin
					LuzNormal = 1'b1;
					estado_proximo = estado_2;
					hexa3 = 4'h8;
					hexa2 = 4'h4;
					hexa1 = 4'h9;
					hexa0 = 4'h7;
				end
				
				3'b010 : begin
					LuzNormal = 1'b1;
					estado_proximo = estado_2;
					hexa3 = 4'h8;
					hexa2 = 4'h4;
					hexa1 = 4'h9;
					hexa0 = 4'h7;
				end
				
				3'b011 : begin
					LuzNormal = 1'b1;
					estado_proximo = estado_2;
					hexa3 = 4'h8;
					hexa2 = 4'h4;
					hexa1 = 4'h9;
					hexa0 = 4'h7;
				end
				
				3'b100 : begin
					LuzAlerta = 1'b1;
					AlarmaAlerta = 1'b1;
					estado_proximo = estado_1;
					hexa3 = 4'h1;
					hexa2 = 4'h2;
					hexa1 = 4'h3;
					hexa0 = 4'h4;
				end
				
				3'b101 : begin
					LuzAlerta = 1'b1;
					AlarmaAlerta = 1'b1;
					estado_proximo = estado_1;
					hexa3 = 4'h1;
					hexa2 = 4'h2;
					hexa1 = 4'h3;
					hexa0 = 4'h4;
				end
				
				3'b110 : begin
					LuzAlerta = 1'b1;
					AlarmaAlerta = 1'b1;
					estado_proximo = estado_1;
					hexa3 = 4'h1;
					hexa2 = 4'h2;
					hexa1 = 4'h3;
					hexa0 = 4'h4;
				end
				
				3'b111 : begin
					LuzAlerta = 1'b1;
					AlarmaAlerta = 1'b1;
					estado_proximo = estado_1;
					hexa3 = 4'h1;
					hexa2 = 4'h2;
					hexa1 = 4'h3;
					hexa0 = 4'h4;
				end
				
				default: begin
					LuzNormal = 1'b1;
					estado_proximo = estado_2;
					hexa3 = 4'h8;
					hexa2 = 4'h4;
					hexa1 = 4'h9;
					hexa0 = 4'h7;
				end
				endcase
				end
								
		estado_2:
			begin
			if(humo == 1'b1) 
				begin
					estado_proximo = estado_2;
					LuzAlerta = 1'b1; 
					AlarmaAlerta = 1'b1;
					hexa3 = 4'h5;
					hexa2 = 4'h6;
					hexa1 = 4'h7;
					hexa0 = 4'h0;
				end
			else begin
					estado_proximo = estado_1;
					LuzNormal = 1'b1;
					hexa3 = 4'h8;
					hexa2 = 4'h4;
					hexa1 = 4'h9;
					hexa0 = 4'h7;					
				end
			end
			
		default:begin
					LuzNormal = 1'b1;
					estado_proximo = estado_1;
					hexa3 = 4'h0;
					hexa2 = 4'h0;
					hexa1 = 4'h0;
					hexa0 = 4'h0;
				end
			endcase
end
endmodule

