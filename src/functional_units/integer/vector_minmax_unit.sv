module vector_minmax_unit

import dragonfang_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd
);

	logic [7:0]			input_carry;
	logic [7:0] 		output_carry;
	logic [63:0]		vs1_inverted_bus;
	logic [63:0] 		output_sum_bus;
	
	logic [7:0]			less_than_8;
	logic [3:0]			less_than_16;
	logic [1:0]			less_than_32;
	logic 				less_than_64;
	
	logic [6:0]			carry_selection;
	logic [7:0]			byte_selection;
	
	assign vs1_inverted_bus = ~vs1;
	
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
	
	// Assign "less than" signals.
	always_comb
		case (execution_vector.sign_mode)
			ENABLED_SIGNED_SIGNED_MODE :
				begin
					less_than_8[0] 	= output_sum_bus[7] 	^ (~(vs2[7] 	^ vs1_inverted_bus[7]) & (output_sum_bus[7] 	^ vs1_inverted_bus[7]));
					less_than_8[1] 	= output_sum_bus[15] 	^ (~(vs2[15] 	^ vs1_inverted_bus[15]) & (output_sum_bus[15] 	^ vs1_inverted_bus[15]));
					less_than_8[2] 	= output_sum_bus[23] 	^ (~(vs2[23] 	^ vs1_inverted_bus[23]) & (output_sum_bus[23] 	^ vs1_inverted_bus[23]));
					less_than_8[3] 	= output_sum_bus[31] 	^ (~(vs2[31] 	^ vs1_inverted_bus[31]) & (output_sum_bus[31] 	^ vs1_inverted_bus[31]));
					less_than_8[4] 	= output_sum_bus[39] 	^ (~(vs2[39] 	^ vs1_inverted_bus[39]) & (output_sum_bus[39]	^ vs1_inverted_bus[39]));
					less_than_8[5] 	= output_sum_bus[47] 	^ (~(vs2[47] 	^ vs1_inverted_bus[47]) & (output_sum_bus[47] 	^ vs1_inverted_bus[47]));
					less_than_8[6] 	= output_sum_bus[55] 	^ (~(vs2[55] 	^ vs1_inverted_bus[55]) & (output_sum_bus[55] 	^ vs1_inverted_bus[55]));
					less_than_8[7] 	= output_sum_bus[63] 	^ (~(vs2[63] 	^ vs1_inverted_bus[63]) & (output_sum_bus[63] 	^ vs1_inverted_bus[63]));
					
					less_than_16[0] = output_sum_bus[15] 	^ (~(vs2[15] 	^ vs1_inverted_bus[15]) & (output_sum_bus[15] 	^ vs1_inverted_bus[15]));
					less_than_16[1] = output_sum_bus[31] 	^ (~(vs2[31] 	^ vs1_inverted_bus[31]) & (output_sum_bus[31] 	^ vs1_inverted_bus[31]));
					less_than_16[2] = output_sum_bus[47] 	^ (~(vs2[47] 	^ vs1_inverted_bus[47]) & (output_sum_bus[47] 	^ vs1_inverted_bus[47]));
					less_than_16[3] = output_sum_bus[63] 	^ (~(vs2[63] 	^ vs1_inverted_bus[63]) & (output_sum_bus[63] 	^ vs1_inverted_bus[63]));
					
					less_than_32[0] = output_sum_bus[31] 	^ (~(vs2[31] 	^ vs1_inverted_bus[31]) & (output_sum_bus[31] 	^ vs1_inverted_bus[31]));
					less_than_32[1] = output_sum_bus[63] 	^ (~(vs2[63] 	^ vs1_inverted_bus[63]) & (output_sum_bus[63] 	^ vs1_inverted_bus[63]));
					
					less_than_64	= output_sum_bus[63] 	^ (~(vs2[63] 	^ vs1_inverted_bus[63]) & (output_sum_bus[63] 	^ vs1_inverted_bus[63]));
				end
			
			ENABLED_UNSIGNED_UNSIGNED_MODE :
				begin
					less_than_8[0] 	= ~output_carry[0];
					less_than_8[1] 	= ~output_carry[1];
					less_than_8[2] 	= ~output_carry[2];
					less_than_8[3] 	= ~output_carry[3];
					less_than_8[4] 	= ~output_carry[4];
					less_than_8[5] 	= ~output_carry[5];
					less_than_8[6] 	= ~output_carry[6];
					less_than_8[7] 	= ~output_carry[7];
					
					less_than_16[0] = ~output_carry[1];
					less_than_16[1] = ~output_carry[3];
					less_than_16[2] = ~output_carry[5];
					less_than_16[3] = ~output_carry[7];
					
					less_than_32[0] = ~output_carry[3];
					less_than_32[1] = ~output_carry[7];
					
					less_than_64	= ~output_carry[7];
				end
				
			default :
				begin
					less_than_64 	= '0;
					less_than_32	= '0;
					less_than_16	= '0;
					less_than_8 	= '0;
				end
				
		endcase
			
	// Assign "byte_selection" signals, according to the
	// SEW settings adn if we want the minimum or maximum
	// element.
	always_comb
		if (execution_vector.maximum_mode == ENABLED_MAXIMUM_MODE) 	// Choose maximum, i. e., invert the signal.
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE :
					begin
						byte_selection[0] = ~less_than_64;
						byte_selection[1] = ~less_than_64;
						byte_selection[2] = ~less_than_64;
						byte_selection[3] = ~less_than_64;
						byte_selection[4] = ~less_than_64;
						byte_selection[5] = ~less_than_64;
						byte_selection[6] = ~less_than_64;
						byte_selection[7] = ~less_than_64;
					end
				
				ENABLED_32BIT_MODE :
					begin
						byte_selection[0] = ~less_than_32[0];
						byte_selection[1] = ~less_than_32[0];
						byte_selection[2] = ~less_than_32[0];
						byte_selection[3] = ~less_than_32[0];
						byte_selection[4] = ~less_than_32[1];
						byte_selection[5] = ~less_than_32[1];
						byte_selection[6] = ~less_than_32[1];
						byte_selection[7] = ~less_than_32[1];
					end
				
				ENABLED_16BIT_MODE :
					begin
						byte_selection[0] = ~less_than_16[0];
						byte_selection[1] = ~less_than_16[0];
						byte_selection[2] = ~less_than_16[1];
						byte_selection[3] = ~less_than_16[1];
						byte_selection[4] = ~less_than_16[2];
						byte_selection[5] = ~less_than_16[2];
						byte_selection[6] = ~less_than_16[3];
						byte_selection[7] = ~less_than_16[3];
					end
					
				ENABLED_8BIT_MODE :
					begin
						byte_selection[0] = ~less_than_8[0];
						byte_selection[1] = ~less_than_8[1];
						byte_selection[2] = ~less_than_8[2];
						byte_selection[3] = ~less_than_8[3];
						byte_selection[4] = ~less_than_8[4];
						byte_selection[5] = ~less_than_8[5];
						byte_selection[6] = ~less_than_8[6];
						byte_selection[7] = ~less_than_8[7];
					end
			endcase	
					
		else if (execution_vector.minimum_mode == ENABLED_MINIMUM_MODE)				// Choose minimum.
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE :
					begin
						byte_selection[0] = less_than_64;
						byte_selection[1] = less_than_64;
						byte_selection[2] = less_than_64;
						byte_selection[3] = less_than_64;
						byte_selection[4] = less_than_64;
						byte_selection[5] = less_than_64;
						byte_selection[6] = less_than_64;
						byte_selection[7] = less_than_64;
					end
				
				ENABLED_32BIT_MODE :
					begin
						byte_selection[0] = less_than_32[0];
						byte_selection[1] = less_than_32[0];
						byte_selection[2] = less_than_32[0];
						byte_selection[3] = less_than_32[0];
						byte_selection[4] = less_than_32[1];
						byte_selection[5] = less_than_32[1];
						byte_selection[6] = less_than_32[1];
						byte_selection[7] = less_than_32[1];
					end
				
				ENABLED_16BIT_MODE :
					begin
						byte_selection[0] = less_than_16[0];
						byte_selection[1] = less_than_16[0];
						byte_selection[2] = less_than_16[1];
						byte_selection[3] = less_than_16[1];
						byte_selection[4] = less_than_16[2];
						byte_selection[5] = less_than_16[2];
						byte_selection[6] = less_than_16[3];
						byte_selection[7] = less_than_16[3];
					end
					
				ENABLED_8BIT_MODE :
					begin
						byte_selection[0] = less_than_8[0];
						byte_selection[1] = less_than_8[1];
						byte_selection[2] = less_than_8[2];
						byte_selection[3] = less_than_8[3];
						byte_selection[4] = less_than_8[4];
						byte_selection[5] = less_than_8[5];
						byte_selection[6] = less_than_8[6];
						byte_selection[7] = less_than_8[7];
					end
			endcase
			
		else
			byte_selection = '0;
		
	// Select the proper bytes for output.
	// Manage byte 0
	always_comb
		if (byte_selection[0])
			vd[7:0] = vs2[7:0];
		else
			vd[7:0] = vs1[7:0];
			
	// Manage byte 1
	always_comb
		if (byte_selection[1])
			vd[15:8] = vs2[15:8];
		else
			vd[15:8] = vs1[15:8];
			
	// Manage byte 2
	always_comb
		if (byte_selection[2])
			vd[23:16] = vs2[23:16];
		else
			vd[23:16] = vs1[23:16];
			
	// Manage byte 3
	always_comb
		if (byte_selection[3])
			vd[31:24] = vs2[31:24];
		else
			vd[31:24] = vs1[31:24];
			
	// Manage byte 4
	always_comb
		if (byte_selection[4])
			vd[39:32] = vs2[39:32];
		else
			vd[39:32] = vs1[39:32];
			
	// Manage byte 5
	always_comb
		if (byte_selection[5])
			vd[47:40] = vs2[47:40];
		else
			vd[47:40] = vs1[47:40];
			
			
	// Manage byte 6
	always_comb
		if (byte_selection[6])
			vd[55:48] = vs2[55:48];
		else
			vd[55:48] = vs1[55:48];
	
	// Manage byte 7
	always_comb
		if (byte_selection[7])
			vd[63:56] = vs2[63:56];
		else
			vd[63:56] = vs1[63:56];	
		
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