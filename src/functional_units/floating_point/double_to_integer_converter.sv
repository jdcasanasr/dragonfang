module double_to_integer_converter

import dragonfang_floating_point_pkg :: double_t;

(
	input 	double_t 		input_double,
	input 	logic 			sign_mode,

	output 	logic [31:0] 	converted_integer
);

	wire 	[10:0] 	unbiased_exponent 	= input_double.exponent - 11'd1023;
	logic	[51:0] 	effective_mantissa;
	logic 	[52:0] 	real_mantissa;
	
	assign real_mantissa = {1'b1, effective_mantissa}; 	// Implicit 1'b1.

	always_comb
		if (sign_mode)
			if (unbiased_exponent < 11'd32)
				for (int i = 0, j = 52; i < 32; i++)
					if (i < (11'd32 - unbiased_exponent))
						converted_integer[i] = input_double.sign;
						
					else
						begin
							converted_integer[i] = real_mantissa[j];
							j--;
						end
						
			else
				converted_integer = {input_double.sign, real_mantissa[52:22]};
				
		else
			converted_integer = real_mantissa[52:21];

	always_comb
		if (unbiased_exponent < 11'd52)
			for (int i = 51; i >= 0; i--)
				effective_mantissa = (i >= unbiased_exponent ? input_double.mantissa[i] : 1'b0);
		else
			effective_mantissa[51:0] = input_double.mantissa;

endmodule 