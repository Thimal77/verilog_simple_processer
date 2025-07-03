/* CO224 - Computer Architecture */
/* Lab 05 - Part 2				 */
/* Register File				 */
/* Group - 40					 */


/*The reg_file module is an 8x8 register file with eight 8-bit registers. It supports
writing one value at a time and reading two values simultaneously. Write operations
are synchronous and occur on the rising edge of the CLK signal when the WRITE signal
is HIGH. Read operations are asynchronous, allowing immediate access to output values
based on the read addresses. When the RESET signal is HIGH, all registers are cleared to zero.
This module is useful in systems requiring compact, fast-access data storage such as small processors or control units. */

module reg_file(IN,OUT1,OUT2,INADDRESS,OUT1ADDRESS,OUT2ADDRESS, WRITE, CLK, RESET);

	//Declaration of IN(writable data), OUT1 and OUT2(readable data) ports
	//IN is an 8-bit input, OUT1 and OUT2 are 8-bit outputs
	//INADDRESS, OUT1ADDRESS and OUT2ADDRESS are 3-bit input addresses
	input [7:0] IN;
	input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;
	
	//Input ports for control signals
	//WRITE is a control signal to write data to the register
	//CLK is the clock signal for synchronous operations
	//RESET is a control signal to reset the registers
	input WRITE, CLK, RESET;
	
	//Output port the declaration
	//OUT1 and OUT2 are 8-bit outputs
	//OUT1 and OUT2 are used to read data from the register file
	output reg [7:0] OUT1, OUT2;
	
	
	
	//Declaration of Array of 8 8-bit registers
	//REGISTER[0] to REGISTER[7] are the 8 registers in the register file
	//Each register is 8 bits wide
	reg [7:0] REGISTER [7:0];

	//Iteration variable for the for loop
	//Used to iterate over the register array
	integer i;
	
	
	//Reading data from registers asynchronously
	//OUT1 and OUT2 are assigned values from the register array based on the OUT1ADDRESS and OUT2ADDRESS inputs
	//Contains delay of 2 time units
	//assign #2 OUT1 = REGISTER[OUT1ADDRESS];		//Assigning value of relevant register address to the OUT1 terminal
	//assign #2 OUT2 = REGISTER[OUT2ADDRESS];		//Assigning value of relevant register address to the OUT2 terminal
	always @(*)begin
        #2 OUT1 = REGISTER[OUT1ADDRESS];
        		//Assigning value of relevant register address to the OUT1 terminal
         OUT2 = REGISTER[OUT2ADDRESS];	
        	//Assigning value of relevant register address to the OUT2 terminal
    end

	
	//Synchronous write operation
	//Triggered on the rising edge of the CLK signal
	//Both operations contain a delay of 1 time unit each
	always @ (posedge CLK)begin
	
		if (RESET == 1'b1)begin		//If the RESET signal is HIGH, registers must be cleared
		
            #1
			for (i = 0; i < 8; i = i + 1)begin			//For loop to iterate through all registers
			
				 REGISTER[i] <= 8'b0;		//Setting each element of the REGISTER array to 0
			end
			
		end
		else if (WRITE == 1'b1)begin			//If reset is LOW and WRITE is HIGH, write operation is performed
		
			#1 REGISTER[INADDRESS] <= IN;		//Assigns the input value IN to relevant register address after a delay of 1
			
		end
		
	end
	
	initial begin
			$monitor($time, "\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", REGISTER[0], REGISTER[1],REGISTER[2],REGISTER[3],REGISTER[4],REGISTER[5],REGISTER[6],REGISTER[7]);
	end
endmodule