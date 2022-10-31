module vector_masking_unit_v2

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	write_back_vector_t 			write_back_vector,
	
	input 	data_packet_t 					v0,
	input 	data_packet_t 					vd_old,
	input 	data_packet_t 					vd_new,

	output 	data_packet_t 					vd
);

	logic [7:0] 	byte_select_0;
	logic [7:0] 	byte_select_1;
	logic [7:0] 	mask_effective;
	logic [7:0] 	tail_effective;
	
	logic [63:0] 	inactive_bus;
	
	logic [7:0] 	tail_8;
	logic [3:0] 	tail_16;
	logic [1:0] 	tail_32;
	logic 			tail_64;
	
	assign vd.tag = vd_new.tag;
	
	// Manage tail_32
	always_comb
		case (v0.data[1:0])
			2'b00, 2'b01 	: tail_32 = 2'b10;
			
			default 		: tail_32 = '0;
		endcase
	
	// Manage tail_64
	assign tail_64 = 1'b0; 	// We need at least two elements to talk of a tail.
	
	// Manage mask_effective
	always_comb
		case (write_back_vector.bit_mode)
			ENABLED_64BIT_MODE	: 
				for (int i = 0; i < 8; i++)
					mask_effective[i] = v0.data[0];
				
			ENABLED_32BIT_MODE	:
				begin
					mask_effective[0] = v0.data[0];
					mask_effective[1] = v0.data[0];
					mask_effective[2] = v0.data[0];
					mask_effective[3] = v0.data[0];
					
					mask_effective[4] = v0.data[1];
					mask_effective[5] = v0.data[1];
					mask_effective[6] = v0.data[1];
					mask_effective[7] = v0.data[1];
				end
				
			ENABLED_16BIT_MODE 	:
				begin
					mask_effective[0] = v0.data[0];
					mask_effective[1] = v0.data[0];
					
					mask_effective[2] = v0.data[1];
					mask_effective[3] = v0.data[1];
					
					mask_effective[4] = v0.data[2];
					mask_effective[5] = v0.data[2];
					
					mask_effective[6] = v0.data[3];
					mask_effective[7] = v0.data[3];
				end
				
			ENABLED_8BIT_MODE 	:
				for (int i = 0; i < 8; i++)
					mask_effective[i] = v0.data[i];
				
			default 			: mask_effective = '0;
		endcase
	
	// Manage tail_effective
	always_comb
		case (write_back_vector.bit_mode)
			ENABLED_64BIT_MODE	: 
				for (int i = 0; i < 8; i++)
					tail_effective[i] = tail_64;
				
			ENABLED_32BIT_MODE	:
				begin
					tail_effective[0] = tail_32[0];
					tail_effective[1] = tail_32[0];
					tail_effective[2] = tail_32[0];
					tail_effective[3] = tail_32[0];
					
					tail_effective[4] = tail_32[1];
					tail_effective[5] = tail_32[1];
					tail_effective[6] = tail_32[1];
					tail_effective[7] = tail_32[1];
				end
				
			ENABLED_16BIT_MODE 	:
				begin
					tail_effective[0] = tail_16[0];
					tail_effective[1] = tail_16[0];
					
					tail_effective[2] = tail_16[1];
					tail_effective[3] = tail_16[1];
					
					tail_effective[4] = tail_16[2];
					tail_effective[5] = tail_16[2];
					
					tail_effective[6] = tail_16[3];
					tail_effective[7] = tail_16[3];
				end
				
			ENABLED_8BIT_MODE 	:
				for (int i = 0; i < 8; i++)
					tail_effective[i] = tail_8[i];
				
			default 			: tail_effective = '0;
		endcase
	
	
	
	always_comb
		for (int i = 0; i < 8; i++)
			byte_select_0[i] = (tail_effective[i] & write_back_vector.vta) | (!tail_effective[i] & write_back_vector.vma); // <-- WRONG!
			
	always_comb
		for (int i = 0; i < 8; i++)
			byte_select_1[i] = (write_back_vector.vm & mask_effective[i]) | !write_back_vector.vm;

	always_comb
		begin
			inactive_bus[7:0] 	= (byte_select_0[0] ? '1 : vd_old.data[7:0]);
			inactive_bus[15:8] 	= (byte_select_0[1] ? '1 : vd_old.data[15:8]);
			inactive_bus[23:16] = (byte_select_0[2] ? '1 : vd_old.data[23:16]);
			inactive_bus[31:24] = (byte_select_0[3] ? '1 : vd_old.data[31:24]);
			inactive_bus[39:32] = (byte_select_0[4] ? '1 : vd_old.data[39:32]);
			inactive_bus[47:40] = (byte_select_0[5] ? '1 : vd_old.data[47:40]);
			inactive_bus[55:48] = (byte_select_0[6] ? '1 : vd_old.data[55:48]);
			inactive_bus[63:56] = (byte_select_0[7] ? '1 : vd_old.data[63:56]);
		end
		
	always_comb
		begin
			vd.data[7:0] 	= (byte_select_1[0] ? vd_new.data[7:0] : inactive_bus[7:0]);
			vd.data[15:8] 	= (byte_select_1[1] ? vd_new.data[15:8] : inactive_bus[15:8]);
			vd.data[23:16] 	= (byte_select_1[2] ? vd_new.data[23:16] : inactive_bus[23:16]);
			vd.data[31:24] 	= (byte_select_1[3] ? vd_new.data[31:24] : inactive_bus[31:24]);
			vd.data[39:32] 	= (byte_select_1[4] ? vd_new.data[39:32] : inactive_bus[39:32]);
			vd.data[47:40] 	= (byte_select_1[5] ? vd_new.data[47:40] : inactive_bus[47:40]);
			vd.data[55:48] 	= (byte_select_1[6] ? vd_new.data[55:48] : inactive_bus[55:48]);
			vd.data[63:56] 	= (byte_select_1[7] ? vd_new.data[63:56] : inactive_bus[63:56]);
		end
		
	
	vector_tail_encoder #(.VECTOR_MASK_LENGTH(4)) vector_tail_encoder_16
	(
		.vector_mask 			(v0.data[3:0]),
		
		.encoded_vector_mask 	(tail_16)
	);
	
	vector_tail_encoder #(.VECTOR_MASK_LENGTH(8)) vector_tail_encoder_8
	(
		.vector_mask 			(v0.data[7:0]),
		
		.encoded_vector_mask 	(tail_8)
	);
	
endmodule 