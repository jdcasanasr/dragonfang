module vector_multiplication_unit

import dragonfang_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0]	 	vd,
	output 	logic [63:0]		vd_high
);

	logic [127:0]		vd_complete_bus;

	// Manage product according to bit_mode and sign_mode settings.
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE : 	// 64
				case (execution_vector.sign_mode)
					ENABLED_UNSIGNED_UNSIGNED_MODE 	: vd_complete_bus = $unsigned(vs2) 	* $unsigned(vs1);
					ENABLED_SIGNED_UNSIGNED_MODE 	: vd_complete_bus = $signed(vs2) 	* $unsigned(vs1);
					ENABLED_SIGNED_SIGNED_MODE 		: vd_complete_bus = $signed(vs2) 	* $signed(vs1);
					
					default : vd_complete_bus = '0;
				endcase

			ENABLED_32BIT_MODE : 	// 32
				case (execution_vector.sign_mode)
					ENABLED_UNSIGNED_UNSIGNED_MODE :
						begin
							vd_complete_bus[63:0] 	= $unsigned(vs2[31:0]) 	* $unsigned(vs1[31:0]);
							vd_complete_bus[127:64] 	= $unsigned(vs2[63:32]) 	* $unsigned(vs1[63:32]);
						end
					
					ENABLED_SIGNED_UNSIGNED_MODE :
						begin
							vd_complete_bus[63:0] 	= $signed(vs2[31:0]) 	* $unsigned(vs1[31:0]);
							vd_complete_bus[127:64] 	= $signed(vs2[63:32]) 	* $unsigned(vs1[63:32]);
						end
					
					ENABLED_SIGNED_SIGNED_MODE :
						begin
							vd_complete_bus[63:0] 	= $signed(vs2[31:0]) 	* $signed(vs1[31:0]);
							vd_complete_bus[127:64] 	= $signed(vs2[63:32]) 	* $signed(vs1[63:32]);
						end
					
					default :
						begin
							vd_complete_bus[63:0] 	= '0;
							vd_complete_bus[127:64] 	= '0;
						end
				endcase

			ENABLED_16BIT_MODE : 	// 16
				case (execution_vector.sign_mode)
					ENABLED_UNSIGNED_UNSIGNED_MODE :
						begin
							vd_complete_bus[31:0] 	= $unsigned(vs2[15:0]) 	* $unsigned(vs1[15:0]);
							vd_complete_bus[63:32] 	= $unsigned(vs2[31:16]) 	* $unsigned(vs1[31:16]);
							vd_complete_bus[95:64] 	= $unsigned(vs2[47:32]) 	* $unsigned(vs1[47:32]);
							vd_complete_bus[127:96] 	= $unsigned(vs2[63:48]) 	* $unsigned(vs1[63:48]);
						end
					
					ENABLED_SIGNED_UNSIGNED_MODE :
						begin
							vd_complete_bus[31:0] 	= $signed(vs2[15:0]) 	* $unsigned(vs1[15:0]);
							vd_complete_bus[63:32] 	= $signed(vs2[31:16]) 	* $unsigned(vs1[31:16]);
							vd_complete_bus[95:64] 	= $signed(vs2[47:32]) 	* $unsigned(vs1[47:32]);
							vd_complete_bus[127:96] 	= $signed(vs2[63:48]) 	* $unsigned(vs1[63:48]);
						end
					
					ENABLED_SIGNED_SIGNED_MODE :
						begin
							vd_complete_bus[31:0] 	= $signed(vs2[15:0]) 	* $signed(vs1[15:0]);
							vd_complete_bus[63:32] 	= $signed(vs2[31:16]) 	* $signed(vs1[31:16]);
							vd_complete_bus[95:64] 	= $signed(vs2[47:32]) 	* $signed(vs1[47:32]);
							vd_complete_bus[127:96] 	= $signed(vs2[63:48]) 	* $signed(vs1[63:48]);
						end
					
					default :
						begin
							vd_complete_bus[31:0] 	= '0;
							vd_complete_bus[63:32] 	= '0;
							vd_complete_bus[95:64] 	= '0;
							vd_complete_bus[127:96] 	= '0;
						end
				endcase

			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.sign_mode)
					ENABLED_UNSIGNED_UNSIGNED_MODE :
						begin
							vd_complete_bus[15:0] 	= $unsigned(vs2[7:0]) 		* $unsigned(vs1[7:0]);
							vd_complete_bus[31:16] 	= $unsigned(vs2[15:8])		* $unsigned(vs1[15:8]);
							vd_complete_bus[47:32] 	= $unsigned(vs2[23:16]) 	* $unsigned(vs1[23:16]);
							vd_complete_bus[63:48] 	= $unsigned(vs2[31:24]) 	* $unsigned(vs1[31:24]);
							vd_complete_bus[79:64] 	= $unsigned(vs2[39:32]) 	* $unsigned(vs1[39:32]);
							vd_complete_bus[95:80] 	= $unsigned(vs2[47:40]) 	* $unsigned(vs1[47:40]);
							vd_complete_bus[111:96] 	= $unsigned(vs2[55:48]) 	* $unsigned(vs1[55:48]);
							vd_complete_bus[127:112] = $unsigned(vs2[63:56]) 	* $unsigned(vs1[63:56]);
						end
					
					ENABLED_SIGNED_UNSIGNED_MODE :
						begin
							vd_complete_bus[15:0] 	= $signed(vs2[7:0]) 	* $unsigned(vs1[7:0]);
							vd_complete_bus[31:16] 	= $signed(vs2[15:8])	* $unsigned(vs1[15:8]);
							vd_complete_bus[47:32] 	= $signed(vs2[23:16]) 	* $unsigned(vs1[23:16]);
							vd_complete_bus[63:48] 	= $signed(vs2[31:24]) 	* $unsigned(vs1[31:24]);
							vd_complete_bus[79:64] 	= $signed(vs2[39:32]) 	* $unsigned(vs1[39:32]);
							vd_complete_bus[95:80] 	= $signed(vs2[47:40]) 	* $unsigned(vs1[47:40]);
							vd_complete_bus[111:96] 	= $signed(vs2[55:48]) 	* $unsigned(vs1[55:48]);
							vd_complete_bus[127:112] = $signed(vs2[63:56]) 	* $unsigned(vs1[63:56]);
						end
					
					ENABLED_SIGNED_SIGNED_MODE :
						begin
							vd_complete_bus[15:0] 	= $signed(vs2[7:0]) 	* $signed(vs1[7:0]);
							vd_complete_bus[31:16] 	= $signed(vs2[15:8])	* $signed(vs1[15:8]);
							vd_complete_bus[47:32] 	= $signed(vs2[23:16]) 	* $signed(vs1[23:16]);
							vd_complete_bus[63:48] 	= $signed(vs2[31:24]) 	* $signed(vs1[31:24]);
							vd_complete_bus[79:64] 	= $signed(vs2[39:32]) 	* $signed(vs1[39:32]);
							vd_complete_bus[95:80] 	= $signed(vs2[47:40]) 	* $signed(vs1[47:40]);
							vd_complete_bus[111:96] 	= $signed(vs2[55:48]) 	* $signed(vs1[55:48]);
							vd_complete_bus[127:112] = $signed(vs2[63:56]) 	* $signed(vs1[63:56]);
						end
					
					default :
						begin
							vd_complete_bus[15:0] 	= '0;
							vd_complete_bus[31:16] 	= '0;
							vd_complete_bus[47:32] 	= '0;
							vd_complete_bus[63:48] 	= '0;
							vd_complete_bus[79:64] 	= '0;
							vd_complete_bus[95:80] 	= '0;
							vd_complete_bus[111:96] 	= '0;
							vd_complete_bus[127:112] = '0;
						end
				endcase
		endcase
	
	// Assign the high and low buses according to settings.
	always_comb
		if (execution_vector.widening_mode == ENABLED_WIDENING_MODE) 	// If widening is enabled, deliver the whole product.
			begin
				vd 	= vd_complete_bus[63:0];
				vd_high 	= vd_complete_bus[127:64];
			end
			
		else
			if (execution_vector.high_half_mode == ENABLED_HIGH_HALF_MODE) 	// If we want the higher half, deliver it through the lower target vector half.
				case (execution_vector.bit_mode)
					ENABLED_64BIT_MODE : 	// 64
						begin
							vd 	= vd_complete_bus[127:64];
							vd_high 	= '0;
						end
					
					ENABLED_32BIT_MODE : 	// 32
						begin
							vd 	= {vd_complete_bus[127:96], vd_complete_bus[63:32]};
							vd_high 	= '0;
						end
						
					ENABLED_16BIT_MODE : 	// 16
						begin
							vd 	= {vd_complete_bus[127:112], vd_complete_bus[95:80], 
														vd_complete_bus[63:48], vd_complete_bus[31:16]};
							vd_high 	= '0;
						end
						
					ENABLED_8BIT_MODE : 	// 8
						begin
							vd 	= {vd_complete_bus[127:120], vd_complete_bus[111:104], 
														vd_complete_bus[95:88], vd_complete_bus[79:72],
														vd_complete_bus[63:56], vd_complete_bus[47:40],
														vd_complete_bus[31:24], vd_complete_bus[15:8]};
							vd_high 	= '0;
						end
				endcase
			
			else
				case (execution_vector.bit_mode)
					ENABLED_64BIT_MODE : 	// 64
						begin
							vd 	= vd_complete_bus[63:0];
							vd_high 	= '0;
						end
					
					ENABLED_32BIT_MODE : 	// 32
						begin
							vd 	= {vd_complete_bus[95:64], vd_complete_bus[31:0]};
							vd_high 	= '0;
						end
						
					ENABLED_16BIT_MODE : 	// 16
						begin
							vd 	= {vd_complete_bus[111:96], vd_complete_bus[79:64], 
														vd_complete_bus[47:32], vd_complete_bus[15:0]};
							vd_high 	= '0;
						end
						
					ENABLED_8BIT_MODE : 	// 8
						begin
							vd 	= {vd_complete_bus[119:112], vd_complete_bus[103:96], 
														vd_complete_bus[87:80], vd_complete_bus[71:64],
														vd_complete_bus[55:48], vd_complete_bus[39:32],
														vd_complete_bus[23:16], vd_complete_bus[7:0]};
							vd_high 	= '0;
						end
				endcase
endmodule 