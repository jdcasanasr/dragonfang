module vector_floating_point_square_root_unit

import 	dragonfang_pkg::*,
		dragonfang_floating_point_pkg::*;
		
(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	
	output 	logic [63:0]		vd
);

	float_t [1:0] 	vs2_float;
	double_t 		vs2_double;
			
	// Pack operands into float_t and double_t structures.
	always_comb
		begin
			vs2_float[0] 	= pack_to_float(vs2[31:0]);
			vs2_float[1] 	= pack_to_float(vs2[63:32]);
			
			vs2_double 		= pack_to_double(vs2);
		end
	
	// Manage supported cases.
	always_comb
		if (execution_vector.reciprocal_mode == ENABLED_RECIPROCAL_MODE)
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE 	: vd = invert_double(square_root_double(vs2_double));
				ENABLED_32BIT_MODE 	:
					begin
						vd[31:0] 	= invert_float(square_root_float(vs2_float[0]));
						vd[63:32] 	= invert_float(square_root_float(vs2_float[1]));
					end
				
				default 			: vd = '0;
			endcase
			
		else
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE 	: vd = square_root_double(vs2_double);
				ENABLED_32BIT_MODE 	:
					begin
						vd[31:0] 	= square_root_float(vs2_float[0]);
						vd[63:32] 	= square_root_float(vs2_float[1]);
					end
				
				default 			: vd = '0;
			endcase
	
endmodule 