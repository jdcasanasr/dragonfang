module vector_floating_point_merge_unit

import 	dragonfang_pkg::*,
		dragonfang_floating_point_pkg::*;
		
(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		v0,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd
);
		
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				vd = (v0[0] ? vs1 : vs2);
			
			ENABLED_32BIT_MODE 	:
				begin
					vd[31:0] 	= (v0[0] ? vs1[31:0] : vs2[31:0]);
					vd[63:32] 	= (v0[1] ? vs1[63:32] : vs2[63:32]);
				end
			
			default				: vd = '0;
		endcase
	
endmodule 