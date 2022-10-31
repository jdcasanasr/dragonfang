module vector_division_unit

import dragonfang_pkg::*;

(
	input 	execution_vector_t 	execution_vector,

	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd
);
	
	// Deliver the division or remainder according to settings.
	always_comb
		if (execution_vector.remainder_mode == ENABLED_REMAINDER_MODE) 	// Deliver the remainder.
			case (execution_vector.sign_mode)
				ENABLED_UNSIGNED_UNSIGNED_MODE 	:
					case (execution_vector.bit_mode)
						ENABLED_64BIT_MODE :
							begin
								vd 			= $unsigned(vs2) 			% $unsigned(vs1);
							end
							
						ENABLED_32BIT_MODE :
							begin
								vd[31:0] 	= $unsigned(vs2[31:0]) 	% $unsigned(vs1[31:0]);
								vd[63:32] 	= $unsigned(vs2[63:32]) 	% $unsigned(vs1[63:32]);
							end
							
						ENABLED_16BIT_MODE :
							begin
								vd[15:0] 	= $unsigned(vs2[15:0]) 	% $unsigned(vs1[15:0]);
								vd[31:16] 	= $unsigned(vs2[31:16]) 	% $unsigned(vs1[31:16]);
								vd[47:32] 	= $unsigned(vs2[47:32]) 	% $unsigned(vs1[47:32]);
								vd[63:48] 	= $unsigned(vs2[63:48]) 	% $unsigned(vs1[63:48]);
							end
							
						ENABLED_8BIT_MODE :
							begin	
								vd[7:0] 		= $unsigned(vs2[7:0]) 		% $unsigned(vs1[7:0]);
								vd[15:8] 	= $unsigned(vs2[15:8])		% $unsigned(vs1[15:8]);
								vd[23:16] 	= $unsigned(vs2[23:16]) 	% $unsigned(vs1[23:16]);
								vd[31:24] 	= $unsigned(vs2[31:24]) 	% $unsigned(vs1[31:24]);
								vd[39:32] 	= $unsigned(vs2[39:32]) 	% $unsigned(vs1[39:32]);
								vd[47:40] 	= $unsigned(vs2[47:40]) 	% $unsigned(vs1[47:40]);
								vd[55:48] 	= $unsigned(vs2[55:48]) 	% $unsigned(vs1[55:48]);
								vd[63:56] 	= $unsigned(vs2[63:56]) 	% $unsigned(vs1[63:56]);
							end
					endcase
					
				ENABLED_SIGNED_SIGNED_MODE 	:
					case (execution_vector.bit_mode)
						ENABLED_64BIT_MODE :
							begin
								vd 			= $signed(vs2) 			% $signed(vs1);
							end
							
						ENABLED_32BIT_MODE :
							begin
								vd[31:0] 	= $signed(vs2[31:0]) 		% $signed(vs1[31:0]);
								vd[63:32] 	= $signed(vs2[63:32]) 		% $signed(vs1[63:32]);
							end
							
						ENABLED_16BIT_MODE :
							begin
								vd[15:0] 	= $signed(vs2[15:0]) 		% $signed(vs1[15:0]);
								vd[31:16] 	= $signed(vs2[31:16]) 		% $signed(vs1[31:16]);
								vd[47:32] 	= $signed(vs2[47:32]) 		% $signed(vs1[47:32]);
								vd[63:48] 	= $signed(vs2[63:48]) 		% $signed(vs1[63:48]);
							end
							
						ENABLED_8BIT_MODE :
							begin	
								vd[7:0] 	= $signed(vs2[7:0]) 		% $signed(vs1[7:0]);
								vd[15:8] 	= $signed(vs2[15:8])		% $signed(vs1[15:8]);
								vd[23:16] 	= $signed(vs2[23:16]) 		% $signed(vs1[23:16]);
								vd[31:24] 	= $signed(vs2[31:24]) 		% $signed(vs1[31:24]);
								vd[39:32] 	= $signed(vs2[39:32]) 		% $signed(vs1[39:32]);
								vd[47:40] 	= $signed(vs2[47:40]) 		% $signed(vs1[47:40]);
								vd[55:48] 	= $signed(vs2[55:48]) 		% $signed(vs1[55:48]);
								vd[63:56] 	= $signed(vs2[63:56]) 		% $signed(vs1[63:56]);
							end
					endcase
					
				default :
					begin
						vd = '0;
					end
			endcase
		
		else										// Deliver the division.
			case (execution_vector.sign_mode)
				ENABLED_UNSIGNED_UNSIGNED_MODE 	:
					case (execution_vector.bit_mode)
						ENABLED_64BIT_MODE :
							begin
								vd 			= $unsigned(vs2) 			/ $unsigned(vs1);
							end
							
						ENABLED_32BIT_MODE :
							begin
								vd[31:0] 	= $unsigned(vs2[31:0]) 	/ $unsigned(vs1[31:0]);
								vd[63:32] 	= $unsigned(vs2[63:32]) 	/ $unsigned(vs1[63:32]);
							end
							
						ENABLED_16BIT_MODE :
							begin
								vd[15:0] 	= $unsigned(vs2[15:0]) 	/ $unsigned(vs1[15:0]);
								vd[31:16] 	= $unsigned(vs2[31:16]) 	/ $unsigned(vs1[31:16]);
								vd[47:32] 	= $unsigned(vs2[47:32]) 	/ $unsigned(vs1[47:32]);
								vd[63:48] 	= $unsigned(vs2[63:48]) 	/ $unsigned(vs1[63:48]);
							end
							
						ENABLED_8BIT_MODE :
							begin	
								vd[7:0] 	= $unsigned(vs2[7:0]) 		/ $unsigned(vs1[7:0]);
								vd[15:8] 	= $unsigned(vs2[15:8])		/ $unsigned(vs1[15:8]);
								vd[23:16] 	= $unsigned(vs2[23:16]) 	/ $unsigned(vs1[23:16]);
								vd[31:24] 	= $unsigned(vs2[31:24]) 	/ $unsigned(vs1[31:24]);
								vd[39:32] 	= $unsigned(vs2[39:32]) 	/ $unsigned(vs1[39:32]);
								vd[47:40] 	= $unsigned(vs2[47:40]) 	/ $unsigned(vs1[47:40]);
								vd[55:48] 	= $unsigned(vs2[55:48]) 	/ $unsigned(vs1[55:48]);
								vd[63:56] 	= $unsigned(vs2[63:56]) 	/ $unsigned(vs1[63:56]);
							end
					endcase
					
				ENABLED_SIGNED_SIGNED_MODE 	:
					case (execution_vector.bit_mode)
						ENABLED_64BIT_MODE :
							begin
								vd 			= $signed(vs2) 			/ $signed(vs1);
							end
							
						ENABLED_32BIT_MODE :
							begin
								vd[31:0] 	= $signed(vs2[31:0]) 		/ $signed(vs1[31:0]);
								vd[63:32] 	= $signed(vs2[63:32]) 		/ $signed(vs1[63:32]);
							end
							
						ENABLED_16BIT_MODE :
							begin
								vd[15:0] 	= $signed(vs2[15:0]) 		/ $signed(vs1[15:0]);
								vd[31:16] 	= $signed(vs2[31:16]) 		/ $signed(vs1[31:16]);
								vd[47:32] 	= $signed(vs2[47:32]) 		/ $signed(vs1[47:32]);
								vd[63:48] 	= $signed(vs2[63:48]) 		/ $signed(vs1[63:48]);
							end
							
						ENABLED_8BIT_MODE :
							begin	
								vd[7:0] 	= $signed(vs2[7:0]) 		/ $signed(vs1[7:0]);
								vd[15:8] 	= $signed(vs2[15:8])		/ $signed(vs1[15:8]);
								vd[23:16] 	= $signed(vs2[23:16]) 		/ $signed(vs1[23:16]);
								vd[31:24] 	= $signed(vs2[31:24]) 		/ $signed(vs1[31:24]);
								vd[39:32] 	= $signed(vs2[39:32]) 		/ $signed(vs1[39:32]);
								vd[47:40] 	= $signed(vs2[47:40]) 		/ $signed(vs1[47:40]);
								vd[55:48] 	= $signed(vs2[55:48]) 		/ $signed(vs1[55:48]);
								vd[63:56] 	= $signed(vs2[63:56]) 		/ $signed(vs1[63:56]);
							end
					endcase
					
				default :
					begin
						vd = '0;
					end
			endcase
	
endmodule 