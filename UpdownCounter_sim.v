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


`timescale 1ns/1ps  // �]�w�ɶ��ث�

module UpDownCounter_tb;

  // �ŧi���եx�һݪ��H��
  reg clk;
  reg rst;
  reg up_down;
  wire [7:0] count;

  // �I�s�W/�U�ƭp�ƾ��Ҷ�
  UpDownCounter uut (
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .count(count)
  );

  // ����clock
  always begin
    #5 clk = ~clk;
  end

  // ���յ{��
  initial begin
    // ��l��
    clk = 0;
    rst = 0;
    up_down = 0;

    // �P�B�M���A�W��
    #10 rst = 1;
    #10 up_down = 1;
    #20;
    $display("Count is %h", count);  // ����p�ƾ����Ȭ� 1
    
    // ��k
    #10 up_down = 0;
    #20;
    $display("Count is %h", count);  // ����p�ƾ����Ȭ� 0
    
    // �A��@��
    #10;
    $display("Count is %h", count);  // ����p�ƾ����Ȭ� 255�]����^

    // ���զP�B�M��
    #10 rst = 0;
    #20;
    $display("Count is %h", count);  // ����p�ƾ����Ȭ� 0
   
    $stop;  // ����
  end

endmodule


