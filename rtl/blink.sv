module blink(input clk, output reg led);
  reg [3:0] c = 0;
  always @(posedge clk) begin c <= c + 1; if (c == 0) led <= ~led; end
  initial led = 0;
endmodule
