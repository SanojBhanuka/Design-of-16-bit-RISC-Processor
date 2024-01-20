module alu(input   [15:0] a, b,
           input   [2:0]  alucontrol,
           output reg [15:0] result,
           output         zero);

  wire [15:0] condinvb, sum;
  wire        v;              // overflow
  wire        isAddSub;       // true when is add or subtract operation

  assign condinvb = alucontrol[0] ? ~b : b;
  assign sum = a + condinvb + alucontrol[0];
  assign isAddSub = ~alucontrol[2] & ~alucontrol[1] |
                    ~alucontrol[1] & alucontrol[0];

  always @(*)
    casex (alucontrol)
      3'b000:  result = sum;         // add
      3'b001:  result = sum;         // subtract
      3'b010:  result = a & b;       // and
      3'b011:  result = a | b;       // or
      3'b100:  result = a ^ b;       // xor
      //3'b101:  result = sum[31] ^ v; // slt
      3'b101:  result = (a[15] ^ v) ? 16'hFFFF : 16'h0000; // slt
      3'b110:  result = a << b[3:0]; // sll
      3'b111:  result = a >> b[3:0]; // srl
      default: result = 16'bx;
    endcase

  assign zero = (result == 16'h0000);
  assign v = ~(alucontrol[0] ^ a[15] ^ b[15]) & (a[15] ^ sum[15]) & isAddSub;
  
endmodule