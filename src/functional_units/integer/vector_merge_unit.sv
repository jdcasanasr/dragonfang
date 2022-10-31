module vector_merge_unit

import dragonfang_pkg::*;

(
	input	execution_vector_t 		execution_vector,
	
	input 	logic [63:0] 			vs2,
	input 	logic [63:0] 			vs1,
	input 	logic [63:0]			v0,
	
	output 	logic [63:0] 			vd
);
	
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				begin
					vd = (v0[0] ? vs1 : vs2);
				end
			
			ENABLED_32BIT_MODE 	:
				begin
					vd[31:0] 	= (v0[0] ? vs1[31:0] : vs2[31:0]);
					vd[63:32] 	= (v0[1] ? vs1[63:32] : vs2[63:32]);
				end
			
			ENABLED_16BIT_MODE 	:
				begin
					vd[15:0] 	= (v0[0] ? vs1[15:0] : vs2[15:0]);
					vd[31:16] 	= (v0[1] ? vs1[31:16] : vs2[31:16]);
					vd[47:32] 	= (v0[2] ? vs1[47:32] : vs2[47:32]);
					vd[63:48] 	= (v0[3] ? vs1[63:48] : vs2[63:48]);
				end
			
			ENABLED_8BIT_MODE 	:
				begin
					vd[7:0] 	= (v0[0] ? vs1[7:0] : vs2[7:0]);
					vd[15:8] 	= (v0[1] ? vs1[15:8] : vs2[15:8]);
					vd[23:16] 	= (v0[2] ? vs1[23:16] : vs2[23:16]);
					vd[31:24] 	= (v0[3] ? vs1[31:24] : vs2[31:24]);
					vd[39:32] 	= (v0[4] ? vs1[39:32] : vs2[39:32]);
					vd[47:40] 	= (v0[5] ? vs1[47:40] : vs2[47:40]);
					vd[55:48] 	= (v0[6] ? vs1[55:48] : vs2[55:48]);
					vd[63:56] 	= (v0[7] ? vs1[63:56] : vs2[63:56]);
				end
			
		endcase
		
endmodule 