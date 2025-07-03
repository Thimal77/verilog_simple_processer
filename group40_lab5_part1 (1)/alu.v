
/* Lab 05 - Part 1				 */
/* ALU Module					 */
/* Group - 40*/


/* The ALU module consists of two data inputs DATA1 and DATA2, 
one SELECT input to determine which ALU operation to perform on the two inputs 
and one RESULT output which gives the result of the given operation on the data */
module alu(DATA1, DATA2, RESULT, SELECT);
	
	//Declaration of input ports
	input [7:0] DATA1, DATA2;
	input [2:0] SELECT;
	
	//Output port declaration
	output reg [7:0] RESULT;//use reg because it's assigned inside an always block
	
	//Set of wires for outputs of each functional unit
	wire [7:0] forwardOut, addOut, andOut, orOut;
	
	
	//The functional units relevant to the different operations are instantiated here
	//Each of these does its job in parallel and keeps its result ready. The ALU will later choose one result based on the SELECT signal.
	FORWARD forwardUnit(DATA2, forwardOut);
	ADD addUnit(DATA1, DATA2, addOut);
	AND andUnit(DATA1, DATA2, andOut);
	OR orUnit(DATA1, DATA2, orOut);
	
	
//like a multiplexer (MUX):
//It monitors the output of each functional unit and the SELECT signal.
//Based on SELECT, it assigns one of those outputs to RESULT.
	always @ (forwardOut, addOut, andOut, orOut, SELECT)
	begin
		case (SELECT)		//Case statement to switch between the outputs

			3'b000 :	RESULT = forwardOut;	//SELECT = 0 : FORWARD
			
			3'b001 :	RESULT = addOut;		//SELECT = 1 : ADD
			
			3'b010 :	RESULT = andOut;		//SELECT = 2 : AND
			
			3'b011 :	RESULT = orOut;			//SELECT = 3 : OR
			
		endcase
	end
		
endmodule