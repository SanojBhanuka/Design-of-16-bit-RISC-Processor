module maindecorder(input   [6:0] op,
               output reg [1:0] ResultSrc,
               output reg       MemWrite,
               output reg       Branch, ALUSrc,
               output reg       RegWrite, Jump,
               output reg [1:0] ImmSrc,
               output reg [1:0] ALUOp);

  wire [10:0] tempcontrols;

  assign tempcontrols = {RegWrite, ImmSrc, ALUSrc, MemWrite,
          ResultSrc, Branch, ALUOp, Jump};
          
// reg [10:0] controls;
// assign controls = tempcontrols;

  always @(*)
    casex (op)
    // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUOp_Jump
      7'b0000011:  // lw
          begin 
            RegWrite = 1'b1;    
            ImmSrc =  2'b00;
            ALUSrc =  1'b1;
            MemWrite = 1'b0;
            ResultSrc = 2'b01;
            Branch = 1'b0;
            ALUOp = 2'b00;
            Jump = 1'b0;
          end
      7'b0100011:  // sw
          begin 
            RegWrite = 1'b0;   
            ImmSrc =  2'b01;
            ALUSrc =  1'b1;
            MemWrite = 1'b1;
            ResultSrc = 2'b00;
            Branch = 1'b0;
            ALUOp = 2'b00;
            Jump = 1'b0;
          end
      7'b0110011:  // R-type 
          begin 
            RegWrite = 1'b1;   
            ImmSrc =  2'bxx;
            ALUSrc =  1'b0;
            MemWrite = 1'b0;
            ResultSrc = 2'b00;
            Branch = 1'b0;
            ALUOp = 2'b10;
            Jump = 1'b0;
          end
      7'b1100011: // beq
           begin 
            RegWrite = 1'b0;   
            ImmSrc =  2'b10;
            ALUSrc =  1'b0;
            MemWrite = 1'b0;
            ResultSrc = 2'b00;
            Branch = 1'b1;
            ALUOp = 2'b01;
            Jump = 1'b0;
          end
      7'b0010011:  // I-type ALU
          begin 
            RegWrite = 1'b1;   
            ImmSrc =  2'b00;
            ALUSrc =  1'b1;
            MemWrite = 1'b0;
            ResultSrc = 2'b00;
            Branch = 1'b0;
            ALUOp = 2'b10;
            Jump = 1'b0;
          end
      7'b1101111:  // jal
          begin 
            RegWrite = 1'b1; 
            ImmSrc =  2'b11;
            ALUSrc =  1'b0;
            MemWrite = 1'b0;
            ResultSrc = 2'b10;
            Branch = 1'b0;
            ALUOp = 2'b00;
            Jump = 1'b1;
          end
      default:  // non-implemented instruction
           begin 
            RegWrite = 1'bx;  
            ImmSrc =  2'bxx;
            ALUSrc =  1'bx;
            MemWrite = 1'bx;
            ResultSrc = 2'bxx;
            Branch = 1'bx;
            ALUOp = 2'bxx;
            Jump = 1'bx;
          end
    endcase
endmodule