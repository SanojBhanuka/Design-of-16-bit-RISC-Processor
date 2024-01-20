module top(input     clk, reset, 
           output  [15:0] WriteData, DataAdr, 
           output     MemWrite);

  wire [31:0] PC, Instr;
  wire [15:0] ReadData;
   
  // instantiate processor and memories
  riscprocessor processor(clk, reset, PC, Instr, MemWrite, DataAdr, 
                       WriteData, ReadData);
  instructionmem imemory(PC, Instr);
  datamem dmemory(clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule