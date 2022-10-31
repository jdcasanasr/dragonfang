module float_to_integer_converter

import dragonfang_floating_point_pkg :: float_t;

(
	input 	float_t 		input_float,
	input 	logic 			sign_mode, 		// 1'b1: Signed input. 1'b0: Unsigned input.

	output 	logic [31:0] 	converted_integer
);

	wire 	[7:0] 	unbiased_exponent 	= input_float.exponent - 8'd127;
	logic	[22:0] 	effective_mantissa;
	
	// Assume truncation takes effect. Rounding is to be implemented.
	always_comb
		if (sign_mode)
			converted_integer 		= {{8{input_float.sign}}, {1'b1, effective_mantissa}};
			
		else
			converted_integer 		= {{8{1'b0}}, {1'b1, effective_mantissa}};

	always_comb
		// If the unbiased exponent is greater than 23, we will lose information!.
		for (int i = 22; i >= 0; i--)
			effective_mantissa[i] = (i >= unbiased_exponent ? input_float.mantissa[i] : 1'b0);

endmodule 