module vector_floating_point_multiply_add_unit

import 	dragonfang_pkg::*,
		dragonfang_floating_point_pkg::*;

(
	input 	execution_vector_t 	execution_vector,

	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	input 	logic [63:0] 		vdd,
	
	output 	logic [63:0] 		vd,
	output 	logic [63:0] 		vd_high
);
	
	double_t vs2_double;
	double_t vs1_double;
	double_t vd_double;
	
	float_t vs2_float[2]; // Same as float_t [1:0] vs2_float; ?
	float_t vs1_float[2];
	float_t vd_float[2];

	// Pack bit streams into double_t and float_t structures.
	always_comb
		begin
			vs2_double 		= pack_to_double(vs2);
			vs1_double 		= pack_to_double(vs1);
			vd_double		= pack_to_double(vdd);
			
			vs2_float[0] 	= pack_to_float(vs2[31:0]);
			vs2_float[1] 	= pack_to_float(vs1[63:32]);
			
			vs1_float[0] 	= pack_to_float(vs1[31:0]);
			vs1_float[1] 	= pack_to_float(vs1[63:32]);
			
			vd_float[0]		= pack_to_float(vdd[31:0]);
			vd_float[1]		= pack_to_float(vdd[63:32]);
		end
		
	// Manage supported cases.
	always_comb
		if (execution_vector.widening_mode == ENABLED_WIDENING_MODE)
			if (execution_vector.negate_mode == ENABLED_NEGATE_MODE)
				if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE) // - -
					if (execution_vector.bit_mode == ENABLED_32BIT_MODE)
						begin
							vd 	= unpack_double_to_logic(float_to_double(sub_float(negate_float(multiply_float(vs1_float[0], vs2_float[0])), vd_float[0])));
							vd_high = unpack_double_to_logic(float_to_double(sub_float(negate_float(multiply_float(vs1_float[1], vs2_float[1])), vd_float[1])));
						end
						
					else
						begin
							vd 	= '0;
							vd_high = '0;
						end
						
				else																	// - +
					if (execution_vector.bit_mode == ENABLED_32BIT_MODE)
						begin
							vd 	= unpack_double_to_logic(float_to_double(add_float(negate_float(multiply_float(vs1_float[0], vs2_float[0])), vd_float[0])));
							vd_high = unpack_double_to_logic(float_to_double(add_float(negate_float(multiply_float(vs1_float[1], vs2_float[1])), vd_float[1])));
						end
						
					else
						begin
							vd 	= '0;
							vd_high = '0;
						end
						
			else
				if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE) // + -
					if (execution_vector.bit_mode == ENABLED_32BIT_MODE)
						begin
							vd 	= unpack_double_to_logic(float_to_double(sub_float(multiply_float(vs1_float[0], vs2_float[0]), vd_float[0])));
							vd_high = unpack_double_to_logic(float_to_double(sub_float(multiply_float(vs1_float[1], vs2_float[1]), vd_float[1])));
						end
						
					else
						begin
							vd 	= '0;
							vd_high = '0;
						end
						
				else																	// + +
					if (execution_vector.bit_mode == ENABLED_32BIT_MODE)
						begin
							vd 	= unpack_double_to_logic(float_to_double(add_float(multiply_float(vs1_float[0], vs2_float[0]), vd_float[0])));
							vd_high = unpack_double_to_logic(float_to_double(add_float(multiply_float(vs1_float[1], vs2_float[1]), vd_float[1])));
						end
						
					else
						begin
							vd 	= '0;
							vd_high = '0;
						end
		
		else
			if (execution_vector.negate_mode == ENABLED_NEGATE_MODE) 
				if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE) // - -
					case (execution_vector.bit_mode)
						ENABLED_64BIT_MODE :
							begin
								vd 	= unpack_double_to_logic(sub_double(negate_double(multiply_double(vs1_double, vs2_double)), vd_double));
								vd_high = '0;
							end
							
						ENABLED_32BIT_MODE :
							begin
								vd[31:0] 	= unpack_float_to_logic(sub_float(negate_float(multiply_float(vs1_float[0], vs2_float[0])), vd_float[0]));
								vd[63:32] 	= unpack_float_to_logic(sub_float(negate_float(multiply_float(vs1_float[1], vs2_float[1])), vd_float[1]));;
								vd_high 		= '0;
							end
						
						default 			:
							begin
								vd 	= '0;
								vd_high = '0;
							end
					endcase
				
				else
					case (execution_vector.bit_mode)								// - +
						ENABLED_64BIT_MODE :
							begin
								vd 	= unpack_double_to_logic(add_double(negate_double(multiply_double(vs1_double, vs2_double)), vd_double));
								vd_high = '0;
							end
						
						ENABLED_32BIT_MODE :
							begin
								vd[31:0] 	= unpack_float_to_logic(add_float(negate_float(multiply_float(vs1_float[0], vs2_float[0])), vd_float[0]));
								vd[63:32] 	= unpack_float_to_logic(add_float(negate_float(multiply_float(vs1_float[1], vs2_float[1])), vd_float[1]));;
								vd_high 		= '0;
							end
						
						default 			:
							begin
								vd 	= '0;
								vd_high = '0;
							end
					endcase
					
			else
				if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE) // + -
					case (execution_vector.bit_mode)
						ENABLED_64BIT_MODE :
							begin
								vd 	= unpack_double_to_logic(sub_double(multiply_double(vs1_double, vs2_double), vd_double));
								vd_high = '0;
							end
						
						ENABLED_32BIT_MODE :
							begin
								vd[31:0] 	= unpack_float_to_logic(sub_float(multiply_float(vs1_float[0], vs2_float[0]), vd_float[0]));
								vd[63:32] 	= unpack_float_to_logic(sub_float(multiply_float(vs1_float[1], vs2_float[1]), vd_float[1]));
								vd_high 		= '0;
							end
						
						default 			:
							begin
								vd 	= '0;
								vd_high = '0;
							end
					endcase
					
				else
					case (execution_vector.bit_mode)								// + +
						ENABLED_64BIT_MODE :
							begin
								vd 		= unpack_double_to_logic(add_double(multiply_double(vs1_double, vs2_double), vd_double));
								vd_high = '0;
							end
						
						ENABLED_32BIT_MODE :
							begin
								vd[31:0] 	= unpack_float_to_logic(add_float(multiply_float(vs1_float[0], vs2_float[0]), vd_float[0]));
								vd[63:32] 	= unpack_float_to_logic(add_float(multiply_float(vs1_float[1], vs2_float[1]), vd_float[1]));
								vd_high 	= '0;
							end
						
						default 			:
							begin
								vd 		= '0;
								vd_high = '0;
							end
					endcase
	
endmodule 