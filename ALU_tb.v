module ALU_tb;
  
  reg signed [7:0] a, b; // input values
  reg [2:0] opcode; // opcode for operation to perform
  wire [7:0] result; // results
  wire carry, zero, negative; // flags
  
  // instantiating the ALU
  ALU testing(a, b, opcode, result, carry, zero);
  
  initial begin
    a = 8'd15; b = -8'd66; opcode = 3'd0; // addition
    #10; // 10 ns delay
    
    a = 8'd15; b = -8'd66; opcode = 3'd1; // subtraction
    #10; // 10 ns delay
    
    a = 8'd15; b = -8'd66; opcode = 3'd2; // AND
    #10; // 10 ns delay
    
    a = 8'd15; b = -8'd66; opcode = 3'd3;// OR
    #10; // 10 ns delay
    
    a = 8'd15; b = -8'd66; opcode = 3'd4; // NOT
    #10; // 10 ns delay
    
    a = 8'd15; b = -8'd66; opcode = 3'd5; // XOR
    #10; // 10 ns delay
    
    a = 8'd15; b = -8'd66; opcode = 3'd6; // XNOR
    #10; // 10 ns delay
    
    a = 8'd15; b = -8'd66; opcode = 3'd7;// NAND
    #10; // 10 ns delay
    
    $finish;
  end

  // printing results at time intervals
  initial begin
    $monitor("At time %t: a=%b, b=%b, result=%b, carry=%b, zero=%b, negative=%b", $time, a, b, result, carry, zero, negative);
  end
  
endmodule
