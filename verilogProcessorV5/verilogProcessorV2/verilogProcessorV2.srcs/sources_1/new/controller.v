module controller(input   [6:0] op,
                  input   [2:0] funct3,
                  input         funct7b5,
                  input         Zero,
                  output  [1:0] ResultSrc,
                  output        MemWrite,
                  output        PCSrc, ALUSrc,
                  output        RegWrite, Jump,
                  output  [1:0] ImmSrc,
                  output  [2:0] ALUControl);

  wire [1:0] ALUOp;
  wire       Branch;
  //reg tempPCSrc; 

  maindecorder md(op, ResultSrc, MemWrite, Branch,
             ALUSrc, RegWrite, Jump, ImmSrc, ALUOp);
  aludecorder  ad(op[5], funct3, funct7b5, ALUOp, ALUControl);

  //assign PCSrc = tempPCSrc;
  assign PCSrc = Branch & Zero | Jump;
endmodule