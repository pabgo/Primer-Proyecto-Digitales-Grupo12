`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:46 07/31/2015 
// Design Name: 
// Module Name:    MaquinaPrincipal 
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
module MaquinaPrincipal(input wire clk, rst, corriente, humo,
								output reg alarma2/*, luz1, luz2, luz3*, alarma3*/);
								
		localparam signed a = 3'b000;
								b = 3'b001;
								c = 3'b010;
								d = 3'b011;
								e = 3'b100;
								f = 3'b101;
								g = 3'b110;
								h = 3'b111;
								
		reg [1:0] Estado =2'b00;
		
		always @(posedge clk) begin
			if(rst) begin
				Estado <=2'b00;
				alarma2 <= 1'b0;
			end
			
			else begin
				
				if(2'b00 == Estado) begin  //Estado 0
					alarma2 <= 1'b0;
					Estado <=2'b01;
				end//fin estado 0
				
				else if(2'b01 == Estado) begin  //Estado 1
					alarma2 <= 1'b0;
				
					if (corriente == (a ^ b ^ c ^ d)) begin
						Estado <=2'b10;
						luz1 <= 1'b1;
					end
					else if (corriente == (e ^ f)) begin
						Estado <=2'b01;
						luz2 <= 1'b1;
						alarma2 <= 1'b1;
					end
					else if (corriente == (g ^ h)) begin
						Estado <=2'b01;
						luz3 <= 1'b1;
						alarma3 <= 1'b1;
					end
				end//fin estado 1
				
				else if(2'b10 == Estado) begin  //Estado 2
					if (humo == 1'b1) begin
						Estado <=2'b10;
						luz2 <= 1'b1;
						alarma2 <= 1'b1;
					end
					else begin
						Estado <=2'b01;
					end	
				end//fin estado 2
				
			end//end else
			
		end//end always

endmodule
