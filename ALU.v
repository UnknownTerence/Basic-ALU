module ALU #(
	parameter data_width = 8
)(
	input [data_width - 1:0] a, // 8 bit input A
	input [data_width - 1:0] b, // 8 bit input B
	input [2:0] opcode, // 3 bit opcode, upto 8 operations
	output [data_width - 1:0] result, // final result
	output carry, // if the value overflows
	output zero // if two inputs are equal
);

	localparam OP_ADD = 3'b000;
	localparam OP_SUB = 3'b001;
	localparam OP_AND = 3'b010;
	localparam OP_OR = 3'b011;
	localparam OP_NOT = 3'b100;
	localparam OP_XOR = 3'b101;
	localparam OP_XNOR = 3'b110;
	localparam OP_NAND = 3'b111;

	reg [data_width:0] full_result; // larger to allow for the carry bit, reg type to allow use in always block

	always @(*) begin
		case (opcode)
			OP_ADD: full_result = a + b;
			OP_SUB: full_result = a - b;
			OP_AND: full_result = a & b;
			OP_OR: full_result = a | b;
			OP_NOT: full_result = ~a;
			OP_XOR: full_result = a ^ b;
			OP_XNOR: full_result = {1'b0, ~(a ^ b)}; // never overflows, so carry bit is set to 0
			OP_NAND: full_result = {1'b0, ~(a & b)}; // never overflows, so carry bit is set to 0
			default: full_result = 0; // incase of an error, or unexpected case
		endcase
	end
	
	assign result = full_result[data_width - 1:0]; // 8 bit result
	assign carry = full_result[data_width]; // if there is overflow
	assign zero = (result == 0); // 8 bit result is 0

endmodule
