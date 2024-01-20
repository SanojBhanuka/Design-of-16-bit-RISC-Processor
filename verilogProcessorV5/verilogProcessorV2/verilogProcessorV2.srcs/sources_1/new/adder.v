
module adder(input  [31:0] a,
             input  [15:0] b,
             output [31:0] y);

  wire [31:0] b_extended; // Create a temporary wire for extending b to 32 bits

  assign b_extended = {{16{b[15]}}, b}; // Zero-pad b to 32 bits

  assign y = a + b_extended; // Add a and the extended b

endmodule
