
/* Lab 05 - Part 1				 */
/* ADD Sub-Module				 */
/* Group - 40*/


//The ADD functional unit adds together the two 8-bit numbers given in DATA1 and DATA2 and sends the answer to the RESULT output
//Contains a delay of 2 time units
//In real hardware  operations, like addition don't happen instantly .they take a small amount of time .
//So In simulations, we use delays to model this realistic behavior.
module ADD(DATA1, DATA2, RESULT);

	//Declarae two 8-bit data inputs
	input [7:0] DATA1, DATA2;
	
	//Declaration of output
	output [7:0] RESULT;
	
	// Perform addition of DATA1 and DATA2 with a propagation delay of 2 time units
	assign #2 RESULT = DATA1 + DATA2;
	
endmodule
