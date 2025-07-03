
/* Lab 05 - Part 1				 */
/* OR Sub-Module				 */
/* Group - 40*/


//The OR functional unit performs the logical OR operation on the two 8-bit numbers given in DATA1 and DATA2 and sends the answer to the RESULT output
//Contains a delay of 1 time unit
//In real hardware  operations, they don't happen instantly .they take a small amount of time .
//So In simulations, we use delays to model this realistic behavior.
module OR(DATA1, DATA2, RESULT);

	//Input port declaration
	input [7:0] DATA1, DATA2;
	
	//Declaration of output port
	output [7:0] RESULT;
	
	//Perform logical OR of DATA1 and DATA2 with a propagation delay of 1 time units
	assign #1 RESULT = DATA1 | DATA2;
	
endmodule
