module vector_extension_unit

import dragonfang_pkg::*;

(
	input 	execution_vector_t 	execution_vector,

	input 	logic [63:0] 		vs2,
	
	output 	logic [63:0] 		vd,
	output 	logic [63:0] 		vd_high,
	output 	logic [383:0] 		vd_extra
);

	logic [511:0] 		vd_all_bus;

	assign vd 		= vd_all_bus[63:0];
	assign vd_high 	= vd_all_bus[127:64];
	assign vd_extra = vd_all_bus[511:128];
	
	always_comb
		case (execution_vector.fraction_mode)
			ENABLED_HALF_MODE 		:
				case (execution_vector.bit_mode)
					ENABLED_32BIT_MODE 	:
						case (execution_vector.extension_mode)
							ENABLED_SIGN_EXTENSION_MODE :
								begin
									vd_all_bus[63:0] 	= {{32{vs2[31]}}, vs2[31:0]};
									vd_all_bus[127:64] 	= {{32{vs2[63]}}, vs2[63:32]};
									vd_all_bus[511:128] = '0;
								end
							
							ENABLED_ZERO_EXTENSION_MODE :
								begin
									vd_all_bus[63:0] 	= {{32{1'b0}}, vs2[31:0]};
									vd_all_bus[127:64] 	= {{32{1'b0}}, vs2[63:32]};
									vd_all_bus[511:128] = '0;
								end
							
							default 					: vd_all_bus = '0;
						endcase
					
					ENABLED_16BIT_MODE 	:
						case (execution_vector.extension_mode)
							ENABLED_SIGN_EXTENSION_MODE :
								begin
									vd_all_bus[31:0] 	= {{16{vs2[15]}}, vs2[15:0]};
									vd_all_bus[63:32] 	= {{16{vs2[31]}}, vs2[31:16]};
									vd_all_bus[95:64] 	= {{16{vs2[47]}}, vs2[47:32]};
									vd_all_bus[127:96] 	= {{16{vs2[63]}}, vs2[63:48]};
									vd_all_bus[511:128] = '0;
								end
							
							ENABLED_ZERO_EXTENSION_MODE :
								begin
									vd_all_bus[31:0] 	= {{16{1'b0}}, vs2[15:0]};
									vd_all_bus[63:32] 	= {{16{1'b0}}, vs2[31:16]};
									vd_all_bus[95:64] 	= {{16{1'b0}}, vs2[47:32]};
									vd_all_bus[127:96] 	= {{16{1'b0}}, vs2[63:48]};
									vd_all_bus[511:128] = '0;
								end
							
							default 					: vd_all_bus = '0;
						endcase
					
					ENABLED_8BIT_MODE 	:
						case (execution_vector.extension_mode)
							ENABLED_SIGN_EXTENSION_MODE :
								begin
									vd_all_bus[15:0] 	= {{8{vs2[7]}}, vs2[7:0]};
									vd_all_bus[31:16] 	= {{8{vs2[15]}}, vs2[15:8]};
									vd_all_bus[47:32] 	= {{8{vs2[23]}}, vs2[23:16]};
									vd_all_bus[63:48] 	= {{8{vs2[31]}}, vs2[31:24]};
									vd_all_bus[79:64] 	= {{8{vs2[39]}}, vs2[39:32]};
									vd_all_bus[95:80] 	= {{8{vs2[47]}}, vs2[47:40]};
									vd_all_bus[111:96] 	= {{8{vs2[55]}}, vs2[55:48]};
									vd_all_bus[127:112] = {{8{vs2[63]}}, vs2[63:56]};
									vd_all_bus[511:128] = '0;
								end
							
							ENABLED_ZERO_EXTENSION_MODE :
								begin
									vd_all_bus[15:0] 	= {{8{1'b0}}, vs2[7:0]};
									vd_all_bus[31:16] 	= {{8{1'b0}}, vs2[15:8]};
									vd_all_bus[47:32] 	= {{8{1'b0}}, vs2[23:16]};
									vd_all_bus[63:48] 	= {{8{1'b0}}, vs2[31:24]};
									vd_all_bus[79:64] 	= {{8{1'b0}}, vs2[39:32]};
									vd_all_bus[95:80] 	= {{8{1'b0}}, vs2[47:40]};
									vd_all_bus[111:96] 	= {{8{1'b0}}, vs2[55:48]};
									vd_all_bus[127:112] = {{8{1'b0}}, vs2[63:56]};
									vd_all_bus[511:128] = '0;
								end
							
							default 					: vd_all_bus = '0;
						endcase
					
					default 			: vd_all_bus = '0;
				endcase
			
			ENABLED_QUARTER_MODE 	:
				case (execution_vector.bit_mode)
					ENABLED_16BIT_MODE 	:
						case (execution_vector.extension_mode)
							ENABLED_SIGN_EXTENSION_MODE :
								begin
									vd_all_bus[63:0] 	= {{48{vs2[15]}}, vs2[15:0]};
									vd_all_bus[127:64] 	= {{48{vs2[31]}}, vs2[31:16]};
									vd_all_bus[191:128] = {{48{vs2[47]}}, vs2[47:32]};
									vd_all_bus[255:192] = {{48{vs2[63]}}, vs2[63:48]};
									vd_all_bus[511:256] = '0;
								end
							
							ENABLED_ZERO_EXTENSION_MODE :
								begin
									vd_all_bus[63:0] 	= {{48{1'b0}}, vs2[15:0]};
									vd_all_bus[127:64] 	= {{48{1'b0}}, vs2[31:16]};
									vd_all_bus[191:128] = {{48{1'b0}}, vs2[47:32]};
									vd_all_bus[255:192] = {{48{1'b0}}, vs2[63:48]};
									vd_all_bus[511:256] = '0;
								end
							
							default 					: vd_all_bus = '0;
						endcase
					
					ENABLED_8BIT_MODE 	:
						case (execution_vector.extension_mode)
							ENABLED_SIGN_EXTENSION_MODE :
								begin
									vd_all_bus[31:0] 	= {{24{vs2[7]}}, vs2[7:0]};
									vd_all_bus[63:32] 	= {{24{vs2[15]}}, vs2[15:8]};
									vd_all_bus[95:63] 	= {{24{vs2[23]}}, vs2[23:16]};
									vd_all_bus[127:96] 	= {{24{vs2[31]}}, vs2[31:24]};
									vd_all_bus[159:128] = {{24{vs2[39]}}, vs2[39:32]};
									vd_all_bus[191:160] = {{24{vs2[47]}}, vs2[47:40]};
									vd_all_bus[223:192] = {{24{vs2[55]}}, vs2[55:48]};
									vd_all_bus[255:224] = {{24{vs2[63]}}, vs2[63:56]};
									vd_all_bus[511:256] = '0;
								end
							
							ENABLED_ZERO_EXTENSION_MODE :
								begin
									vd_all_bus[31:0] 	= {{24{1'b0}}, vs2[7:0]};
									vd_all_bus[63:32] 	= {{24{1'b0}}, vs2[15:8]};
									vd_all_bus[95:63] 	= {{24{1'b0}}, vs2[23:16]};
									vd_all_bus[127:96] 	= {{24{1'b0}}, vs2[31:24]};
									vd_all_bus[159:128] = {{24{1'b0}}, vs2[39:32]};
									vd_all_bus[191:160] = {{24{1'b0}}, vs2[47:40]};
									vd_all_bus[223:192] = {{24{1'b0}}, vs2[55:48]};
									vd_all_bus[255:224] = {{24{1'b0}}, vs2[63:56]};
									vd_all_bus[511:256] = '0;
								end
							
							default 					: vd_all_bus = '0;
						endcase
					
					default 			: vd_all_bus = '0;
				endcase
			
			ENABLED_EIGHTH_MODE 	:
				case (execution_vector.bit_mode)
					ENABLED_8BIT_MODE 	:
						case (execution_vector.extension_mode)
							ENABLED_SIGN_EXTENSION_MODE :
								begin
									vd_all_bus[63:0] 	= {{56{vs2[7]}}, vs2[7:0]};
									vd_all_bus[127:64] 	= {{56{vs2[15]}}, vs2[15:8]};
									vd_all_bus[191:128] = {{56{vs2[23]}}, vs2[23:16]};
									vd_all_bus[255:192] = {{56{vs2[31]}}, vs2[31:24]};
									vd_all_bus[319:256] = {{56{vs2[39]}}, vs2[39:32]};
									vd_all_bus[383:320] = {{56{vs2[47]}}, vs2[47:40]};
									vd_all_bus[447:384] = {{56{vs2[55]}}, vs2[55:48]};
									vd_all_bus[511:448] = {{56{vs2[63]}}, vs2[63:56]};
								end
							
							ENABLED_ZERO_EXTENSION_MODE :
								begin
									vd_all_bus[63:0] 	= {{56{1'b0}}, vs2[7:0]};
									vd_all_bus[127:64] 	= {{56{1'b0}}, vs2[15:8]};
									vd_all_bus[191:128] = {{56{1'b0}}, vs2[23:16]};
									vd_all_bus[255:192] = {{56{1'b0}}, vs2[31:24]};
									vd_all_bus[319:256] = {{56{1'b0}}, vs2[39:32]};
									vd_all_bus[383:320] = {{56{1'b0}}, vs2[47:40]};
									vd_all_bus[447:384] = {{56{1'b0}}, vs2[55:48]};
									vd_all_bus[511:448] = {{56{1'b0}}, vs2[63:56]};
								end
							
							default 					: vd_all_bus = '0;
						endcase
					
					default 			: vd_all_bus = '0;
				endcase
			
			default					: vd_all_bus = '0;
		endcase
			
endmodule 