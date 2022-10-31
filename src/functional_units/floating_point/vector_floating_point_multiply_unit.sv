module vector_floating_point_multiply_unit

import 	dragonfang_pkg::*,
		dragonfang_floating_point_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd,
	output 	logic [63:0] 		vd_high
);

	double_t 		vs2_double;
	double_t		vs1_double;
	float_t [1:0]   vs2_float;
	float_t [1:0]   vs1_float;
	
	// Unpack bit streams into floating-point structures.
	always_comb
		begin
			vs2_double 		= pack_to_double(vs2);
			vs1_double 		= pack_to_double(vs1);
			
			vs2_float[0] 	= pack_to_float(vs2[31:0]);
			vs2_float[1] 	= pack_to_float(vs2[63:32]);
			
			vs1_float[0] 	= pack_to_float(vs1[31:0]);
			vs1_float[1] 	= pack_to_float(vs1[63:32]);
		end
		
	// Manage the supported cases.
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				begin
					vd 	= unpack_double_to_logic(multiply_double(vs2_double, vs1_double));
					vd_high	= '0;
				end
			
			ENABLED_32BIT_MODE 	:
				if (execution_vector.widening_mode == ENABLED_WIDENING_MODE)
					begin
						vd 	= unpack_double_to_logic(float_to_double(multiply_float(vs2_float[0], vs1_float[0])));
						vd_high = unpack_double_to_logic(float_to_double(multiply_float(vs2_float[1], vs1_float[1])));
					end
					
				else
					begin
						vd[31:0] 	= unpack_float_to_logic(multiply_float(vs2_float[0], vs1_float[0]));
						vd[63:32] 	= unpack_float_to_logic(multiply_float(vs2_float[1], vs1_float[1]));
						vd_high			= '0;
					end
			
			default				:
				begin
					vd 	= '0;
					vd_high = '0;
				end
				
		endcase
	
endmodule 