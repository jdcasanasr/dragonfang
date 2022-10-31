module vector_floating_point_minmax_unit

import 	dragonfang_pkg::*,
		dragonfang_floating_point_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd
);
	
	float_t [1:0] 		vs2_float;
	float_t [1:0] 		vs1_float;
	
	double_t 			vs2_double;
	double_t			vs1_double;
	
	float_t [1:0]		vd_float_maximum;
	float_t [1:0]		vd_float_minimum;
	
	double_t 			vd_double_maximum;
	double_t			vd_double_minimum;

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
		if (vs2_float[0].exponent > vs1_float[0])
			begin
				vd_float_maximum[0] = vs2_float[0];
				vd_float_minimum[0] = vs1_float[0];
			end
			
		else
			begin
				vd_float_maximum[0] = vs1_float[0];
				vd_float_minimum[0] = vs2_float[0];
			end
			
	always_comb
		if (vs2_float[1].exponent > vs1_float[1])
			begin
				vd_float_maximum[1] = vs2_float[1];
				vd_float_minimum[1] = vs1_float[1];
			end
			
		else
			begin
				vd_float_maximum[1] = vs1_float[1];
				vd_float_minimum[1] = vs2_float[1];
			end
			
	always_comb
		if (vs2_double.exponent > vs1_double.exponent)
			begin
				vd_double_maximum = vs2_double;
				vd_double_minimum = vs1_double;
			end
			
		else
			begin
				vd_double_maximum = vs1_double;
				vd_double_minimum = vs2_double;
			end
			
	always_comb
		if (execution_vector.maximum_mode == ENABLED_MAXIMUM_MODE)
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE 	: vd = vd_double_maximum;
				ENABLED_32BIT_MODE 	:
					begin
						vd[31:0] 	= vd_float_maximum[0];
						vd[63:32] 	= vd_float_maximum[1];
					end
				
				default 			: vd = '0;
			endcase
		
		else if (execution_vector.minimum_mode == ENABLED_MINIMUM_MODE)
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE 	: vd = vd_double_minimum;
				ENABLED_32BIT_MODE 	:
					begin
						vd[31:0] 	= vd_float_minimum[0];
						vd[63:32] 	= vd_float_minimum[1];
					end
				
				default 			: vd = '0;
			endcase
		
		else
			vd = '0;
			
endmodule 