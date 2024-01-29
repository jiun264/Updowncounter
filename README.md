# UpDownCounter

## UpDownCounter 模組

### 模組介紹

這個Verilog模組實現了一個8位元的上/下計數器，具有時鐘輸入、同步清除輸入、上/下數控制輸入和8位元計數器輸出。

### 使用方法

在Verilog項目中，將以下程式碼複製到您的設計中：

```verilog
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
```

## 測試台（Testbench）

### 測試台介紹

測試台確保UpDwonCounter模組的正確功能。它模擬了時鐘、同步清除、上/下數控制和計數器輸出，並提供了一系列的測試情境。

### 使用方法

在您的項目中，將以下程式碼複製到測試台中：

```verilog
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
```
