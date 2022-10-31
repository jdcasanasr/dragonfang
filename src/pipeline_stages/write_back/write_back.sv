module write_back

import dragonfang_pkg :: *;

(
	input 	write_back_vector_t write_back_vector,
	
	input 	data_packet_t 		v0,
	input 	data_packet_t 		vd_old,
	input 	data_packet_t		vd_new,
	
	output 	data_packet_t 		vd_write_back
);

	vector_masking_unit_v2 vector_masking_unit_v2
	(
		.write_back_vector 	(write_back_vector),
		.v0 				(v0),
		.vd_old 			(vd_old),
		.vd_new 			(vd_new),
		
		.vd 				(vd_write_back)
	);

endmodule 