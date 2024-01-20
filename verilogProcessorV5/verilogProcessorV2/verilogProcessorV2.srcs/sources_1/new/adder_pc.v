module adder_pc(input  [31:0] a, 
             input  [15:0] b,   // When PCaddbranch -  PC, ImmExt, PCTarget
             output [31:0] y); 

  assign y = a + b;
endmodule