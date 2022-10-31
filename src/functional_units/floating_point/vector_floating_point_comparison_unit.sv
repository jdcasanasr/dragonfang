module vector_floating_point_comparison_unit

import 	dragonfang_pkg::*,
		dragonfang_floating_point_pkg::*,
		ieee_754_2019_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0]		vs1,
	
	output 	logic [63:0] 		vd
);
	
	float_t [1:0]		vs2_float;
	float_t [1:0]		vs1_float;
	
	double_t			vs2_double;
	double_t			vs1_double;
	
	always_comb
		begin
			vs2_float[0] 	= pack_to_float(vs2[31:0]);
			vs2_float[1] 	= pack_to_float(vs2[63:32]);
			
			vs1_float[0] 	= pack_to_float(vs1[31:0]);
			vs1_float[1] 	= pack_to_float(vs1[63:32]);
			
			vs2_double 		= pack_to_double(vs2);
			vs1_double 		= pack_to_double(vs1);
		end

	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd = {{63{1'b0}}, compare_signaling_equal_double 			(vs2_double, vs1_double)};
					ENABLED_NOT_EQUAL_MODE 				: vd = {{63{1'b0}}, compare_signaling_not_equal_double 		(vs2_double, vs1_double)};
					ENABLED_LESS_THAN_MODE 				: vd = {{63{1'b0}}, compare_signaling_less_double 			(vs2_double, vs1_double)};
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd = {{63{1'b0}}, compare_signaling_less_equal_double 	(vs2_double, vs1_double)};
					ENABLED_GREATER_THAN_MODE 			: vd = {{63{1'b0}}, compare_signaling_greater_double 		(vs2_double, vs1_double)};
					ENABLED_GREATER_THAN_OR_EQUAL_MODE	: vd = {{63{1'b0}}, compare_signaling_greater_equal_double 	(vs2_double, vs1_double)};
					
					default 							: vd = '0;
				endcase
			
			ENABLED_32BIT_MODE 	:
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd = {{62{1'b0}}, compare_signaling_equal_float 			(vs2_float[1], vs1_float[1]), compare_signaling_equal_float 		(vs2_float[0], vs1_float[0])};
					ENABLED_NOT_EQUAL_MODE 				: vd = {{62{1'b0}}, compare_signaling_not_equal_float 		(vs2_float[1], vs1_float[1]), compare_signaling_not_equal_float 	(vs2_float[0], vs1_float[0])};
					ENABLED_LESS_THAN_MODE				: vd = {{62{1'b0}}, compare_signaling_less_float 			(vs2_float[1], vs1_float[1]), compare_signaling_less_float 			(vs2_float[0], vs1_float[0])};
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd = {{62{1'b0}}, compare_signaling_less_equal_float 		(vs2_float[1], vs1_float[1]), compare_signaling_less_equal_float 	(vs2_float[0], vs1_float[0])};
					ENABLED_GREATER_THAN_MODE 			: vd = {{62{1'b0}}, compare_signaling_greater_float 		(vs2_float[1], vs1_float[1]), compare_signaling_greater_float 		(vs2_float[0], vs1_float[0])};
					ENABLED_GREATER_THAN_OR_EQUAL_MODE	: vd = {{62{1'b0}}, compare_signaling_greater_equal_float 	(vs2_float[1], vs1_float[1]), compare_signaling_greater_equal_float (vs2_float[0], vs1_float[0])};
					
					default 							: vd = '0;
				endcase
		
			default 			: vd = '0;
		endcase
		
endmodule 