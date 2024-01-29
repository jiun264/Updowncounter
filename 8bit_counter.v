`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 16:55:26
// Design Name: 
// Module Name: 8bit_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UpDownCounter (
  input wire clk,      // clock��J
  input wire rst,      // �P�B�M����J
  input wire up_down,  // �W/�U�Ʊ����J
  output reg [7:0] count  // 8�줸�p�ƾ���X
);

always @(posedge clk or posedge rst) begin
  if (rst)  // �M�s�p�ƾ�
    count <= 8'b0;
  else if (up_down)  // �p�G�W/�U�Ʊ�����A�h�i��[�k�ާ@
    count <= count + 1;
  else  // �_�h�i���k�ާ@
    count <= count - 1;
end

endmodule

