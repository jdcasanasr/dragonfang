module vector_comparison_unit

import dragonfang_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd

);

	typedef struct packed
	{
		logic equal;
		logic not_equal;
		logic less_than;
		logic less_than_or_equal;
		logic greater_than;
	
	} flags_t;
	
	logic [7:0]			input_carry;
	logic [7:0] 		output_carry;
	logic [63:0]		vs1_inverted_bus;
	logic [63:0] 		output_sum_bus;
	
	logic [6:0]			carry_selection;
	
	flags_t [7:0] 		flags_8;
	flags_t [3:0] 		flags_16;
	flags_t [1:0] 		flags_32;
	flags_t				flags_64;
	
	assign vs1_inverted_bus = ~vs1;
	assign vd[63:8] = '0;

	// Manage carry_selection[i].
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE :
				begin
					carry_selection[0] = 1'b0;	// Byte 1.
					carry_selection[1] = 1'b0;	// Byte 2.
					carry_selection[2] = 1'b0;	// Byte 3.
					carry_selection[3] = 1'b0;	// Byte 4.
					carry_selection[4] = 1'b0;	// Byte 5.
					carry_selection[5] = 1'b0;	// Byte 6.
					carry_selection[6] = 1'b0;	// Byte 7.
				end
			
			ENABLED_32BIT_MODE :
				begin
					carry_selection[0] = 1'b0;	// Byte 1.
					carry_selection[1] = 1'b0;	// Byte 2.
					carry_selection[2] = 1'b0;	// Byte 3.
					carry_selection[3] = 1'b1;	// Byte 4.
					carry_selection[4] = 1'b0;	// Byte 5.
					carry_selection[5] = 1'b0;	// Byte 6.
					carry_selection[6] = 1'b0;	// Byte 7.
				end
				
			ENABLED_16BIT_MODE :
				begin
					carry_selection[0] = 1'b0;	// Byte 1.
					carry_selection[1] = 1'b1;	// Byte 2.
					carry_selection[2] = 1'b0;	// Byte 3.
					carry_selection[3] = 1'b1;	// Byte 4.
					carry_selection[4] = 1'b0;	// Byte 5.
					carry_selection[5] = 1'b1;	// Byte 6.
					carry_selection[6] = 1'b0;	// Byte 7.
				end
				
			ENABLED_8BIT_MODE :
				begin
					carry_selection[0] = 1'b1;	// Byte 1.
					carry_selection[1] = 1'b1;	// Byte 2.
					carry_selection[2] = 1'b1;	// Byte 3.
					carry_selection[3] = 1'b1;	// Byte 4.
					carry_selection[4] = 1'b1;	// Byte 5.
					carry_selection[5] = 1'b1;	// Byte 6.
					carry_selection[6] = 1'b1;	// Byte 7.
				end
		endcase
	
	// Manage input_carry[0].
	assign input_carry[0] = 1'b1;
	
	// Manage input_carry[1].
	always_comb
		if (carry_selection[0])
			input_carry[1] = 1'b1;
			
		else
			input_carry[1] = output_carry[0];
	
	// Manage input_carry[2].
	always_comb
		if (carry_selection[1])
			input_carry[2] = 1'b1;
			
		else
			input_carry[2] = output_carry[1];
	
	// Manage input_carry[3].
	always_comb
		if (carry_selection[2])
			input_carry[3] = 1'b1;
			
		else
			input_carry[3] = output_carry[2];
			
	// Manage input_carry[4].
	always_comb
		if (carry_selection[3])
			input_carry[4] = 1'b1;
			
		else
			input_carry[4] = output_carry[3];
			
	// Manage input_carry[5].
	always_comb
		if (carry_selection[4])
			input_carry[5] = 1'b1;
			
		else
			input_carry[5] = output_carry[4];
			
	// Manage input_carry[6].
	always_comb
		if (carry_selection[5])
			input_carry[6] = 1'b1;
			
		else
			input_carry[6] = output_carry[5];
	
	// Manage input_carry[7].
	always_comb
		if (carry_selection[6])
			input_carry[7] = 1'b1;
			
		else
			input_carry[7] = output_carry[6];
	
	// Assign flags.
	always_comb
		case (execution_vector.sign_mode)
			ENABLED_UNSIGNED_UNSIGNED_MODE 	:	// Unsigned.
				begin
					flags_8[0].equal 				= (output_sum_bus[7:0] == '0 ? 1'b1 : 1'b0);
					flags_8[0].not_equal 			= ~flags_8[0].equal;
					flags_8[0].less_than 			= ~output_carry[0];
					flags_8[0].less_than_or_equal 	= flags_8[0].less_than | flags_8[0].equal;
					flags_8[0].greater_than 		= ~flags_8[0].less_than_or_equal;
					
					flags_8[1].equal 				= (output_sum_bus[15:8] == '0 ? 1'b1 : 1'b0);
					flags_8[1].not_equal 			= ~flags_8[1].equal;
					flags_8[1].less_than 			= ~output_carry[1];
					flags_8[1].less_than_or_equal 	= flags_8[1].less_than | flags_8[1].equal;
					flags_8[1].greater_than 		= ~flags_8[1].less_than_or_equal;
					
					flags_8[2].equal 				= (output_sum_bus[23:16] == '0 ? 1'b1 : 1'b0);
					flags_8[2].not_equal 			= ~flags_8[2].equal;
					flags_8[2].less_than 			= ~output_carry[2];
					flags_8[2].less_than_or_equal 	= flags_8[2].less_than | flags_8[2].equal;
					flags_8[2].greater_than 		= ~flags_8[2].less_than_or_equal;
					
					flags_8[3].equal 				= (output_sum_bus[31:24] == '0 ? 1'b1 : 1'b0);
					flags_8[3].not_equal 			= ~flags_8[3].equal;
					flags_8[3].less_than 			= ~output_carry[3];
					flags_8[3].less_than_or_equal 	= flags_8[3].less_than | flags_8[3].equal;
					flags_8[3].greater_than 		= ~flags_8[3].less_than_or_equal;
					
					flags_8[4].equal 				= (output_sum_bus[39:32] == '0 ? 1'b1 : 1'b0);
					flags_8[4].not_equal 			= ~flags_8[4].equal;
					flags_8[4].less_than 			= ~output_carry[4];
					flags_8[4].less_than_or_equal 	= flags_8[4].less_than | flags_8[4].equal;
					flags_8[4].greater_than 		= ~flags_8[4].less_than_or_equal;
					
					flags_8[5].equal 				= (output_sum_bus[47:40] == '0 ? 1'b1 : 1'b0);
					flags_8[5].not_equal 			= ~flags_8[5].equal;
					flags_8[5].less_than 			= ~output_carry[5];
					flags_8[5].less_than_or_equal 	= flags_8[5].less_than | flags_8[5].equal;
					flags_8[5].greater_than 		= ~flags_8[5].less_than_or_equal;
					
					flags_8[6].equal 				= (output_sum_bus[55:48] == '0 ? 1'b1 : 1'b0);
					flags_8[6].not_equal 			= ~flags_8[6].equal;
					flags_8[6].less_than 			= ~output_carry[6];
					flags_8[6].less_than_or_equal 	= flags_8[6].less_than | flags_8[6].equal;
					flags_8[6].greater_than 		= ~flags_8[6].less_than_or_equal;
					
					flags_8[7].equal 				= (output_sum_bus[63:56] == '0 ? 1'b1 : 1'b0);
					flags_8[7].not_equal 			= ~flags_8[7].equal;
					flags_8[7].less_than 			= ~output_carry[7];
					flags_8[7].less_than_or_equal 	= flags_8[7].less_than | flags_8[7].equal;
					flags_8[7].greater_than 		= ~flags_8[7].less_than_or_equal;
					
					flags_16[0].equal 				= flags_8[0].equal & flags_8[1].equal;
					flags_16[0].not_equal			= ~flags_16[0].equal;
					flags_16[0].less_than			= ~output_carry[1];
					flags_16[0].less_than_or_equal 	= flags_16[0].less_than | flags_16[0].equal;
					flags_16[0].greater_than 		= ~flags_16[0].less_than_or_equal;
					
					flags_16[1].equal 				= flags_8[2].equal & flags_8[3].equal;
					flags_16[1].not_equal			= ~flags_16[1].equal;
					flags_16[1].less_than			= ~output_carry[3];
					flags_16[1].less_than_or_equal 	= flags_16[1].less_than | flags_16[1].equal;
					flags_16[1].greater_than 		= ~flags_16[1].less_than_or_equal;
					
					flags_16[2].equal 				= flags_8[4].equal & flags_8[5].equal;
					flags_16[2].not_equal			= ~flags_16[2].equal;
					flags_16[2].less_than			= ~output_carry[5];
					flags_16[2].less_than_or_equal 	= flags_16[2].less_than | flags_16[2].equal;
					flags_16[2].greater_than 		= ~flags_16[2].less_than_or_equal;
					
					flags_16[3].equal 				= flags_8[6].equal & flags_8[7].equal;
					flags_16[3].not_equal			= ~flags_16[3].equal;
					flags_16[3].less_than			= ~output_carry[7];
					flags_16[3].less_than_or_equal 	= flags_16[3].less_than | flags_16[3].equal;
					flags_16[3].greater_than 		= ~flags_16[3].less_than_or_equal;
					
					flags_32[0].equal 				= flags_16[0].equal & flags_16[1].equal;
					flags_32[0].not_equal			= ~flags_32[0].equal;
					flags_32[0].less_than			= ~output_carry[3];
					flags_32[0].less_than_or_equal 	= flags_32[0].less_than | flags_32[0].equal;
					flags_32[0].greater_than 		= ~flags_32[0].less_than_or_equal;
					
					flags_32[1].equal 				= flags_16[2].equal & flags_16[3].equal;
					flags_32[1].not_equal			= ~flags_32[1].equal;
					flags_32[1].less_than			= ~output_carry[7];
					flags_32[1].less_than_or_equal 	= flags_32[1].less_than | flags_32[1].equal;
					flags_32[1].greater_than 		= ~flags_32[1].less_than_or_equal;
					
					flags_64.equal 					= flags_32[0].equal & flags_32[1].equal;
					flags_64.not_equal				= ~flags_64.equal;
					flags_64.less_than				= ~output_carry[7];
					flags_64.less_than_or_equal 	= flags_64.less_than | flags_64.equal;
					flags_64.greater_than 			= ~flags_64.less_than_or_equal;
				end
			
			ENABLED_SIGNED_SIGNED_MODE 	:	// Signed.
				begin
					flags_8[0].equal 				= (output_sum_bus[7:0] == '0 ? 1'b1 : 1'b0);
					flags_8[0].not_equal 			= ~flags_8[0].equal;
					flags_8[0].less_than 			= output_sum_bus[7] ^ (~(vs2[7] ^ vs1_inverted_bus[7]) & (output_sum_bus[7] ^ vs1_inverted_bus[7]));
					flags_8[0].less_than_or_equal 	= flags_8[0].less_than | flags_8[0].equal;
					flags_8[0].greater_than 		= ~flags_8[0].less_than_or_equal;
					
					flags_8[1].equal 				= (output_sum_bus[15:8] == '0 ? 1'b1 : 1'b0);
					flags_8[1].not_equal 			= ~flags_8[1].equal;
					flags_8[1].less_than 			= output_sum_bus[15] ^ (~(vs2[15] ^ vs1_inverted_bus[15]) & (output_sum_bus[15] ^ vs1_inverted_bus[15]));
					flags_8[1].less_than_or_equal 	= flags_8[1].less_than | flags_8[1].equal;
					flags_8[1].greater_than 		= ~flags_8[1].less_than_or_equal;
					
					flags_8[2].equal 				= (output_sum_bus[23:16] == '0 ? 1'b1 : 1'b0);
					flags_8[2].not_equal 			= ~flags_8[2].equal;
					flags_8[2].less_than 			= output_sum_bus[23] ^ (~(vs2[23] ^ vs1_inverted_bus[23]) & (output_sum_bus[23] ^ vs1_inverted_bus[23]));
					flags_8[2].less_than_or_equal 	= flags_8[2].less_than | flags_8[2].equal;
					flags_8[2].greater_than 		= ~flags_8[2].less_than_or_equal;
					
					flags_8[3].equal 				= (output_sum_bus[31:24] == '0 ? 1'b1 : 1'b0);
					flags_8[3].not_equal 			= ~flags_8[3].equal;
					flags_8[3].less_than 			= output_sum_bus[31] ^ (~(vs2[31] ^ vs1_inverted_bus[31]) & (output_sum_bus[31] ^ vs1_inverted_bus[31]));
					flags_8[3].less_than_or_equal 	= flags_8[3].less_than | flags_8[3].equal;
					flags_8[3].greater_than 		= ~flags_8[3].less_than_or_equal;
					
					flags_8[4].equal 				= (output_sum_bus[39:32] == '0 ? 1'b1 : 1'b0);
					flags_8[4].not_equal 			= ~flags_8[4].equal;
					flags_8[4].less_than 			= output_sum_bus[39] ^ (~(vs2[39] ^ vs1_inverted_bus[39]) & (output_sum_bus[39] ^ vs1_inverted_bus[39]));
					flags_8[4].less_than_or_equal 	= flags_8[4].less_than | flags_8[4].equal;
					flags_8[4].greater_than 		= ~flags_8[4].less_than_or_equal;
					
					flags_8[5].equal 				= (output_sum_bus[47:40] == '0 ? 1'b1 : 1'b0);
					flags_8[5].not_equal 			= ~flags_8[5].equal;
					flags_8[5].less_than 			= output_sum_bus[47] ^ (~(vs2[47] ^ vs1_inverted_bus[47]) & (output_sum_bus[47] ^ vs1_inverted_bus[47]));
					flags_8[5].less_than_or_equal 	= flags_8[5].less_than | flags_8[5].equal;
					flags_8[5].greater_than 		= ~flags_8[5].less_than_or_equal;
					
					flags_8[6].equal 				= (output_sum_bus[55:48] == '0 ? 1'b1 : 1'b0);
					flags_8[6].not_equal 			= ~flags_8[6].equal;
					flags_8[6].less_than 			= output_sum_bus[55] ^ (~(vs2[55] ^ vs1_inverted_bus[55]) & (output_sum_bus[55] ^ vs1_inverted_bus[55]));
					flags_8[6].less_than_or_equal 	= flags_8[6].less_than | flags_8[6].equal;
					flags_8[6].greater_than 		= ~flags_8[6].less_than_or_equal;
					
					flags_8[7].equal 				= (output_sum_bus[63:56] == '0 ? 1'b1 : 1'b0);
					flags_8[7].not_equal 			= ~flags_8[7].equal;
					flags_8[7].less_than 			= output_sum_bus[63] ^ (~(vs2[63] ^ vs1_inverted_bus[63]) & (output_sum_bus[63] ^ vs1_inverted_bus[63]));
					flags_8[7].less_than_or_equal 	= flags_8[7].less_than | flags_8[7].equal;
					flags_8[7].greater_than 		= ~flags_8[7].less_than_or_equal;
					
					flags_16[0].equal 				= flags_8[0].equal & flags_8[1].equal;
					flags_16[0].not_equal			= ~flags_16[0].equal;
					flags_16[0].less_than			= output_sum_bus[15] ^ (~(vs2[15] ^ vs1_inverted_bus[15]) & (output_sum_bus[15] ^ vs1_inverted_bus[15]));
					flags_16[0].less_than_or_equal 	= flags_16[0].less_than | flags_16[0].equal;
					flags_16[0].greater_than 		= ~flags_16[0].less_than_or_equal;
					
					flags_16[1].equal 				= flags_8[2].equal & flags_8[3].equal;
					flags_16[1].not_equal			= ~flags_16[1].equal;
					flags_16[1].less_than			= output_sum_bus[31] ^ (~(vs2[31] ^ vs1_inverted_bus[31]) & (output_sum_bus[31] ^ vs1_inverted_bus[31]));
					flags_16[1].less_than_or_equal 	= flags_16[1].less_than | flags_16[1].equal;
					flags_16[1].greater_than 		= ~flags_16[1].less_than_or_equal;
					
					flags_16[2].equal 				= flags_8[4].equal & flags_8[5].equal;
					flags_16[2].not_equal			= ~flags_16[2].equal;
					flags_16[2].less_than			= output_sum_bus[47] ^ (~(vs2[47] ^ vs1_inverted_bus[47]) & (output_sum_bus[47] ^ vs1_inverted_bus[47]));
					flags_16[2].less_than_or_equal 	= flags_16[2].less_than | flags_16[2].equal;
					flags_16[2].greater_than 		= ~flags_16[2].less_than_or_equal;
					
					flags_16[3].equal 				= flags_8[6].equal & flags_8[7].equal;
					flags_16[3].not_equal			= ~flags_16[3].equal;
					flags_16[3].less_than			= output_sum_bus[63] ^ (~(vs2[63] ^ vs1_inverted_bus[63]) & (output_sum_bus[63] ^ vs1_inverted_bus[63]));
					flags_16[3].less_than_or_equal 	= flags_16[3].less_than | flags_16[3].equal;
					flags_16[3].greater_than 		= ~flags_16[3].less_than_or_equal;
					
					flags_32[0].equal 				= flags_16[0].equal & flags_16[1].equal;
					flags_32[0].not_equal			= ~flags_32[0].equal;
					flags_32[0].less_than			= output_sum_bus[31] ^ (~(vs2[31] ^ vs1_inverted_bus[31]) & (output_sum_bus[31] ^ vs1_inverted_bus[31]));
					flags_32[0].less_than_or_equal 	= flags_32[0].less_than | flags_32[0].equal;
					flags_32[0].greater_than 		= ~flags_32[0].less_than_or_equal;
					
					flags_32[1].equal 				= flags_16[2].equal & flags_16[3].equal;
					flags_32[1].not_equal			= ~flags_32[1].equal;
					flags_32[1].less_than			= output_sum_bus[63] ^ (~(vs2[63] ^ vs1_inverted_bus[63]) & (output_sum_bus[63] ^ vs1_inverted_bus[63]));
					flags_32[1].less_than_or_equal 	= flags_32[1].less_than | flags_32[1].equal;
					flags_32[1].greater_than 		= ~flags_32[1].less_than_or_equal;
					
					flags_64.equal 					= flags_32[0].equal & flags_32[1].equal;
					flags_64.not_equal				= ~flags_64.equal;
					flags_64.less_than				= output_sum_bus[63] ^ (~(vs2[63] ^ vs1_inverted_bus[63]) & (output_sum_bus[63] ^ vs1_inverted_bus[63]));
					flags_64.less_than_or_equal 	= flags_64.less_than | flags_64.equal;
					flags_64.greater_than 			= ~flags_64.less_than_or_equal;
				end
			
			default :
				begin
					flags_8[0].equal 				= '0;
					flags_8[0].not_equal 			= '0;
					flags_8[0].less_than 			= '0;
					flags_8[0].less_than_or_equal 	= '0;
					flags_8[0].greater_than 		= '0;
					
					flags_8[1].equal 				= '0;
					flags_8[1].not_equal 			= '0;
					flags_8[1].less_than 			= '0;
					flags_8[1].less_than_or_equal 	= '0;
					flags_8[1].greater_than 		= '0;
					
					flags_8[2].equal 				= '0;
					flags_8[2].not_equal 			= '0;
					flags_8[2].less_than 			= '0;
					flags_8[2].less_than_or_equal 	= '0;
					flags_8[2].greater_than 		= '0;
					
					flags_8[3].equal 				= '0;
					flags_8[3].not_equal 			= '0;
					flags_8[3].less_than 			= '0;
					flags_8[3].less_than_or_equal 	= '0;
					flags_8[3].greater_than 		= '0;
					
					flags_8[4].equal 				= '0;
					flags_8[4].not_equal 			= '0;
					flags_8[4].less_than 			= '0;
					flags_8[4].less_than_or_equal 	= '0;
					flags_8[4].greater_than 		= '0;
					
					flags_8[5].equal 				= '0;
					flags_8[5].not_equal 			= '0;
					flags_8[5].less_than 			= '0;
					flags_8[5].less_than_or_equal 	= '0;
					flags_8[5].greater_than 		= '0;
					
					flags_8[6].equal 				= '0;
					flags_8[6].not_equal 			= '0;
					flags_8[6].less_than 			= '0;
					flags_8[6].less_than_or_equal 	= '0;
					flags_8[6].greater_than 		= '0;
					
					flags_8[7].equal 				= '0;
					flags_8[7].not_equal 			= '0;
					flags_8[7].less_than 			= '0;
					flags_8[7].less_than_or_equal 	= '0;
					flags_8[7].greater_than 		= '0;
					
					flags_16[0].equal 				= '0;
					flags_16[0].not_equal 			= '0;
					flags_16[0].less_than 			= '0;
					flags_16[0].less_than_or_equal 	= '0;
					flags_16[0].greater_than 		= '0;
					
					flags_16[1].equal 				= '0;
					flags_16[1].not_equal 			= '0;
					flags_16[1].less_than 			= '0;
					flags_16[1].less_than_or_equal 	= '0;
					flags_16[1].greater_than 		= '0;
					
					flags_16[2].equal 				= '0;
					flags_16[2].not_equal 			= '0;
					flags_16[2].less_than 			= '0;
					flags_16[2].less_than_or_equal 	= '0;
					flags_16[2].greater_than 		= '0;
					
					flags_16[3].equal 				= '0;
					flags_16[3].not_equal 			= '0;
					flags_16[3].less_than 			= '0;
					flags_16[3].less_than_or_equal 	= '0;
					flags_16[3].greater_than 		= '0;
					
					flags_32[0].equal 				= '0;
					flags_32[0].not_equal 			= '0;
					flags_32[0].less_than 			= '0;
					flags_32[0].less_than_or_equal 	= '0;
					flags_32[0].greater_than 		= '0;
					
					flags_32[1].equal 				= '0;
					flags_32[1].not_equal 			= '0;
					flags_32[1].less_than 			= '0;
					flags_32[1].less_than_or_equal 	= '0;
					flags_32[1].greater_than 		= '0;
					
					flags_64.equal 					= '0;
					flags_64.not_equal 				= '0;
					flags_64.less_than 				= '0;
					flags_64.less_than_or_equal 	= '0;
					flags_64.greater_than 			= '0;
				end
		endcase
	
	// Assign the bits in vd.
	// Manage vd[0].
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE : 	// 64
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[0] = flags_64.equal;				// equal
					ENABLED_NOT_EQUAL_MODE 				: vd[0] = flags_64.not_equal; 			// not_equal
					ENABLED_LESS_THAN_MODE 				: vd[0] = flags_64.less_than;			// less_than
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[0] = flags_64.less_than_or_equal; 	// less_than_or_equal
					ENABLED_GREATER_THAN_MODE 			: vd[0] = flags_64.greater_than; 		// greater_than
					
					default : vd[0] = '0;
				endcase
				
			ENABLED_32BIT_MODE : 	// 32
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[0] = flags_32[0].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[0] = flags_32[0].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[0] = flags_32[0].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[0] = flags_32[0].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[0] = flags_32[0].greater_than;
					
					default : vd[0] = '0;
				endcase
				
			ENABLED_16BIT_MODE : 	// 16
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[0] = flags_16[0].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[0] = flags_16[0].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[0] = flags_16[0].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[0] = flags_16[0].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[0] = flags_16[0].greater_than;
					
					default : vd[0] = '0;
				endcase
				
			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[0] = flags_8[0].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[0] = flags_8[0].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[0] = flags_8[0].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[0] = flags_8[0].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[0] = flags_8[0].greater_than;
					
					default : vd[0] = '0;
				endcase
		endcase
	
	// Manage vd[1].
	always_comb
		case (execution_vector.bit_mode)	
			ENABLED_32BIT_MODE : 	// 32
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[1] = flags_32[1].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[1] = flags_32[1].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[1] = flags_32[1].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[1] = flags_32[1].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[1] = flags_32[1].greater_than;
					
					default : vd[1] = '0;
				endcase
				
			ENABLED_16BIT_MODE : 	// 16
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[1] = flags_16[1].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[1] = flags_16[1].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[1] = flags_16[1].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[1] = flags_16[1].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[1] = flags_16[1].greater_than;
					
					default : vd[1] = '0;
				endcase
				
			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[1] = flags_8[1].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[1] = flags_8[1].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[1] = flags_8[1].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[1] = flags_8[1].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[1] = flags_8[1].greater_than;
					
					default : vd[1] = '0;
				endcase
				
			default : vd[1] = '0;
		endcase
	
	// Manage vd[2].
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_16BIT_MODE : 	// 16
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[2] = flags_16[2].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[2] = flags_16[2].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[2] = flags_16[2].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[2] = flags_16[2].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[2] = flags_16[2].greater_than;
					
					default : vd[2] = '0;
				endcase
				
			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[2] = flags_8[2].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[2] = flags_8[2].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[2] = flags_8[2].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[2] = flags_8[2].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[2] = flags_8[2].greater_than;
					
					default : vd[2] = '0;
				endcase
				
			default : vd[2] = '0;
		endcase
		
	// Manage vd[3].
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_16BIT_MODE : 	// 16
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[3] = flags_16[3].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[3] = flags_16[3].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[3] = flags_16[3].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[3] = flags_16[3].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[3] = flags_16[3].greater_than;
					
					default : vd[3] = '0;
				endcase
				
			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[3] = flags_8[3].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[3] = flags_8[3].not_equal;
					ENABLED_LESS_THAN_MODE				: vd[3] = flags_8[3].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[3] = flags_8[3].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE			: vd[3] = flags_8[3].greater_than;
					
					default : vd[3] = '0;
				endcase
				
			default : vd[3] = '0;
		endcase
	
	// Manage vd[4].
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[4] = flags_8[4].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[4] = flags_8[4].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[4] = flags_8[4].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[4] = flags_8[4].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[4] = flags_8[4].greater_than;
					
					default : vd[4] = '0;
				endcase
				
			default : vd[4] = '0;
		endcase
	
	// Manage vd[5].
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[5] = flags_8[5].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[5] = flags_8[5].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[5] = flags_8[5].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[5] = flags_8[5].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[5] = flags_8[5].greater_than;
					
					default : vd[5] = '0;
				endcase
				
			default : vd[5] = '0;
		endcase
	
	// Manage vd[6].
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[6] = flags_8[6].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[6] = flags_8[6].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[6] = flags_8[6].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[6] = flags_8[6].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[6] = flags_8[6].greater_than;
					
					default : vd[6] = '0;
				endcase
				
			default : vd[6] = '0;
		endcase
	
	// Manage vd[7].
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_8BIT_MODE : 	// 8
				case (execution_vector.comparison_mode)
					ENABLED_EQUAL_MODE 					: vd[7] = flags_8[7].equal;
					ENABLED_NOT_EQUAL_MODE 				: vd[7] = flags_8[7].not_equal;
					ENABLED_LESS_THAN_MODE 				: vd[7] = flags_8[7].less_than;
					ENABLED_LESS_THAN_OR_EQUAL_MODE 	: vd[7] = flags_8[7].less_than_or_equal;
					ENABLED_GREATER_THAN_MODE 			: vd[7] = flags_8[7].greater_than;
					
					default : vd[7] = '0;
				endcase
				
			default : vd[7] = '0;
		endcase
	
	// Manage add_8 instances.
	add_8 add_8_0
	(
		.source_element_0 	(vs2[7:0]),
		.source_element_1 	(vs1_inverted_bus[7:0]),
		.input_carry 		(input_carry[0]),
		
		.target_element 	(output_sum_bus[7:0]),
		.output_carry 		(output_carry[0])
	);
	
	add_8 add_8_1
	(
		.source_element_0 	(vs2[15:8]),
		.source_element_1 	(vs1_inverted_bus[15:8]),
		.input_carry 		(input_carry[1]),
		
		.target_element 	(output_sum_bus[15:8]),
		.output_carry 		(output_carry[1])
	);
	
	add_8 add_8_2
	(
		.source_element_0 	(vs2[23:16]),
		.source_element_1 	(vs1_inverted_bus[23:16]),
		.input_carry 		(input_carry[2]),
		
		.target_element 	(output_sum_bus[23:16]),
		.output_carry 		(output_carry[2])
	);
	
	add_8 add_8_3
	(
		.source_element_0 	(vs2[31:24]),
		.source_element_1 	(vs1_inverted_bus[31:24]),
		.input_carry 		(input_carry[3]),
		
		.target_element 	(output_sum_bus[31:24]),
		.output_carry 		(output_carry[3])
	);
	
	add_8 add_8_4
	(
		.source_element_0 	(vs2[39:32]),
		.source_element_1 	(vs1_inverted_bus[39:32]),
		.input_carry 		(input_carry[4]),
		
		.target_element 	(output_sum_bus[39:32]),
		.output_carry 		(output_carry[4])
	);
	
	add_8 add_8_5
	(
		.source_element_0 	(vs2[47:40]),
		.source_element_1 	(vs1_inverted_bus[47:40]),
		.input_carry 		(input_carry[5]),
		
		.target_element 	(output_sum_bus[47:40]),
		.output_carry 		(output_carry[5])
	);
	
	add_8 add_8_6
	(
		.source_element_0 	(vs2[55:48]),
		.source_element_1 	(vs1_inverted_bus[55:48]),
		.input_carry 		(input_carry[6]),
		
		.target_element 	(output_sum_bus[55:48]),
		.output_carry 		(output_carry[6])
	);
	
	add_8 add_8_7
	(
		.source_element_0 	(vs2[63:56]),
		.source_element_1 	(vs1_inverted_bus[63:56]),
		.input_carry 		(input_carry[7]),
		
		.target_element 	(output_sum_bus[63:56]),
		.output_carry 		(output_carry[7])
	);
			
endmodule 