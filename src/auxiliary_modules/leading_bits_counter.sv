module leading_bits_counter
# (
	parameter INPUT_VECTOR_WIDTH 	= 64,
	parameter OUTPUT_VECTOR_WIDTH 	= $clog2(INPUT_VECTOR_WIDTH),
	parameter BIT_TO_COUNT			= 1'b0
)
(
	input 	wire [INPUT_VECTOR_WIDTH - 1:0] 	input_vector,
	
	output 	wire [OUTPUT_VECTOR_WIDTH - 1:0] 	count_vector
);

	generate
	
		// Base case.
		if (INPUT_VECTOR_WIDTH == 2)
			assign count_vector = (BIT_TO_COUNT ? input_vector[1] : !input_vector[1]);
			
		// Recursive case.
		else
			begin
				wire [OUTPUT_VECTOR_WIDTH - 2:0] 		count_vector_half; 																			// Count vector for either half.
				wire [(INPUT_VECTOR_WIDTH / 2) - 1:0] 	left_half 			= input_vector[(INPUT_VECTOR_WIDTH / 2) +: (INPUT_VECTOR_WIDTH / 2)]; 	// From half the current's vector width up to such width's half.
				wire [(INPUT_VECTOR_WIDTH / 2) - 1:0]	right_half 			= input_vector[0 +: (INPUT_VECTOR_WIDTH / 2)];							// From zero up to half the current vector's width.
				wire 									left_half_state 	= (BIT_TO_COUNT ? & left_half : ~| left_half); 							// Is the left half all zeroes or all ones?
				
				leading_bits_counter # (.INPUT_VECTOR_WIDTH (INPUT_VECTOR_WIDTH / 2), .BIT_TO_COUNT(BIT_TO_COUNT)) leading_bits_counter_recursive
				(
					.input_vector 	(left_half_state ? right_half : left_half),
					
					.count_vector 	(count_vector_half)
				);
				
				assign count_vector = {left_half_state, count_vector_half}; 	// Each bit in count_vector is a power of two, we are therefore adding how many bits we have thus far.
			end
	
	endgenerate

endmodule 