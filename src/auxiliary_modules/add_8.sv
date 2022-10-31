module add_8
(
	input 	logic [7:0] source_element_0,
	input 	logic [7:0] source_element_1,
	input 	logic		input_carry,
	
	output 	logic [7:0] target_element,
	output 	logic 		output_carry
);

	logic [7:0] bitwise_carry;
	
	assign target_element = source_element_0 ^ source_element_1 ^ bitwise_carry;

	carry_8 carry_8_0
	(
		.source_element_0 	(source_element_0),
		.source_element_1 	(source_element_1),
		.input_carry	  	(input_carry),
	
		.bitwise_carry 		(bitwise_carry),
		.output_carry 		(output_carry)
	);

endmodule 