
/* Lab 05 - Part 1				 */
/* Testbench					 */
/* Group - 40*/


module testbench;

	//Input ports for ALU
	reg [7:0] op1, op2;//if we are going to change a value based on time or conditions,must use reg
	reg [2:0] sel;
	
	//Output port of ALU
	wire [7:0] result;
	
	//Instantiate the ALU
	alu my_alu(op1, op2, result, sel);
	
	//Simulate changes to inputs to test ALU output behaviour
	initial begin
		//Forwarding
		op1 = 5;	
		op2 = 7;
		sel = 0;
		
		#5//wait 5 time units before next
		
		//Add operation
		sel = 1;
		
		#5
		
		//And operation with different values
		sel = 2;

		#5
		
		//or operation
		sel = 3;
		
		
	end
	
	//Initial block to monitor changes and dump wavedata to vcd file
	initial begin
		$dumpfile("wavedata.vcd");//Creates a file to store simulation waveform data 
		$dumpvars(0, my_alu);//Dumps all variable values in my_alu into the .vcd file.
		$monitor("TIME = %g OP1 = %d OP2 = %d SEL = %b RESULT = %d", $time, op1, op2, sel, result);//Prints real-time changes to the console
		#50 $finish;// Ends the simulation after 50 time units
	end

endmodule
