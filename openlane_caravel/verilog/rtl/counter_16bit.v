`default_nettype none
module counter_16bit #(
       parameter BITS =32
) (
 `ifdef USE_POWER_PINS
    inout vccd1,
    inout vssd1,
    `endif
    input clk, 
    input reset,
    output [3:0] count,
    output [3:0] io_oeb
  );
    wire clk;
    wire reset;

    reg [3:0] count;
    reg [3:0] io_oeb;

    assign io_oeb = 4'b0000;

    always @(negedge clk or posedge reset )
         if (reset) 
              count <= 4'b0000;
         else
               count <= count + 1'b1;
endmodule // counter
