`ifndef DRAGONFANG_FLOATING_POINT_PKG_COMPILED
`define DRAGONFANG_FLOATING_POINT_PKG_COMPILED

package dragonfang_floating_point_pkg;

	parameter NUMBER_SQUARE_ROOT_ITERATIONS = 5;

	// Declare 32- and 64-bit integer types.
	typedef logic [31:0] integer32_t;
	typedef logic [63:0] integer64_t;
	
	// IEEE-754-2019 structures.
	typedef struct packed
	{
		logic 			sign;
		logic [7:0] 	exponent;
		logic [22:0] 	mantissa;
	
	} float_t;
			
	typedef struct packed
	{
		logic 			sign;
		logic [10:0] 	exponent;
		logic [51:0] 	mantissa;
	
	} double_t;

//	typedef float_t 	binary32_t;
//	typedef double_t 	binary64_t;
	
	// Count leading zeroes (useful to normalize the mantissa in floating-point addition).
//	function logic [4:0] count_leading_zeroes (logic [31:0] rs2);
//	
//		logic [4:0] count = '0;
//		
//		integer i;
//		
//		for (i = 31; i >= 0; i--)
//			if (rs2[i] == 1'b1)
//				count++;
//	
//	endfunction
	
	// Find the first zero in a 32-bit binary number and return its index.
