module masking_unit

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	logic 							vm,
	input 	logic 							vma,
	input 	logic 							vta,
	input 	logic 							
	
	input 	logic [VELEMENTS_MAX - 1:0] 	v0,
	input 	data_packet_t 					vd_unmasked,

	output 	data_packet_t 					vd_masked,
);

	

endmodule 