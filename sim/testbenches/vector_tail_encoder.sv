`timescale 1 ns / 1 ns

module vector_tail_encoder_tb ();

	localparam VECTOR_MASK_LENGTH = 8;

	logic [VECTOR_MASK_LENGTH - 1:0] vector_mask;
	logic [VECTOR_MASK_LENGTH - 1:0] encoded_vector_mask;
	
	initial
		vector_mask = '0;
	
	always
		begin
			#20 vector_mask = $random;
			#20 vector_mask = $random;
			#20 vector_mask = $random;
			#20 vector_mask = $random;
			#20 vector_mask = $random;
			
			#20 ;
			#20 $stop;
		end
	
	vector_tail_encoder # (.VECTOR_MASK_LENGTH(VECTOR_MASK_LENGTH)) vector_tail_encoder
	(
		.vector_mask (vector_mask),
		
		.encoded_vector_mask (encoded_vector_mask)
	);

endmodule 