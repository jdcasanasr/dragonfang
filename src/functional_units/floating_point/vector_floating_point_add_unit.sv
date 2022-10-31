module vector_floating_point_add_unit

import 	dragonfang_pkg::*,
		dragonfang_floating_point_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd,
	output 	logic [63:0]		vd_high
);

	double_t 			vs2_double;
	double_t 			vs1_double;
	float_t [1:0] 		vs2_float;
	float_t [1:0] 		vs1_float;
	
	// Pack bit streams into double_t and float_t structures.
	always_comb
		begin
			vs2_double 		= pack_to_double(vs2);
			vs1_double 		= pack_to_double(vs1);
			
			vs2_float[0] 	= pack_to_float(vs2[31:0]);
			vs2_float[1] 	= pack_to_float(vs1[63:32]);
			
			vs1_float[0] 	= pack_to_float(vs1[31:0]);
			vs1_float[1] 	= pack_to_float(vs1[63:32]);
		end
	
	// Manage sums
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE)
					begin
						vd 	= unpack_double_to_logic(sub_double(vs2_double, vs1_double));
						vd_high = '0;
					end
				
				else if (execution_vector.reverse_subtraction_mode == ENABLED_REVERSE_SUBTRACTION_MODE)
					begin
						vd 	= unpack_double_to_logic(sub_double(vs1_double, vs2_double));
						vd_high = '0;
					end
					
				else
					begin
						vd 	= unpack_double_to_logic(add_double(vs2_double, vs1_double));
						vd_high = '0;
					end
			
			// Only the 32-bit mode allows for widening!.
			ENABLED_32BIT_MODE 	:
				if (execution_vector.widening_mode == ENABLED_WIDENING_MODE)
					if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE)
						begin
							vd 	= unpack_double_to_logic(float_to_double(sub_float(vs2_float[0], vs1_float[0])));
							vd_high = unpack_double_to_logic(float_to_double(sub_float(vs2_float[1], vs1_float[1])));
						end
				
					else if (execution_vector.reverse_subtraction_mode == ENABLED_REVERSE_SUBTRACTION_MODE)
						begin
							vd 	= unpack_double_to_logic(float_to_double(sub_float(vs1_float[0], vs2_float[0])));
							vd_high = unpack_double_to_logic(float_to_double(sub_float(vs1_float[1], vs2_float[1])));
						end
					
					else
						begin
							vd 	= unpack_double_to_logic(float_to_double(add_float(vs2_float[0], vs1_float[0])));
							vd_high = unpack_double_to_logic(float_to_double(add_float(vs2_float[1], vs1_float[1])));
						end
						
				else
					if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE)
						begin
							vd[31:0] 	= unpack_float_to_logic(sub_float(vs2_float[0], vs1_float[0]));
							vd[63:32]	= unpack_float_to_logic(sub_float(vs2_float[1], vs1_float[1]));
							vd_high 		= '0;
						end
				
					else if (execution_vector.reverse_subtraction_mode == ENABLED_REVERSE_SUBTRACTION_MODE)
						begin
							vd[31:0] 	= unpack_float_to_logic(sub_float(vs1_float[0], vs2_float[0]));
							vd[63:32]	= unpack_float_to_logic(sub_float(vs1_float[1], vs2_float[1]));
							vd_high 		= '0;
						end
					
					else
						begin
							vd[31:0] 	= unpack_float_to_logic(add_float(vs1_float[0], vs2_float[0]));
							vd[63:32]	= unpack_float_to_logic(add_float(vs1_float[1], vs2_float[1]));
							vd_high 		= '0;
						end
		
			default				:
				begin
					vd 	= '0;
					vd_high = '0;
				end
		endcase
	
endmodule 