//	function logic [4:0] find_first_zero (logic [31:0] rs2);
//	
//		logic [4:0] index;
//		
//		for (index = 5'd31; index >= 5'd0; index--)
//			if (rs2[index] == 1'b0)
//				return index;
//	
//	endfunction
	
	// Compute square root of a float_t number with a variable number of Newton-Raphson's iterations.
	function float_t square_root_float (float_t vs2);
	
		float_t half_float; 	// 0.5 in float_t format.
		
		integer i;
		
		float_t vd;
		static float_t vd_approximation = vs2;
		
		half_float.sign 	= 1'b0;
		half_float.exponent = 8'b0111_1110;
		half_float.mantissa = 23'b0;
		
		for (i = 0; i < NUMBER_SQUARE_ROOT_ITERATIONS; i++)
			begin
				vd 					= multiply_float(half_float, add_float(vd_approximation, divide_float(vs2, vd_approximation)));
				vd_approximation 	= vd;
			end
		
		return vd;
		
	endfunction
	
	// Compute square root of a double_t number with a variable number of Newton-Raphson's iterations.
	function double_t square_root_double (double_t vs2);
	
		double_t half_double; 	// 0.5 in float_t format.
		
		integer i;
		
		double_t vd;
		static double_t vd_approximation = vs2;
		
		half_double.sign 	= 1'b0;
		half_double.exponent = 11'b011_1111_1110;
		half_double.mantissa = 52'b0;
		
		for (i = 0; i < NUMBER_SQUARE_ROOT_ITERATIONS; i++)
			begin
				vd 					= multiply_double(half_double, add_float(vd_approximation, divide_float(vs2, vd_approximation)));
				vd_approximation 	= vd;
			end
		
		return vd;
		
	endfunction
	
	// Invert a float_t number sign.
	function float_t negate_float (float_t vs2);
	
		float_t vd;
		
		vd.sign 		= ~vs2.sign;
		vd.exponent 	= vs2.exponent;
		vd.mantissa 	= vs2.mantissa;
	
		return vd;
	
	endfunction
	
	// Invert a double_t number sign.
	function double_t negate_double (double_t vs2);
	
		double_t vd;
		
		vd.sign 		= ~vs2.sign;
		vd.exponent 	= vs2.exponent;
		vd.mantissa 	= vs2.mantissa;
		
		return vd;
	
	endfunction
	
	// Convert a single-precision floating-point number into double precision.
	function double_t float_to_double (float_t vs2);
	
		double_t vd;
		logic [28:0] excess_mantissa;
		
		vd.sign = vs2.sign;
		
		// We insert three zeroes to the left and add the proper quantity to
		// yield the 11'd1023 bias [1023 - 127 = 896].
		vd.exponent = {{3{1'b0}}, vs2.exponent} + 11'd896;
		
		// 23 + 29 = 52 [double_t mantissa's width].
		// Note: Yields a warning about vd_high's first 29 bits being stuck at 1'b0. This is Ok!.
		vd.mantissa = {vs2.mantissa, {29{1'b0}}};
//		vd.mantissa = {vs2.mantissa, excess_mantissa};
		
		return vd;
	
	endfunction
	
	
	// Convert double-precision floating-point number to single precision (With potential
	// loss of information).
	function float_t double_to_float (double_t vs2);
	
		float_t 		vd;
		static logic 	[10:0] 	unbiased_exponent = vs2.exponent - 11'd1023;
		
		// If the exponent is representable in 8 bits, return a value. 
		// vd.exponent = vs2.exponent - 11'd1023 + 11'd127.
		if (unbiased_exponent < 11'd128)
			begin
				vd.sign 	= vs2.sign;
				vd.exponent = unbiased_exponent[7:0] + 8'd127;
				vd.mantissa = vs2.mantissa[51:29];
				
				return vd;
			end
		
		// If it's not representable, return NaN.
		else
			begin
				vd.sign 	= '0;
				vd.exponent = '1;
				vd.mantissa = '0;
				
				return vd;
			end
	
	endfunction
	
	
	// Invert the sign in a double_t's sign to perform division
	function double_t invert_double (double_t vs2);
	
		double_t vd;
		
		vd.sign 	= vs2.sign;
		vd.exponent = vs2.exponent - vs2.exponent - vs2.exponent + 11'd2046;
		vd.mantissa = vs2.mantissa;
	
		return vd;
	
	endfunction
	
	// Invert the sign in a float_t's sign to perform division
	function float_t invert_float (float_t vs2);
	
		float_t vd;
		
		vd.sign 	= vs2.sign;
		vd.exponent = vs2.exponent - vs2.exponent - vs2.exponent + 8'd254;
		vd.mantissa = vs2.mantissa;
	
		return vd;
	
	endfunction
	
	// Pack 64-bit-wide streams into double_t structures.
	function double_t pack_to_double (logic [63:0] vs2);
	
		double_t vd;
		
		vd.sign 	= vs2[63];
		vd.exponent = vs2[62:52];
		vd.mantissa = vs2[51:0];
	
		return vd;
	
	endfunction
	
	// Pack 32-bit-wide streams into float_t structures.
	function float_t pack_to_float (logic [31:0] vs2);
	
		float_t vd;
		
		vd.sign 	= vs2[31];
		vd.exponent = vs2[30:23];
		vd.mantissa = vs2[22:0];
	
		return vd;
	
	endfunction
	
	// Unpack a double_t structure to form a 64-bit logic type stream.
	function logic [63:0] unpack_double_to_logic (double_t vs2);
	
		return {vs2.sign, vs2.exponent, vs2.mantissa};
	
	endfunction
	
	// Unpack a double_t structure to form a 64-bit logic type stream.
	function logic [31:0] unpack_float_to_logic (float_t vs2);
	
		return {vs2.sign, vs2.exponent, vs2.mantissa};
	
	endfunction
	
	// Perform binary addition on two double-precision floating-point numbers.
	function double_t add_double (double_t vs2, double_t vs1);
	
		double_t 		vd;
		logic [10:0] 	provisional_vd_exponent;
		logic [10:0] 	difference;
		logic [53:0] 	mantissa_sum; // {carry (if any), 1'b1, mantissa}.
	
		// Identify the largest exponent, which will be the result's exponent,
		// and find the difference between each other (to equalize the mantissa).
		if (vs2.exponent > vs1.exponent)
			begin
				vd.sign 				= vs2.sign;
				
				provisional_vd_exponent = vs2.exponent;
				difference 				= vs2.exponent - vs1.exponent;
				mantissa_sum 			= ({1'b1, vs2.mantissa} - 11'd1023) + {({1'b1, vs1.mantissa} - 11'd1023) >> difference};

			end
			
		else
			begin
				vd.sign 				= vs1.sign;
			
				provisional_vd_exponent = vs1.exponent;
				difference 				= vs1.exponent - vs2.exponent;
				mantissa_sum			= {({1'b1, vs2.mantissa} - 11'd1023) >> difference} + ({1'b1, vs1.mantissa} - 11'd1023);
			end
	
	
		// If the sum generated a carry, add one to the final exponent
		// and take the resultant mantissa from the carry downwards (mantissa_sum[52:1]),
		// else take mantissa_sum[51:0]
		if (mantissa_sum[53])
			begin
				vd.exponent		= provisional_vd_exponent + 11'd1;
				vd.mantissa		= mantissa_sum[52:1] + 11'd1023;
			end
			
		else
			begin
				vd.exponent 	= provisional_vd_exponent;
				vd.mantissa		= mantissa_sum[51:0] + 11'd1023;
			end
	
		return vd;
	
	endfunction
	
	// Perform binary addition on two single-precision floating-point numbers.
	function float_t add_float (float_t vs2, float_t vs1);
	
		float_t 		vd;
		logic [7:0] 	provisional_vd_exponent;
		logic [7:0] 	difference;
		logic [24:0] 	mantissa_sum; // {carry (if any), 1'b1, mantissa}.
	
		// Identify the largest exponent, which will be the result's exponent,
		// and find the difference between each other (to equalize the mantissa).
		if (vs2.exponent > vs1.exponent)
			begin
				vd.sign 				= vs2.sign;
				
				provisional_vd_exponent = vs2.exponent;
				difference 				= vs2.exponent - vs1.exponent;
				mantissa_sum 			= ({1'b1, vs2.mantissa} - 8'd127) + {({1'b1, vs1.mantissa} - 8'd127) >> difference};

			end
			
		else
			begin
				vd.sign 				= vs1.sign;
			
				provisional_vd_exponent = vs1.exponent;
				difference 				= vs1.exponent - vs2.exponent;
				mantissa_sum			= {({1'b1, vs2.mantissa} - 8'd127) >> difference} + ({1'b1, vs1.mantissa} - 8'd127);
			end
	
	
		// If the sum generated a carry, add one to the final exponent
		// and take the resultant mantissa from the carry downwards (mantissa_sum[52:1]),
		// else take mantissa_sum[51:0]
		if (mantissa_sum[24])
			begin
				vd.exponent		= provisional_vd_exponent + 8'd1;
				vd.mantissa		= mantissa_sum[23:1] + 8'd127;
			end
			
		else
			begin
				vd.exponent 	= provisional_vd_exponent;
				vd.mantissa		= mantissa_sum[22:0] + 8'd127;
			end
	
		return vd;
	
	endfunction
	
	// Perform binary subtraction on two double-precision floating-point values.
	function double_t sub_double (double_t vs2, double_t vs1);
	
		double_t vs1_effective;
	
		vs1_effective.sign 		= vs1.sign;
		vs1_effective.exponent 	= vs1.exponent;
		
		// When we invert the mantissa's sign in two's complement notation, the bias becomes negative,
		// therefore we add 11'd2046 to yield -exp - 11'd1023 + 11'd2046 = -exp + 11'd1023.
		vs1_effective.mantissa	= (~vs1.mantissa + 1'b1) + 11'd2046;
		
		
	
		return add_double (vs2, vs1_effective);
	
	endfunction
	
	// Perform binary subtraction on two single-precision floating-point values.
	function float_t sub_float (float_t vs2, float_t vs1);
	
		float_t vs1_effective;
	
		vs1_effective.sign 		= vs1.sign;
		vs1_effective.exponent 	= vs1.exponent;
		
		// When we invert the mantissa's sign in two's complement notation, the bias becomes negative,
		// therefore we add 11'd2046 to yield -exp - 11'd1023 + 11'd2046 = -exp + 11'd1023.
		vs1_effective.mantissa	= (~vs1.mantissa + 1'b1) + 8'd254;
		
		
	
		return add_float (vs2, vs1_effective);
	
	endfunction
	
	// Perform binary product on double-precision floating-point values.
	function double_t multiply_double (double_t vs2, double_t vs1);
		
		double_t vd;
		
		// (52 * 2) + 2 [from implicit 1's] = 106.
		logic [105:0] raw_mantissa;
		
		vd.sign = vs2.sign ^ vs1.sign;
		
		// (vs2_exp + 11'd1023) + (vs1_exp + 11'd1023) - 11'd1023 + 1 [we shift the decimal point one position to the left, therefore we add one to the exponent].
		vd.exponent = vs2.exponent + vs1.exponent - 11'd1022;

		raw_mantissa = {1'b1, vs2.mantissa} * {1'b1, vs1.mantissa};
		
		// TODO: Implement rounding. For the mean time, we truncate.
		vd.mantissa = raw_mantissa[104:53];
	
		return vd;
	
	endfunction
	
	// Perform binary division on double-precision floating-point values.
	function double_t divide_double (double_t vs2, double_t vs1);
	
		double_t vs1_effective;
		
		vs1_effective = invert_double(vs1);
		
		return multiply_double(vs2, vs1_effective);
	
	endfunction
	
	// Perform binary product on single-precision floating-point values.
	function float_t multiply_float (float_t vs2, float_t vs1);
		
		float_t vd;
		
		// (23 * 2) + 2 [from implicit 1's] = 48.
		logic [47:0] raw_mantissa;
		
		vd.sign 	= vs2.sign ^ vs1.sign;
		
		// (vs2_exp + 8'd127) + (vs1_exp + 8'd127) - 8'd127 + 1
		vd.exponent = vs2.exponent + vs1.exponent - 8'd126;
	
		raw_mantissa = {1'b1, vs2.mantissa} * {1'b1, vs1.mantissa};
		
		vd.mantissa = raw_mantissa[46:24];
		
		return vd;
		
	endfunction
	
	// Perform binary division on single-precision floating-point values.
	function float_t divide_float (float_t vs2, float_t vs1);
	
		float_t vs1_effective;
		
		vs1_effective = invert_float(vs1);
		
		return multiply_float(vs2, vs1_effective);
	
	endfunction
	
//	// Transform a (signed/unsigned) integer into a float_t floating-point number.
//	function float_t integer_to_float (logic [31:0] rs2);
//	
//		float_t vd;
//		const logic [4:0] leading_zeroes	= count_leading_zeroes (rs2);
//		logic [4:0] first_zero_index  		= rs2.find_first_index(index) with (index == 1'b0);
//		
//		// Initialize float_t fields.
//		vd.sign 	= rs2[31];
//		vd.exponent = '0;
//		vd.mantissa = '0;
//		
//		// If the sign is negative (2's complements) find the first non-one digit to
//		// form our mantissa (The rest of the ones are the sign).
//		if (rs2[31])
//			begin
//				//first_zero_index = find_first_zero (rs2);
//				
//				vd.exponent = first_zero_index + 8'd159;
//				vd.mantissa = rs2[first_zero_index:0];
//				
//				return vd;
//			end
//	
//		// Our number is either positive or unsigned. Take
//		else
//			begin
//				//leading_zeroes = count_leading_zeroes (rs2);
//			
//				vd.exponent = 8'd160 - leading_zeroes;
//				vd.mantissa = rs2[(leading_zeroes - 1):0];
//				
//				return vd;
//			end
//	
//	endfunction

	//`include "C:/Users/jdani/Documents/Thesis/dragonfang/hdl/functions/integer_to_float.sv"
	
	// Transform float_t to unsigned integer.
//	function integer32_t float_to_unsigned_integer (float_t rs2, bit truncate);
//	
//		logic [7:0] unbiased_exponent = rs2.exponent - 8'd127;
//		
//		if (unbiased_exponent < '0)
//			return '0;
//			
//		else if (unbiased_exponent < 8'd23)
//			if (truncate)
//				return {{(31 - $size(rs2.mantissa[22:unbiased_exponent])){1'b0}}, 1'b1, rs2.mantissa[22:unbiased_exponent]};
//
//			else 	// Round-up (add the first bit after the decimal bit. If such bit is zero, it's the same as truncating).
//				return {{(31 - $size(rs2.mantissa[22:unbiased_exponent])){1'b0}}, 1'b1, rs2.mantissa[22:unbiased_exponent]} + rs2.mantissa[unbiased_exponent - 1];
//			
//		else 	// Return a zero-extended version of the entire mantissa (including the implicit 1).
//			return {{8{1'b0}}, 1'b1, rs2.mantissa[22:0]};
//	
//	endfunction
	
	// Transform float_t to signed integer.
//	function integer32_t float_to_signed_integer (float_t rs2, bit truncate);
//	
//		logic [7:0] unbiased_exponent = rs2.exponent - 8'd127;
//		
//		if (unbiased_exponent < '0)
//			return '0;
//			
//		else if (unbiased_exponent < 8'd23)
//			if (truncate)
//				return {{(31 - $size(rs2.mantissa[22:unbiased_exponent])){rs2.sign}}, 1'b1, rs2.mantissa[22:unbiased_exponent]};
//
//			else 	// Round-up (add the first bit after the decimal bit. If such bit is zero, it's the same as truncating).
//				return {{(31 - $size(rs2.mantissa[22:unbiased_exponent])){rs2.sign}}, 1'b1, rs2.mantissa[22:unbiased_exponent]} + rs2.mantissa[unbiased_exponent - 1];
//			
//		else 	// Return a zero-extended version of the entire mantissa (including the implicit 1).
//			return {{8{rs2.sign}}, 1'b1, rs2.mantissa[22:0]};
//	
//	endfunction
	
	// Sign- or zero-extend a 32-bit integer to 64-bit.
	function integer64_t integer32_bit_extend (integer32_t rs2, bit extension_mode);
	
		if (extension_mode) 	// Sign-extend.
			return {{32{rs2[31]}}, rs2};
			
		else 					// Zero-extend.
			return {{32{1'b0}}, rs2};
	
	endfunction
	
endpackage
`endif