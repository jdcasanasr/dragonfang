module vector_floating_point_sign_injection_unit

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
	
	float_t [1:0]		vd_float;
	double_t 			vd_double;

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
		begin
			vd_float[0].exponent 	= vs2_float[0].exponent;
			vd_float[0].mantissa 	= vs2_float[0].mantissa;
			
			vd_float[1].exponent 	= vs2_float[1].exponent;
			vd_float[1].mantissa	= vs2_float[1].mantissa;
			
			vd_double.exponent		= vs2_double.exponent;
			vd_double.mantissa 		= vs2_double.mantissa;
		end
		
	always_comb
		case (execution_vector.sign_injection_mode)
			ENABLED_VS1_SIGN_INJECTION_MODE 		:
				case (execution_vector.bit_mode)
					ENABLED_64BIT_MODE 	:
						begin
							vd_double.sign 	= vs1_double.sign;
							vd 		= unpack_double_to_logic(vd_double);
						end
					
					ENABLED_32BIT_MODE 	:
						begin
							vd_float[0].sign 	= vs1_float[0].sign;
							vd_float[1].sign 	= vs1_float[1].sign;
							
							vd[31:0] 	= unpack_float_to_logic(vd_float[0]);
							vd[63:32] 	= unpack_float_to_logic(vd_float[1]);
						end
					
					default				: vd = '0;
				endcase
			
			ENABLED_NEGATED_VS1_SIGN_INJECTION_MODE :
				case (execution_vector.bit_mode)
					ENABLED_64BIT_MODE 	:
						begin
							vd_double.sign 	= ~vs1_double.sign;
							vd 		= unpack_double_to_logic(vd_double);
						end
					
					ENABLED_32BIT_MODE 	:
						begin
							vd_float[0].sign 	= ~vs1_float[0].sign;
							vd_float[1].sign 	= ~vs1_float[1].sign;
							
							vd[31:0] 	= unpack_float_to_logic(vd_float[0]);
							vd[63:32] 	= unpack_float_to_logic(vd_float[1]);
						end
					
					default				: vd = '0;
				endcase
			
			ENABLED_XOR_SIGN_INJECTION_MODE 		:
				case (execution_vector.bit_mode)
					ENABLED_64BIT_MODE 	:
						begin
							vd_double.sign 	= vs2_double.sign ^ vs1_double.sign;
							vd 		= unpack_double_to_logic(vd_double);
						end
					
					ENABLED_32BIT_MODE 	:
						begin
							vd_float[0].sign 	= vs2_float[0].sign ^ vs1_float[0].sign;
							vd_float[1].sign 	= vs2_float[1].sign ^ vs1_float[1].sign;
							
							vd[31:0] 	= unpack_float_to_logic(vd_float[0]);
							vd[63:32] 	= unpack_float_to_logic(vd_float[1]);
						end
					
					default				: vd = '0;
				endcase
			
			default 								: vd = '0;
		endcase
			
endmodule 