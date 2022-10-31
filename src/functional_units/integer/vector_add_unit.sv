module vector_add_unit

import dragonfang_pkg::*;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	input 	logic [63:0] 		v0,
	
	output 	logic [63:0] 		vd,
	output 	logic [63:0]		vd_high
);
	
	// Interconnection wires and buses.
	logic [63:0] 	vs2_effective;
	logic [63:0] 	vs1_effective;
	
	logic [63:0] 	vd_high_bus;
	logic [63:0]	output_sum_bus;
	logic [63:0]	output_mask_bus;
	
	logic [7:0]		input_carry;
	logic [7:0]		output_carry;
	
	logic [7:0]		v0_slice;
	logic [7:0]		v0_slice_effective;
	
	integer i;
	
	assign v0_slice = v0[7:0];
	assign vd_high = vd_high_bus;
	
	// Manage output_mask_bus, according to the borrow_mode setting.
	// In borrow mode, the output mask bits must be inverted!.
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				if (execution_vector.borrow_mode == ENABLED_BORROW_MODE)
					output_mask_bus = {{63{1'b0}}, ~output_carry[7]};
					
				else
					output_mask_bus = {{63{1'b0}}, output_carry[7]};
			
			ENABLED_32BIT_MODE 	:
				if (execution_vector.borrow_mode == ENABLED_BORROW_MODE)
					output_mask_bus = {{62{1'b0}}, ~output_carry[7], ~output_carry[3]};
					
				else
					output_mask_bus = {{62{1'b0}}, output_carry[7], output_carry[3]};
			
			ENABLED_16BIT_MODE 	:
				if (execution_vector.borrow_mode == ENABLED_BORROW_MODE)
					output_mask_bus = {{60{1'b0}}, ~output_carry[7], ~output_carry[5], ~output_carry[3], ~output_carry[1]};
					
				else
					output_mask_bus = {{60{1'b0}}, output_carry[7], output_carry[5], output_carry[3], output_carry[1]};
			
			ENABLED_8BIT_MODE	:
				if (execution_vector.borrow_mode == ENABLED_BORROW_MODE)
					output_mask_bus = {{56{1'b0}}, ~output_carry};
					
				else
					output_mask_bus = {{56{1'b0}}, output_carry};
		endcase

	// Select between untouched or negated inputs (for v*sub* and vrsub)
	always_comb
		if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE)
			begin
				vs2_effective 		= vs2;
				vs1_effective 		= ~vs1;
				v0_slice_effective 	= ~v0_slice;
			end
			
		else if (execution_vector.reverse_subtraction_mode == ENABLED_REVERSE_SUBTRACTION_MODE)
			begin
				vs2_effective 		= ~vs2;
				vs1_effective 		= vs1;
				v0_slice_effective 	= ~v0_slice;
			end
		
		else
			begin
				vs2_effective 		= vs2;
				vs1_effective 		= vs1;
				v0_slice_effective 	= v0_slice;
			end
			
	// Select input carries for every add_8 module.
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				begin
					// Interconnect the carry inputs and outputs not involved in the carry assignation,
					// according to the current bit_mode seeting.
					for (i = 1; i <= 7; i++)
						input_carry[i] = output_carry[i - 1];
				
					// Decide what carry to let through in either subtraction or carry mode,
					// according to the bit_mode setting and the element position in the vector.
					if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE || execution_vector.reverse_subtraction_mode == ENABLED_REVERSE_SUBTRACTION_MODE)
						input_carry[0] = 1'b1;
					
					else if (execution_vector.carry_mode == ENABLED_CARRY_MODE)
						input_carry[0] = v0_slice_effective[0];
						
					else
						input_carry[0] = 1'b0;
				end
				
			ENABLED_32BIT_MODE 	:
				begin
					for (i = 1; i <= 3; i++)
						input_carry[i] = output_carry[i - 1];
						
					for (i = 5; i <= 7; i++)
						input_carry[i] = output_carry[i - 1];
				
					if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE || execution_vector.reverse_subtraction_mode == ENABLED_REVERSE_SUBTRACTION_MODE)
						begin
							input_carry[0] 	= 1'b1;
							input_carry[4] 	= 1'b1;
						end
					
					else if (execution_vector.carry_mode == ENABLED_CARRY_MODE)
						begin
							input_carry[0] = v0_slice_effective[0];
							input_carry[4] = v0_slice_effective[1];
						end
						
					else
						begin
							input_carry[0] = 1'b0;
							input_carry[4] = 1'b0;
						end
				end
			
			ENABLED_16BIT_MODE 	:
				begin
					for (i = 1; i <= 7; i += 2)
						input_carry[i] = output_carry[i - 1];
				
					if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE || execution_vector.reverse_subtraction_mode == ENABLED_REVERSE_SUBTRACTION_MODE)
						begin
							input_carry[0] 	= 1'b1;
							input_carry[2] 	= 1'b1;
							input_carry[4] 	= 1'b1;
							input_carry[6] 	= 1'b1;
						end
					
					else if (execution_vector.carry_mode == ENABLED_CARRY_MODE)
						begin
							input_carry[0] = v0_slice_effective[0];
							input_carry[2] = v0_slice_effective[1];
							input_carry[4] = v0_slice_effective[2];
							input_carry[6] = v0_slice_effective[3];
						end
						
					else
						begin
							input_carry[0] 	= 1'b0;
							input_carry[2] 	= 1'b0;
							input_carry[4] 	= 1'b0;
							input_carry[6] 	= 1'b0;
						end
				end
			
			ENABLED_8BIT_MODE 	:
				begin
					if (execution_vector.subtraction_mode == ENABLED_SUBTRACTION_MODE || execution_vector.reverse_subtraction_mode == ENABLED_REVERSE_SUBTRACTION_MODE)
						for (i = 0; i <= 7; i++)
							input_carry[i] = 1'b1;
					
					else if (execution_vector.carry_mode == ENABLED_CARRY_MODE)
						for (i = 0; i <= 7; i++)
							input_carry[i] = v0_slice_effective[i];

					else
						for (i = 0; i <= 7; i++)
							input_carry[i] = 1'b0;
				end
		endcase
	
	// Choose either the output mask or the sum (normal or widened), according to settings.		
	always_comb
		if (execution_vector.mask_mode == ENABLED_MASK_MODE)
			begin
				vd 	= output_mask_bus;
				vd_high_bus = '0;
			end
			
		else if (execution_vector.widening_mode == ENABLED_WIDENING_MODE)
			case (execution_vector.bit_mode)
				ENABLED_64BIT_MODE 	:
					if (execution_vector.sign_mode == ENABLED_SIGNED_SIGNED_MODE)
						begin
							vd 	= output_sum_bus;
							vd_high_bus = {64{output_sum_bus[63]}};
						end
						
					else
						begin
							vd 	= output_sum_bus;
							vd_high_bus = {64{1'b0}};
						end
					
				ENABLED_32BIT_MODE 	:
					if (execution_vector.sign_mode == ENABLED_SIGNED_SIGNED_MODE)
						begin
							vd 	= {{32{output_sum_bus[31]}}, output_sum_bus[31:0]};
							vd_high_bus = {{32{output_sum_bus[63]}}, output_sum_bus[63:32]};
						end
						
					else
						begin
							vd 	= {{32{1'b0}}, output_sum_bus[31:0]};
							vd_high_bus = {{32{1'b0}}, output_sum_bus[63:32]};
						end
				
				ENABLED_16BIT_MODE 	:
					if (execution_vector.sign_mode == ENABLED_SIGNED_SIGNED_MODE)
						begin
							vd[31:0] 	= {{16{output_sum_bus[15]}}, output_sum_bus[15:0]};
							vd[63:32]	= {{16{output_sum_bus[31]}}, output_sum_bus[31:16]};
							
							vd_high_bus[31:0] 	= {{16{output_sum_bus[47]}}, output_sum_bus[47:32]};
							vd_high_bus[63:32]	= {{16{output_sum_bus[63]}}, output_sum_bus[63:48]};
						end
						
					else
						begin
							vd[31:0] 	= {{16{1'b0}}, output_sum_bus[15:0]};
							vd[63:32]	= {{16{1'b0}}, output_sum_bus[31:16]};
							
							vd_high_bus[31:0] 	= {{16{1'b0}}, output_sum_bus[47:32]};
							vd_high_bus[63:32]	= {{16{1'b0}}, output_sum_bus[63:48]};
						end
				
				ENABLED_8BIT_MODE 	:
					if (execution_vector.sign_mode == ENABLED_SIGNED_SIGNED_MODE)
						begin
							vd[15:0] 	= {{8{output_sum_bus[7]}}, output_sum_bus[7:0]};
							vd[31:16]	= {{8{output_sum_bus[15]}}, output_sum_bus[15:8]};
							vd[47:32] 	= {{8{output_sum_bus[23]}}, output_sum_bus[23:16]};
							vd[63:48]	= {{8{output_sum_bus[31]}}, output_sum_bus[31:24]};
							
							
							
							vd_high_bus[15:0] 	= {{8{output_sum_bus[39]}}, output_sum_bus[39:32]};
							vd_high_bus[31:16]	= {{8{output_sum_bus[47]}}, output_sum_bus[47:40]};
							vd_high_bus[47:32] 	= {{8{output_sum_bus[55]}}, output_sum_bus[55:48]};
							vd_high_bus[63:48]	= {{8{output_sum_bus[63]}}, output_sum_bus[63:56]};
						end
						
					else
						begin
							vd[15:0] 	= {{8{1'b0}}, output_sum_bus[7:0]};
							vd[31:16]	= {{8{1'b0}}, output_sum_bus[15:8]};
							vd[47:32] 	= {{8{1'b0}}, output_sum_bus[23:16]};
							vd[63:48]	= {{8{1'b0}}, output_sum_bus[31:24]};
							
							
							
							vd_high_bus[15:0] 	= {{8{1'b0}}, output_sum_bus[39:32]};
							vd_high_bus[31:16]	= {{8{1'b0}}, output_sum_bus[47:40]};
							vd_high_bus[47:32] 	= {{8{1'b0}}, output_sum_bus[55:48]};
							vd_high_bus[63:48]	= {{8{1'b0}}, output_sum_bus[63:56]};
						end
			endcase
		
		else
			begin
				vd 	= output_sum_bus;
				vd_high_bus = '0;
			end
	
	add_8 add_8_0
	(
		.source_element_0 	(vs2_effective[7:0]),
		.source_element_1 	(vs1_effective[7:0]),
		.input_carry 		(input_carry[0]),
		
		.target_element 	(output_sum_bus[7:0]),
		.output_carry 		(output_carry[0])
	);
	
	add_8 add_8_1
	(
		.source_element_0 	(vs2_effective[15:8]),
		.source_element_1 	(vs1_effective[15:8]),
		.input_carry 		(input_carry[1]),
		
		.target_element 	(output_sum_bus[15:8]),
		.output_carry 		(output_carry[1])
	);
	
	add_8 add_8_2
	(
		.source_element_0 	(vs2_effective[23:16]),
		.source_element_1 	(vs1_effective[23:16]),
		.input_carry 		(input_carry[2]),
		
		.target_element 	(output_sum_bus[23:16]),
		.output_carry 		(output_carry[2])
	);
	
	add_8 add_8_3
	(
		.source_element_0 	(vs2_effective[31:24]),
		.source_element_1 	(vs1_effective[31:24]),
		.input_carry 		(input_carry[3]),
		
		.target_element 	(output_sum_bus[31:24]),
		.output_carry 		(output_carry[3])
	);
	
	add_8 add_8_4
	(
		.source_element_0 	(vs2_effective[39:32]),
		.source_element_1 	(vs1_effective[39:32]),
		.input_carry 		(input_carry[4]),
		
		.target_element 	(output_sum_bus[39:32]),
		.output_carry 		(output_carry[4])
	);
	
	add_8 add_8_5
	(
		.source_element_0 	(vs2_effective[47:40]),
		.source_element_1 	(vs1_effective[47:40]),
		.input_carry 		(input_carry[5]),
		
		.target_element 	(output_sum_bus[47:40]),
		.output_carry 		(output_carry[5])
	);
	
	add_8 add_8_6
	(
		.source_element_0 	(vs2_effective[55:48]),
		.source_element_1 	(vs1_effective[55:48]),
		.input_carry 		(input_carry[6]),
		
		.target_element 	(output_sum_bus[55:48]),
		.output_carry 		(output_carry[6])
	);
	
	add_8 add_8_7
	(
		.source_element_0 	(vs2_effective[63:56]),
		.source_element_1 	(vs1_effective[63:56]),
		.input_carry 		(input_carry[7]),
		
		.target_element 	(output_sum_bus[63:56]),
		.output_carry 		(output_carry[7])
	);
	
endmodule 