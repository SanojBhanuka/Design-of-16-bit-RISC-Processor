module extender(input   [31:7] instr,
              input   [1:0]  immsrc,
              output reg [15:0] immext);
 
  always @(*)
    case(immsrc) 
               // I-type 
      2'b00:   immext = {{4{instr[31]}}, instr[31:20]};  
               // S-type (stores)
      2'b01:   immext = {{4{instr[31]}}, instr[31:25], instr[11:7]}; 
               // B-type (branches)
      2'b10:   immext = {{4{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0}; 
               // J-type (jal)
      2'b11:   immext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0}; 
      default: immext = 16'bx; // undefined
    endcase       

//always @(*)
//    case(immsrc) 
//      // I-type 
//      2'b00: immext = {{16{instr[31]}}, instr[31:16]};
//      // S-type (stores)
//      2'b01: immext = {{16{instr[31]}}, instr[31:25], instr[11:7]};
//      // B-type (branches)
//      2'b10: immext = {{14{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
//      // J-type (jal)
//      2'b11: immext = {{16{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
//      default: immext = 16'bx; // undefined
//    endcase      
endmodule