module vector_shift_unit

import dragonfang_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,	// Shift amount vector.
	
	output 	logic [63:0] 		vd
);
	logic [63:0]		vd_aux;
	
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				case (execution_vector.shift_mode)
					ENABLED_SHIFT_LEFT_LOGICAL_MODE 	:
						begin
							vd = vs2 << vs1[5:0];
							vd_aux = '0;
						end
					
					ENABLED_SHIFT_RIGHT_LOGICAL_MODE 	: // Narrowing is supported.
						if (execution_vector.narrowing_mode == ENABLED_NARROWING_MODE)
							begin
								vd_aux = vs2 >> vs1[5:0];
								vd = {{32{1'b0}}, vd_aux[63:32]};
							end
							
						else
							begin
								vd = vs2 >> vs1[5:0];
								vd_aux = '0;
							end
							
					ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE : // Narrowing is supported.
						if (execution_vector.narrowing_mode == ENABLED_NARROWING_MODE)
							begin
								vd_aux = vs2 >>> vs1[5:0];
								vd = {{32{vd_aux[63]}}, vd_aux[63:32]};
							end
							
						else
							begin
								vd = vs2 >>> vs1[5:0];
								vd_aux = '0;
							end
					
					default								:
						begin
							vd = '0;
							vd_aux = '0;
						end
				endcase
			
			ENABLED_32BIT_MODE 	:
				case (execution_vector.shift_mode)
					ENABLED_SHIFT_LEFT_LOGICAL_MODE 	:
						begin
							vd[31:0] 	= vs2[31:0] << vs1[4:0];
							vd[63:32] 	= vs2[63:32] << vs1[36:32];
							vd_aux = '0;
						end
					
					ENABLED_SHIFT_RIGHT_LOGICAL_MODE 	:
						if (execution_vector.narrowing_mode == ENABLED_NARROWING_MODE)
							begin
								vd_aux[31:0] 	= vs2[31:0] >> vs1[4:0];
								vd_aux[63:32] 	= vs2[63:32] >> vs1[36:32];
								
								vd[31:0] 	= {{16{1'b0}}, vd_aux[31:16]};
								vd[63:32] 	= {{16{1'b0}}, vd_aux[63:48]};
							end
							
						else
							begin
								vd[31:0] 	= vs2[31:0] >> vs1[4:0];
								vd[63:32] 	= vs2[63:32] >> vs1[36:32];
								vd_aux = '0;
							end
					
					ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE :
						if (execution_vector.narrowing_mode == ENABLED_NARROWING_MODE)
							begin
								vd_aux[31:0] 	= vs2[31:0] >>> vs1[4:0];
								vd_aux[63:32] 	= vs2[63:32] >>> vs1[36:32];
								
								vd[31:0] 	= {{16{vd_aux[31]}}, vd_aux[31:16]};
								vd[63:32] 	= {{16{vd_aux[63]}}, vd_aux[63:48]};
							end
							
						else
							begin
								vd[31:0] 	= vs2[31:0] >>> vs1[4:0];
								vd[63:32] 	= vs2[63:32] >>> vs1[36:32];
								vd_aux = '0;
							end
					
					default								:
						begin
							vd = '0;
							vd_aux = '0;
						end
				endcase
			
			ENABLED_16BIT_MODE 	:
				case (execution_vector.shift_mode)
					ENABLED_SHIFT_LEFT_LOGICAL_MODE 	:
						begin
							vd [15:0] 	= vs2[15:0] << vs1 [3:0];
							vd [31:16] 	= vs2[31:16] << vs1 [19:16];
							vd [47:32] 	= vs2[47:32] << vs1 [35:32];
							vd [63:48] 	= vs2[63:48] << vs1 [51:48];
							vd_aux = '0;
						end
					
					ENABLED_SHIFT_RIGHT_LOGICAL_MODE 	:
						if (execution_vector.narrowing_mode == ENABLED_NARROWING_MODE)
							begin
								vd_aux [15:0] 	= vs2[15:0] >> vs1 [3:0];
								vd_aux [31:16] 	= vs2[31:16] >> vs1 [19:16];
								vd_aux [47:32] 	= vs2[47:32] >> vs1 [35:32];
								vd_aux [63:48] 	= vs2[63:48] >> vs1 [51:48];
								
								vd [15:0] 	= {{8{1'b0}}, vd_aux[15:8]};
								vd [31:16] 	= {{8{1'b0}}, vd_aux[31:24]};
								vd [47:32] 	= {{8{1'b0}}, vd_aux[47:40]};
								vd [63:48] 	= {{8{1'b0}}, vd_aux[63:56]};
							end
							
						else
							begin
								vd [15:0] 	= vs2[15:0] >> vs1 [3:0];
								vd [31:16] 	= vs2[31:16] >> vs1 [19:16];
								vd [47:32] 	= vs2[47:32] >> vs1 [35:32];
								vd [63:48] 	= vs2[63:48] >> vs1 [51:48];
								vd_aux = '0;
							end
					
					ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE :
						if (execution_vector.narrowing_mode == ENABLED_NARROWING_MODE)
							begin
								vd_aux [15:0] 	= vs2[15:0] >>> vs1 [3:0];
								vd_aux [31:16] 	= vs2[31:16] >>> vs1 [19:16];
								vd_aux [47:32] 	= vs2[47:32] >>> vs1 [35:32];
								vd_aux [63:48] 	= vs2[63:48] >>> vs1 [51:48];
								
								vd [15:0] 	= {{8{vd_aux[15]}}, vd_aux[15:8]};
								vd [31:16] 	= {{8{vd_aux[31]}}, vd_aux[31:24]};
								vd [47:32] 	= {{8{vd_aux[47]}}, vd_aux[47:40]};
								vd [63:48] 	= {{8{vd_aux[63]}}, vd_aux[63:56]};
							end
							
						else
							begin
								vd [15:0] 	= vs2[15:0] >>> vs1 [3:0];
								vd [31:16] 	= vs2[31:16] >>> vs1 [19:16];
								vd [47:32] 	= vs2[47:32] >>> vs1 [35:32];
								vd [63:48] 	= vs2[63:48] >>> vs1 [51:48];
								vd_aux = '0;
							end
					
					default								:
						begin
							vd = '0;
							vd_aux = '0;
						end
				endcase
				
			ENABLED_8BIT_MODE 	:
				case (execution_vector.shift_mode)
					ENABLED_SHIFT_LEFT_LOGICAL_MODE 	:
						begin
							vd[7:0] 	= vs2[7:0] << vs1[2:0];
							vd[15:8] 	= vs2[15:8] << vs1[10:8];
							vd[23:16] 	= vs2[23:16] << vs1[18:16];
							vd[31:24] 	= vs2[31:24] << vs1[26:24];
							vd[39:32] 	= vs2[39:32] << vs1[34:32];
							vd[47:40] 	= vs2[47:40] << vs1[42:40];
							vd[55:48] 	= vs2[55:48] << vs1[50:48];
							vd[63:56] 	= vs2[63:56] << vs1[58:56];
							vd_aux = '0;
						end
					
					ENABLED_SHIFT_RIGHT_LOGICAL_MODE 	:
						begin
							vd[7:0] 	= vs2[7:0] >> vs1[2:0];
							vd[15:8] 	= vs2[15:8] >> vs1[10:8];
							vd[23:16] 	= vs2[23:16] >> vs1[18:16];
							vd[31:24] 	= vs2[31:24] >> vs1[26:24];
							vd[39:32] 	= vs2[39:32] >> vs1[34:32];
							vd[47:40] 	= vs2[47:40] >> vs1[42:40];
							vd[55:48] 	= vs2[55:48] >> vs1[50:48];
							vd[63:56] 	= vs2[63:56] >> vs1[58:56];
							vd_aux = '0;
						end
					
					ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE :
						begin
							vd[7:0] 	= vs2[7:0] >>> vs1[2:0];
							vd[15:8] 	= vs2[15:8] >>> vs1[10:8];
							vd[23:16] 	= vs2[23:16] >>> vs1[18:16];
							vd[31:24] 	= vs2[31:24] >>> vs1[26:24];
							vd[39:32] 	= vs2[39:32] >>> vs1[34:32];
							vd[47:40] 	= vs2[47:40] >>> vs1[42:40];
							vd[55:48] 	= vs2[55:48] >>> vs1[50:48];
							vd[63:56] 	= vs2[63:56] >>> vs1[58:56];
							vd_aux = '0;
						end
					
					default 							:
						begin
							vd = '0;
							vd_aux = '0;
						end
				endcase
		endcase
	
endmodule 