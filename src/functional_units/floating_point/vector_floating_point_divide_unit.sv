module vector_floating_point_divide_unit

import 	dragonfang_pkg::*,
		dragonfang_floating_point_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd
);
	
	logic [63:0] vs2_effective;
	logic [63:0] vs1_effective;
	
	double_t vs2_double;
	double_t vs1_double;
	
	float_t [1:0] vs2_float;
	float_t [1:0] vs1_float;
	
	always_comb
		if (execution_vector.reverse_mode == ENABLED_REVERSE_MODE)
			begin
				vs2_effective = vs1;
				vs1_effective = vs2;
			end
					
		else
			begin
				vs2_effective = vs2;
				vs1_effective = vs1;
			end
			
	always_comb
		begin
			vs2_double 		= pack_to_double(vs2_effective);
			vs1_double 		= pack_to_double(vs1_effective);
			
			vs2_float[0] 	= pack_to_float(vs2_effective[31:0]);
			vs2_float[1] 	= pack_to_float(vs2_effective[63:32]);
			
			vs1_float[0] 	= pack_to_float(vs1_effective[31:0]);
			vs1_float[1] 	= pack_to_float(vs1_effective[63:32]);
		end
			
	always_comb
		// Return only an inverted (1 / vs2) version of vs2.
		if (execution_vector.reciprocal_mode == ENABLED_RECIPROCAL_MODE)
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE 	:
					vd 				= unpack_double_to_logic(invert_double(vs2_double));

				
				ENABLED_32BIT_MODE 	:
					begin
						vd[31:0] 	= unpack_float_to_logic(invert_float(vs2_float[0]));
						vd[63:32] 	= unpack_float_to_logic(invert_float(vs2_float[1]));
					end
				
				default				:
					vd 	= '0;
					
			endcase
		
		else
			// Perform common division.
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE 	:
					vd 				= unpack_double_to_logic(divide_double(vs2_double, vs1_double));

				
				ENABLED_32BIT_MODE 	:
					begin
						vd[31:0] 	= unpack_float_to_logic(divide_float(vs2_float[0], vs1_float[0]));
						vd[63:32] 	= unpack_float_to_logic(divide_float(vs2_float[1], vs1_float[1]));
					end
				
				default				:
					vd 	= '0;
					
			endcase
	
endmodule 