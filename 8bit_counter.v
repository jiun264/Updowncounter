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
  input wire clk,      // clock輸入
  input wire rst,      // 同步清除輸入
  input wire up_down,  // 上/下數控制輸入
  output reg [7:0] count  // 8位元計數器輸出
);

always @(posedge clk or posedge rst) begin
  if (rst)  // 清零計數器
    count <= 8'b0;
  else if (up_down)  // 如果上/下數控制為高，則進行加法操作
    count <= count + 1;
  else  // 否則進行減法操作
    count <= count - 1;
end

endmodule

