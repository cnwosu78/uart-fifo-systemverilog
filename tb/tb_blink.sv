module tb_blink;
  reg clk = 0; wire led;
  blink dut(.clk(clk), .led(led));
  always #5 clk = ~clk;
  initial begin
    $dumpfile("blink.vcd"); $dumpvars(0, tb_blink);
    #1000 $finish;
  end
endmodule
