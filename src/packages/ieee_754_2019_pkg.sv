`ifndef IEEE_754_2019_PKG_COMPILED
`define IEEE_754_2019_PKG_COMPILED

package ieee_754_2019_pkg;

	import 	dragonfang_floating_point_pkg::double_t,
			dragonfang_floating_point_pkg::float_t;

	// Identify negative numbers.
	function bit is_sign_minus_double (double_t vs2);
		
		return vs2.sign; 
		
	endfunction
	
	// Identify zero values.
	function bit is_zero_double (double_t vs2);
		
		// Return true regardless of the sign.
		if (vs2.exponent == '0 && vs2.mantissa == '0)
			return 1'b1;
			
		else
			return 1'b0;
		
	endfunction
	
	// Identify infinite values.
	function bit is_infinite_double (double_t vs2);
	
		if (vs2.exponent == '1 && vs2.mantissa == '0)
			return 1'b1;
			
		else
			return 1'b0;
		
	endfunction
	
	// Identify NaN values.
	function bit is_nan_double (double_t vs2);
		
		return ((vs2.exponent == '1 && vs2.mantissa != '0) ? 1'b1 : 1'b0);
	
	endfunction
	
	// Identify signaling NaN values.
	function bit is_signaling_double (double_t vs2);
	
		return ((is_nan_double(vs2) && !vs2.mantissa[51]) ? 1'b1 : 1'b0);
	
	endfunction

	// Identify subnormal numbers.
	function bit is_subnormal_double (double_t vs2);
	
		return ((vs2.exponent == '0 && vs2.mantissa != '0) ? 1'b1 : 1'b0);
	
	endfunction
	
	// Identify normal numbers.
	function bit is_normal_double (double_t vs2);
	
		return ((!is_zero_double(vs2) ||  is_subnormal_double(vs2) || is_infinite_double(vs2) || is_nan_double(vs2)) ? 1'b1 : 1'b0);
	
	endfunction
	
	// Identify finite numbers.
	function bit is_finite_double (double_t vs2);
	
		return (((is_zero_double(vs2) || is_normal_double(vs2) || is_subnormal_double(vs2)) && (!is_infinite_double(vs2) && !is_nan_double(vs2))) ? 1'b1 : 1'b0);
	
	endfunction
	
	// float_t variants.
	// Identify negative numbers.
	function bit is_sign_minus_float (float_t vs2);
		
		return vs2.sign; 
		
	endfunction
	
	// Identify zero values.
	function bit is_zero_float (float_t vs2);
		
		// Return true regardless of the sign.
		if (vs2.exponent == '0 && vs2.mantissa == '0)
			return 1'b1;
			
		else
			return 1'b0;
		
	endfunction
	
	// Identify infinite values.
	function bit is_infinite_float (float_t vs2);
	
		if (vs2.exponent == '1 && vs2.mantissa == '0)
			return 1'b1;
			
		else
			return 1'b0;
		
	endfunction
	
	// Identify NaN values.
	function bit is_nan_float (float_t vs2);
		
		return ((vs2.exponent == '1 && vs2.mantissa != '0) ? 1'b1 : 1'b0);
	
	endfunction
	
	// Identify signaling NaN values.
	function bit is_signaling_float (float_t vs2);
	
		return ((is_nan_float(vs2) && !vs2.mantissa[22]) ? 1'b1 : 1'b0);
	
	endfunction

	// Identify subnormal numbers.
	function bit is_subnormal_float (float_t vs2);
	
		return ((vs2.exponent == '0 && vs2.mantissa != '0) ? 1'b1 : 1'b0);
	
	endfunction
	
	// Identify normal numbers.
	function bit is_normal_float (float_t vs2);
	
		return ((!is_zero_float(vs2) ||  is_subnormal_float(vs2) || is_infinite_float(vs2) || is_nan_float(vs2)) ? 1'b1 : 1'b0);
	
	endfunction
	
	// Identify finite numbers.
	function bit is_finite_float (float_t vs2);
	
		return (((is_zero_float(vs2) || is_normal_float(vs2) || is_subnormal_float(vs2)) && (!is_infinite_float(vs2) && !is_nan_float(vs2))) ? 1'b1 : 1'b0);
	
	endfunction
	
	// Classify double_t floating-point numbers.
	function logic [9:0] classify_double (double_t vs2);
		
		logic [9:0] class_double;
		
		class_double[0] = is_sign_minus_double(vs2) & is_infinite_double(vs2); 	// Is minus infinite.
		class_double[1] = is_sign_minus_double(vs2) & is_normal_double(vs2);		// Is a negative normal number.
		class_double[2] = is_sign_minus_double(vs2) & is_subnormal_double(vs2);	// Is a negative subnormal number.
		class_double[3] = is_sign_minus_double(vs2) & is_zero_double(vs2);			// Is negative zero.
		class_double[4] = !is_sign_minus_double(vs2) & is_zero_double(vs2);		// Is positive zero.
		class_double[5] = !is_sign_minus_double(vs2) & is_subnormal_double(vs2);	// Is a positive subnormal numbers.
		class_double[6] = !is_sign_minus_double(vs2) & is_normal_double(vs2);		// Is a positive normal number.
		class_double[7] = !is_sign_minus_double(vs2) & is_infinite_double(vs2);	// Is plus infinite.
		class_double[8] = is_signaling_double(vs2);							// Is a signaling NaN.
		class_double[9] = is_nan_double(vs2);								// Is a quiet ("regular") NaN.
		
		return class_double;
		
	endfunction
	
	// Classify float_t floating-point numbers.
	function logic [9:0] classify_float (float_t vs2);
		
		logic [9:0] class_float;
		
		class_float[0] = is_sign_minus_float(vs2) & is_infinite_float(vs2); 	// Is minus infinite.
		class_float[1] = is_sign_minus_float(vs2) & is_normal_float(vs2);		// Is a negative normal number.
		class_float[2] = is_sign_minus_float(vs2) & is_subnormal_float(vs2);	// Is a negative subnormal number.
		class_float[3] = is_sign_minus_float(vs2) & is_zero_float(vs2);		// Is negative zero.
		class_float[4] = !is_sign_minus_float(vs2) & is_zero_float(vs2);		// Is positive zero.
		class_float[5] = !is_sign_minus_float(vs2) & is_subnormal_float(vs2);	// Is a positive subnormal numbers.
		class_float[6] = !is_sign_minus_float(vs2) & is_normal_float(vs2);	// Is a positive normal number.
		class_float[7] = !is_sign_minus_float(vs2) & is_infinite_float(vs2);	// Is plus infinite.
		class_float[8] = is_signaling_float(vs2);						// Is a signaling NaN.
		class_float[9] = is_nan_float(vs2);								// Is a quiet ("regular") NaN.
		
		return class_float;
		
	endfunction
	
	// double_t floating-point comparisons.
	// double_t signaling equal comparison.
	function logic compare_signaling_equal_double (double_t vs2, double_t vs1);
	
		// Return false if any operand is a signaling NaN.
		if (is_signaling_double(vs2) || is_signaling_double(vs1))
			return 1'b0;
			
		else if (is_normal_double(vs2) && is_normal_double(vs1) && (vs2 == vs2))
			return 1'b1;
			
		else
			return 1'b0;
	
	endfunction
	
	// double_t signaling not-equal comparison.
	function logic compare_signaling_not_equal_double (double_t vs2, double_t vs1);
	
		return !compare_signaling_equal_double (vs2, vs1);
	
	endfunction
	
	// double_t signaling less-than comparison.
	function logic compare_signaling_less_double (double_t vs2, double_t vs1);
	
		if (is_signaling_double(vs2) || is_signaling_double(vs1))
			return 1'b0;
			
		else if (is_normal_double(vs2) && is_normal_double(vs1))
			if (vs2.exponent < vs1.exponent)
				return 1'b1;
				
			else
				return 1'b0;
	
	endfunction
	
	// double_t signaling less-than-or-equal comparison.
	function logic compare_signaling_less_equal_double (double_t vs2, double_t vs1);
	
		return compare_signaling_less_double (vs2, vs1) || compare_signaling_equal_double (vs2, vs1);
	
	endfunction
	
	// double_t signaling greater-than comparison
	function logic compare_signaling_greater_double (double_t vs2, double_t vs1);
	
		return !compare_signaling_less_equal_double (vs2, vs1);
	
	endfunction
	
	// double_t signaling greater-than-or-equal comparison.
	function logic compare_signaling_greater_equal_double (double_t vs2, double_t vs1);
	
		return !compare_signaling_less_double (vs2, vs1);
	
	endfunction
	
	// float_t floating-point comparisons.
	// float_t signaling equal comparison.
	function logic compare_signaling_equal_float (float_t vs2, float_t vs1);
	
		// Return false if any operand is a signaling NaN.
		if (is_signaling_float(vs2) || is_signaling_float(vs1))
			return 1'b0;
			
		else if (is_normal_float(vs2) && is_normal_float(vs1) && (vs2 == vs2))
			return 1'b1;
			
		else
			return 1'b0;
	
	endfunction
	
	// float_t signaling not-equal comparison.
	function logic compare_signaling_not_equal_float (float_t vs2, float_t vs1);
	
		return !compare_signaling_equal_float (vs2, vs1);
	
	endfunction
	
	// float_t signaling less-than comparison.
	function bit compare_signaling_less_float (float_t vs2, float_t vs1);
	
		if (is_signaling_float(vs2) || is_signaling_float(vs1))
			return 1'b0;
			
		else if (is_normal_float(vs2) && is_normal_float(vs1))
			if (vs2.exponent < vs1.exponent)
				return 1'b1;
				
			else
				return 1'b0;
	
	endfunction
	
	// float_t signaling less-than-or-equal comparison.
	function logic compare_signaling_less_equal_float (float_t vs2, float_t vs1);
	
		return compare_signaling_less_float (vs2, vs1) || compare_signaling_equal_float (vs2, vs1);
	
	endfunction
	
	// float_t signaling greater-than comparison
	function logic compare_signaling_greater_float (float_t vs2, float_t vs1);
	
		return !compare_signaling_less_equal_float (vs2, vs1);
	
	endfunction
	
	// float_t signaling greater-than-or-equal comparison.
	function logic compare_signaling_greater_equal_float (float_t vs2, float_t vs1);
	
		return !compare_signaling_less_float (vs2, vs1);
	
	endfunction
		
endpackage

`endif