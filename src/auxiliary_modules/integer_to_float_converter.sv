module integer_to_float_converter

import dragonfang_floating_point_pkg :: float_t;

(
	input 	logic 	[31:0] 	input_integer,
	input	logic 			sign_mode,
	
	output 	float_t 		converted_float
);
	logic 	[31:0] 	effective_input_integer;
	logic 	[31:0] 	isolated_mantissa;
	wire 	[4:0] 	number_leading_zeroes;
	
	assign converted_float.sign 	= (sign_mode ? input_integer[31]: 1'b0);
	
	// If the input integer is signed and negative, extract its two's complement,
	// else, feed it through untouched.
	assign effective_input_integer 	= ((sign_mode & input_integer[31]) ? (~(input_integer) + 32'd1) : input_integer);
	
	// Left-shift the input integer to isolate the mantissa (Up to the first digit after the implicit one).
	assign isolated_mantissa 		= (effective_input_integer << (number_leading_zeroes + 5'd1));
	
	always_comb
		begin
			// exponent = 8'd32 (# Bits) - number_leading_zeroes (zero-extended) + 8'd127 (Bias) -8'd1 (implicit one).
			converted_float.exponent = 8'd158 - {{3{1'b0}}, number_leading_zeroes};
			
			// We isolate the portion we care about the mantissa
			converted_float.mantissa = isolated_mantissa[31:9];
		end
	
	leading_bits_counter # (.INPUT_VECTOR_WIDTH (32), .BIT_TO_COUNT(1'b0)) leading_zeroes_counter
	(
		.input_vector (effective_input_integer),
		
		.count_vector (number_leading_zeroes)
	);

endmodule 