`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 17:03:52
// Design Name: 
// Module Name: UpdownCounter_sim
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


`timescale 1ns/1ps  // 設定時間尺度

module UpDownCounter_tb;

  // 宣告測試台所需的信號
  reg clk;
  reg rst;
  reg up_down;
  wire [7:0] count;

  // 呼叫上/下數計數器模塊
  UpDownCounter uut (
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .count(count)
  );

  // 產生clock
  always begin
    #5 clk = ~clk;
  end

  // 測試程式
  initial begin
    // 初始化
    clk = 0;
    rst = 0;
    up_down = 0;

    // 同步清除，上數
    #10 rst = 1;
    #10 up_down = 1;
    #20;
    $display("Count is %h", count);  // 期望計數器的值為 1
    
    // 減法
    #10 up_down = 0;
    #20;
    $display("Count is %h", count);  // 期望計數器的值為 0
    
    // 再減一次
    #10;
    $display("Count is %h", count);  // 期望計數器的值為 255（溢位）

    // 測試同步清除
    #10 rst = 0;
    #20;
    $display("Count is %h", count);  // 期望計數器的值為 0
   
    $stop;  // 結束
  end

endmodule


