module ALU_tb;
  
  reg [7:0] a, b; // input values
  reg [2:0] opcode; // opcode for operation to perform
  wire [7:0] result; // results
  wire carry, zero; // carry and zeros
  
  // instantiating the ALU
  ALU testing(a, b, opcode, result, carry, zero);
  
  initial begin
    a = 8'd15; b = 8'd66; opcode = 3'b000; // addition
    #10; // 10 ns delay
    
    a = 8'd15; b = 8'd66; opcode = 3'b001; // subtraction
    #10; // 10 ns delay
    
    a = 8'd15; b = 8'd66; opcode = 3'b011; // OR
    #10; // 10 ns delay
    
    a = 8'd15; b = 8'd66; opcode = 3'b111;// NAND
    #10; // 10 ns delay
    
    $finish;
  end

  // printing results at time intervals
  initial begin
    $monitor("At time %t: a=%b, b=%b, result=%b", $time, a, b, result);
  end
  
endmodule
