module controller(input logic clk, reset,
                  input logic [5:0] op, funct,  
                  input logic zero, 
                  output logic memtoreg, memwrite,
                  output logic alusrca,
                  output logic [1:0] alusrcb, pcsrc,
                  output logic regdst, regwrite,
                  output logic [2:0] alucontrol,
                  output logic IorD, irwrite,
                  output logic pcen); // ok
  logic [1:0] aluop;
  logic branch; // são coisas internas ao controle
  logic pcwrite;
  
  maindec md(clk, reset, op, memtoreg, memwrite, branch, alusrca, alusrcb, regdst, regwrite, IorD, irwrite, pcwrite, pcsrc, aluop);
  
  aludec ad(funct, aluop, alucontrol);
  
  // CHECAR AQUI 
  assign pand = branch && zero;
  assign pcen = pcwrite || pand;
endmodule