module datamem(input          clk, we,
            input   [15:0] a, wd,
            output  [15:0] rd);

  reg [15:0] RAM[15:0];
    
   initial begin
    RAM[3] = 16'h0009; // 16-bit binary value 0000_0000_0000_0111 (7 in decimal)
    end

  
  // assign rd = RAM[a[31:2]]; // word aligned
  assign rd = RAM[a[15:0]]; // word aligned

  always @(posedge clk)
    if (we) RAM[a[15:0]] <= wd;
endmodule