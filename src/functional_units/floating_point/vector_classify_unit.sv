module vector_classify_unit 

	import 	dragonfang_pkg::*,
			dragonfang_floating_point_pkg::*,
			ieee_754_2019_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	
	output 	logic [63:0] 		vd
);
	
	float_t [1:0]		vs2_float;
	double_t			vs2_double;
	
	always_comb
		begin
			vs2_float[0] 	= pack_to_float(vs2[31:0]);
			vs2_float[1] 	= pack_to_float(vs2[63:32]);
			
			vs2_double 		= pack_to_double(vs2);
		end
		
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	: vd = {{54{1'b0}}, classify_double(vs2_double)};
			
			ENABLED_32BIT_MODE 	:
				begin
					vd[31:0] 	= {{22{1'b0}}, classify_float(vs2_float[0])};
					vd[63:32] 	= {{22{1'b0}}, classify_float(vs2_float[1])};
				end
			
			default 			: vd = '0;
		endcase
		
endmodule 