`ifndef DRAGONFANG_UTILS_PKG_COMPILED
	`define DRAGONFANG_UTILS_PKG_COMPILED
		package dragonfang_utils_pkg;
		
		import dragonfang_pkg::*;

//			function logic [5:0] leading_zeroes (logic [63:0] source_element, logic [5:0] bit_width);
//				logic [5:0] step = bit_width >> 1; // Divide by 2.
//			
//				if (source_element == 1)
//					return 0;
//					
//				else
//					if (source_element[63:32] == 0)
//						return step + leading_zeroes (source_element[31:0], step);
//						
//					else
//						return leading_zeroes (source_element[63:32], step);
//			
//			endfunction

			// Perform binary product on two 64-bit streams taken as double precision numbers.
			function logic [63:0] multiply_double (logic [63:0] vs2, logic [63:0] vs1);

				double_t vs2_double;
				double_t vs1_double;
				double_t vd_double;

				logic [105:0] raw_mantissa_product;
				
				// Unpack the raw bit streams into float_t and double_t structures.
				vs2_double.sign 	= vs2[63];
				vs2_double.exponent = vs2[62:52];
				vs2_double.mantissa = vs2[51:0];
				
				vs1_double.sign 	= vs1[63];
				vs1_double.exponent = vs1[62:52];
				vs1_double.mantissa = vs1[51:0];
				

				// Decide the product's sign.
				case ({vs2_double.sign, vs1_double.sign})
					2'b00, 2'b11 : vd_double.sign = 1'b0;
					2'b10, 2'b01 : vd_double.sign = 1'b1;
				endcase
					
				// Add the exponents.
				vd_double.exponent = vs2_double.exponent + vs1_double.exponent - 11'd1022;
				
				// Multiply the mantissas
				raw_mantissa_product = {1'b1, vs2_double.mantissa} * {1'b1, vs1_double.mantissa};

				// Truncate the value to fit into vd_double.mantissa's width.
				vd_double.mantissa = raw_mantissa_product[104:53];

				// Return the result in packed form.
				return vd_double;
				
			endfunction
		
			// Perform binary division on double-precision floating-point values.
			function logic [63:0] divide_double (logic [63:0] vs2, logic [63:0] vs1);
			
				double_t vs2_double;
				double_t vs1_double;
				double_t vd_double;
				
				logic [52:0] raw_mantissa;
				
				vs2_double.sign 	= vs2[63];
				vs2_double.exponent = vs2[62:52];
				vs2_double.mantissa = vs2[51:0];
				
				vs1_double.sign 	= vs1[63];
				vs1_double.exponent = vs1[62:52];
				vs1_double.mantissa = vs1[51:0];
				
				// Manage vd_double.sign.
				vd_double.sign 		= vs2_double.sign ^ vs1_double.sign;
				
				// Manage vd_double.exponent.
				vd_double.exponent 	= vs2_double.exponent - vs1_double.exponent + 11'd1023;
				
				// Manage vd_double.mantissa.
				raw_mantissa 		= {1'b1, vs2_double.mantissa} / {1'b1, vs1_double.mantissa};
				vd_double.mantissa 	= raw_mantissa[51:0];
			
				return vd_double;
			
			endfunction
			
			// Perform binary product on two 32-bit streams taken as single-precision numbers.
			function logic [31:0] multiply_float (logic [31:0] vs2, logic [31:0] vs1);

				float_t vs2_float;
				float_t vs1_float;
				float_t vd_float;

				logic [47:0] raw_mantissa_product;
				
				// Unpack the raw bit streams into float_t and float_t structures.
				vs2_float.sign 		= vs2[31];
				vs2_float.exponent 	= vs2[30:23];
				vs2_float.mantissa 	= vs2[22:0];
				
				vs1_float.sign 		= vs1[31];
				vs1_float.exponent 	= vs1[30:23];
				vs1_float.mantissa 	= vs1[22:0];
					

				// Decide the product's sign.
				case ({vs2_float.sign, vs1_float.sign})
					2'b00, 2'b11 : vd_float.sign = 1'b0;
					2'b10, 2'b01 : vd_float.sign = 1'b1;
				endcase
					
				// Add the exponents.
				vd_float.exponent = vs2_float.exponent + vs1_float.exponent - 8'd126;
				
				// Multiply the mantissas
				raw_mantissa_product = {1'b1, vs2_float.mantissa} * {1'b1, vs1_float.mantissa};

				// Truncate the value to fit into vd_float.mantissa's width.
				vd_float.mantissa = raw_mantissa_product[46:24];

				// Return the result in packed form.
				return vd_float;
				
			endfunction
			
			// Perform binary division on single-precision, floating-point values.
			function logic [31:0] divide_float (logic [31:0] vs2, logic [31:0] vs1);
			
				float_t vs2_float;
				float_t vs1_float;
				float_t vd_float;
				
				logic [23:0] raw_mantissa;
				
				vs2_float.sign 		= vs2[31];
				vs2_float.exponent 	= vs2[30:23];
				vs2_float.mantissa 	= vs2[22:0];
				
				vs1_float.sign 		= vs1[31];
				vs1_float.exponent 	= vs1[30:23];
				vs1_float.mantissa 	= vs1[22:0];
				
				// Manage vd_float.sign.
				vd_float.sign 		= vs2_float.sign ^ vs1_float.sign;
				
				// Manage vd_float.exponent.
				vd_float.exponent 	= vs2_float.exponent - vs1_float.exponent + 8'd127;
				
				// Manage vd_float.mantissa.
				raw_mantissa 		= {1'b1, vs2_float.mantissa} / {1'b1, vs1_float.mantissa};
				vd_float.mantissa 	= raw_mantissa[22:0];
				
				return vd_float;
			
			endfunction
		
			// Convert from IEEE-754-2019 single precision to double precision.
			function logic [63:0] float_to_double (logic [31:0] vs2);
			
				double_t vd_double;
				float_t vs2_float;
			
				vs2_float.sign 		= vs2[31];
				vs2_float.exponent 	= vs2[30:23];
				vs2_float.mantissa 	= vs2[22:0];
					
				vd_double.sign 		= vs2_float.sign;
				vd_double.exponent 	= {{3{1'b0}}, vs2_float.exponent} + 11'd896;
				vd_double.mantissa	= {vs2_float.mantissa, {29{1'b0}}};
				
				return vd_double;
			
			endfunction
			
		endpackage
`endif