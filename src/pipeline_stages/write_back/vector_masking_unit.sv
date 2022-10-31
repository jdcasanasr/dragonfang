module vector_masking_unit

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	write_back_vector_t 			write_back_vector,
	
	input 	data_packet_t 					v0,
	input 	data_packet_t 					vd,

	output 	data_packet_t 					vd_masked
);

	logic 	[7:0] v0_effective;
	logic	[7:0] vd_byte_selection;
	logic	[7:0] vd_byte_selection_effective;
	logic 	[7:0] is_tail;
	
	wire 	[2:0] first_one_index;
	wire 	[2:0] number_leading_zeroes;
	
	assign vd_masked.tag 	= vd.tag;
	assign v0_effective 	= v0.data[7:0];
	assign first_one_index 	= 4'd8 - number_leading_zeroes; // 8 - leading_zeroes - 1.
	
	always_comb
		case (write_back_vector.bit_mode)
			ENABLED_64BIT_MODE 	:
				for (int i = 0; i < 8; i++)
					vd_byte_selection_effective[i] = vd_byte_selection[0];
				
			ENABLED_32BIT_MODE 	:
				begin
					vd_byte_selection_effective[0] = vd_byte_selection[0];
					vd_byte_selection_effective[1] = vd_byte_selection[0];
					vd_byte_selection_effective[2] = vd_byte_selection[0];
					vd_byte_selection_effective[3] = vd_byte_selection[0];
					vd_byte_selection_effective[4] = vd_byte_selection[1];
					vd_byte_selection_effective[5] = vd_byte_selection[1];
					vd_byte_selection_effective[6] = vd_byte_selection[1];
					vd_byte_selection_effective[7] = vd_byte_selection[1];
				end
				
			ENABLED_16BIT_MODE 	:
				begin
					vd_byte_selection_effective[0] = vd_byte_selection[0];
					vd_byte_selection_effective[1] = vd_byte_selection[0];
					vd_byte_selection_effective[2] = vd_byte_selection[1];
					vd_byte_selection_effective[3] = vd_byte_selection[1];
					vd_byte_selection_effective[4] = vd_byte_selection[2];
					vd_byte_selection_effective[5] = vd_byte_selection[2];
					vd_byte_selection_effective[6] = vd_byte_selection[3];
					vd_byte_selection_effective[7] = vd_byte_selection[3];
				end
				
			ENABLED_8BIT_MODE 	:
				for (int i = 0; i < 8; i++)
					vd_byte_selection_effective[i] = vd_byte_selection[i];
			
			default 			: vd_byte_selection_effective = '0;
		endcase
	
	always_comb
		case (first_one_index)
			3'd0 	: is_tail = 8'b0000_0001;
			3'd1 	: is_tail = 8'b0000_0010;
			3'd2 	: is_tail = 8'b0000_0100;
			3'd3 	: is_tail = 8'b0000_1000;
			3'd4 	: is_tail = 8'b0001_0000;
			3'd5 	: is_tail = 8'b0010_0000;
			3'd6 	: is_tail = 8'b0100_0000;
			3'd7 	: is_tail = 8'b1000_0000;
		
			default : is_tail = '0;
		endcase
	
	always_comb
		if (write_back_vector.vm)
			for (int i = 0; i < 8; i++)
				vd_byte_selection[i] = (is_tail[i] ? write_back_vector.vta : write_back_vector.vma);// & v0_effective[i]);
			
		else
			for (int i = 0; i < 8; i++)
				vd_byte_selection = '0;
	
	always_comb
		begin
			vd_masked.data[7:0] 	= (vd_byte_selection_effective[0] ? vd.data[7:0] : '1);
			vd_masked.data[15:8] 	= (vd_byte_selection_effective[1] ? vd.data[15:8] : '1);
			vd_masked.data[23:16] 	= (vd_byte_selection_effective[2] ? vd.data[23:16] : '1);
			vd_masked.data[31:24] 	= (vd_byte_selection_effective[3] ? vd.data[31:24] : '1);
			vd_masked.data[39:32] 	= (vd_byte_selection_effective[4] ? vd.data[39:32] : '1);
			vd_masked.data[47:40] 	= (vd_byte_selection_effective[5] ? vd.data[47:40] : '1);
			vd_masked.data[55:48] 	= (vd_byte_selection_effective[6] ? vd.data[55:48] : '1);
			vd_masked.data[63:56] 	= (vd_byte_selection_effective[7] ? vd.data[63:56] : '1);
		end
	
	leading_bits_counter #(.INPUT_VECTOR_WIDTH(8), .BIT_TO_COUNT(1'b0)) leading_zeroes_counter
	(
		.input_vector (v0_effective),
	
		.count_vector (number_leading_zeroes)
	);
	
endmodule 