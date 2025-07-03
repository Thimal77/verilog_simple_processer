
/* Lab 05 - Part 1				 */
/* FORWARD Sub-Module			 */
/* Group - 40*/


//The FORWARD functional unit simply forwards the DATA input to the RESULT output
//Contains a delay of 1 time unit
//In real hardware  operations, they don't happen instantly .they take a small amount of time .
//So In simulations, we use delays to model this realistic behavior.
module FORWARD(DATA, RESULT);

	//Input port declaration
	input [7:0] DATA;
	
	//Output port declaration
	output [7:0] RESULT;
	
	//Perform  with a propagation delay of 1 time units
	assign #1 RESULT = DATA;

endmodule
