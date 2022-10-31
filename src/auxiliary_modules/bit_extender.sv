module bit_extender
#(
	parameter INPUT_VECTOR_WIDTH 	= 32,
	parameter OUTPUT_VECTOR_WIDTH 	= 64,
	parameter BIT_TO_EXTEND 		= 1'b0
)
(
	input 	logic [INPUT_VECTOR_WIDTH - 1:0] 	input_vector,
	
	output 	logic [OUTPUT_VECTOR_WIDTH - 1:0] 	output_vector
);

	always_comb
		for (int i = 0; i < OUTPUT_VECTOR_WIDTH; i++)
			output_vector[i] = ((i < INPUT_VECTOR_WIDTH) ? input_vector[i] : BIT_TO_EXTEND);
	
endmodule 