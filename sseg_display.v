`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:30:14 08/09/2015 
// Design Name: 
// Module Name:    sseg_display 
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
module sseg_display(input wire clk, reset,
		input wire [3:0] hexa3, hexa2, hexa1, hexa0, 
		input wire [3:0] dps,//Los puntos de cada display
		output reg [3:0] selec_disp, 
		output reg [7:0] sseg 
    );

//Rango de refresco de 800Hz
localparam N=18;
//Declaracion de señales internas
reg [N-1:0] estado;
wire [N-1:0] estado_proximo;
reg [3:0] hex_in;
reg punto;

//Contador de N-bits
always @(posedge clk, posedge reset)
	if (reset)
		estado <= 0;
	else
		estado <= estado_proximo;
//Logica estado siguiente
assign estado_proximo = estado+1'b1;

always@*
	case(estado[N-1:N-2])
		2'b00:
			begin
				selec_disp = 4'b1110;
				hex_in = hexa0;
				punto = dps[0];
			end
		2'b01:
			begin
				selec_disp = 4'b1101;
				hex_in = hexa1;
				punto = dps[1];
			end
		2'b10:
			begin
				selec_disp = 4'b1011;
				hex_in = hexa2;
				punto = dps[2];
			end
		default:
			begin
				selec_disp = 4'b0111;
				hex_in = hexa3;
				punto = dps[3];
			end
	endcase

//Hexa a 7 segmentos led display
always @*
begin 
	case (hex_in)
		4'h0: sseg [6:0] = 7'b0000001;
		4'h1: sseg [6:0] = 7'b0011000;
		4'h2: sseg [6:0] = 7'b0110000;
		4'h3: sseg [6:0] = 7'b1110001;
		4'h4: sseg [6:0] = 7'b1111001;
		4'h5: sseg [6:0] = 7'b1001000;
		4'h6: sseg [6:0] = 7'b1000001;
		4'h7: sseg [6:0] = 7'b0001001;
		4'h8: sseg [6:0] = 7'b0000000;
		4'h9: sseg [6:0] = 7'b0110000;
		
		4'ha: sseg [6:0] = 7'b0001000;
		4'hb: sseg [6:0] = 7'b1100000;
		4'hc: sseg [6:0] = 7'b0110001;
		4'hd: sseg [6:0] = 7'b1000010;
		4'he: sseg [6:0] = 7'b0000110;
		default: sseg [6:0] = 7'b0001110;			
	endcase
	sseg[7] = punto;
end
endmodule