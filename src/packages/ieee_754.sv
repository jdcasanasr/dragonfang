// IEEE-754-2019 general operations (Pg. 38 from the standard)
module hello ();

class ieee_754 #(type floating_point_type);

	// Identify negative numbers.
	// May cause problems between logic and bit types.
	static function bit is_sign_minus (floating_point_type vs2);
		
		return vs2.sign; 
		
	endfunction
	
	// Identify plus and minus zero values.
	static function bit is_zero (floating_point_type vs2);
		
		// Return true regardless of the sign.
		if (vs2.exponent == '0 && vs2.mantissa == '0)
			return 1'b1;
			
		else
			return 1'b0;
		
	endfunction
	
	// Identify plus and minus infinite values.
	static function bit is_infinite (floating_point_type vs2);
	
		if (vs2.exponent == '1 && vs2.mantissa == '0)
			return 1'b1;
			
		else
			return 1'b0;
		
	endfunction
	
	// Identify NaN values.
	static function bit is_nan (floating_point_type vs2);
	
		if (vs2.exponent == '1 && vs2.mantissa != '0)
			return 1'b1;
			
		else
			return 1'b0;
		
		return ((vs2.exponent == '1 && vs2.mantissa != '0) ? 1'b1 : 1'b0);
	
	endfunction
	
endclass

endmodule 