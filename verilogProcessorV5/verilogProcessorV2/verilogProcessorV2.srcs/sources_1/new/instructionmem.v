module instructionmem(input   [31:0] a,
            output  [31:0] rd);

  reg [31:0] RAM[63:0];

  initial
          $readmemb("C:/Users/ASUS/OneDrive - engug.ruh.ac.lk/University/SEMESTER6/Syn/Processor/verilogProcessorV5/verilogProcessorV2/verilogProcessorV2.srcs/sources_1/new/instructionmemory.mem",RAM);
     
  assign rd = RAM[a[31:2]]; // word aligned
endmodule