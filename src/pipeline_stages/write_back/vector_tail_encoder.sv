module vector_tail_encoder
#(
	parameter VECTOR_MASK_LENGTH = 8
)
(
	input 	logic [VECTOR_MASK_LENGTH - 1:0] vector_mask,
	
	output 	logic [VECTOR_MASK_LENGTH - 1:0] encoded_vector_mask
);

	wire [$clog2(VECTOR_MASK_LENGTH) - 1:0] number_leading_zeroes;
	wire [$clog2(VECTOR_MASK_LENGTH) - 1:0] first_one_index = VECTOR_MASK_LENGTH - number_leading_zeroes - 1;


	always_comb
		for (int i = VECTOR_MASK_LENGTH - 1; i >= 0; i--)
			if (i > first_one_index)
				encoded_vector_mask[i] = 1'b1;
				
			else
				encoded_vector_mask[i] = 1'b0;
	
	leading_bits_counter #(.INPUT_VECTOR_WIDTH(VECTOR_MASK_LENGTH), .BIT_TO_COUNT(1'b0)) leading_zeroes_counter
	(
		.input_vector (vector_mask),
	
		.count_vector (number_leading_zeroes)
	);

endmodule 