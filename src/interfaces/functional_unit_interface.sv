import dragonfang_pkg :: execution_vector_t;

interface functional_unit_interface
(
	input logic 				clock, 
	input logic 				reset_n,
	input execution_vector_t 	execution_vector
);

	// Common inputs.
	logic [63:0] 	v0;
	logic [63:0] 	vs2;
	logic [63:0] 	vs1;
	logic [63:0] 	vd;

	// Bypass ouput port.
	logic [63:0] 	vd_bypass;
	
	// Common output.
	logic [63:0] 	vd_low;
	
	modport common
	(
		input 	clock,
		input 	reset_n,
		input 	execution_vector,
	
		input 	vs2,
		input 	vs1,
		
		output 	vd_bypass,
		output 	vd_low
	);
	
	modport bypass_operand_output
	(
		output v0,
		output vs2,
		output vs1,
		output vd
	);
	
endinterface : functional_unit_interface