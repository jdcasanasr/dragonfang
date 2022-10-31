module vector_write_back_freq

import dragonfang_pkg :: *;

(
	input 	logic 				clock,
	input 	logic 				reset_n,

	input 	write_back_vector_t write_back_vector,
	input 	data_packet_t 		v0,
	input 	data_packet_t 		vd_old,
	input 	data_packet_t 		vd_new,
	
	output 	data_packet_t 		vd_write_back
);

	write_back_vector_t write_back_vector_ff;
	data_packet_t 		v0_ff;
	data_packet_t 		vd_old_ff;
	data_packet_t 		vd_new_ff;
	
	data_packet_t 		vd_write_back_bus;

	always_ff @ (posedge clock, negedge reset_n)
		if (!reset_n)
			begin
				write_back_vector_ff 	<= '0;
				v0_ff					<= '0;
				vd_old_ff				<= '0;
				vd_new_ff				<= '0;
				
				vd_write_back 			<= '0;
			end
			
		else
			begin
				write_back_vector_ff 	<= write_back_vector;
				v0_ff					<= v0;
				vd_old_ff				<= vd_old;
				vd_new_ff				<= vd_new;
				
				vd_write_back 			<= vd_write_back_bus;
			end
	
	vector_write_back vector_write_back
	(
		.write_back_vector 	(write_back_vector_ff),
		.v0 				(v0_ff),
		.vd_old 			(vd_old_ff),
		.vd_new 			(vd_new_ff),
	
		.vd_write_back 		(vd_write_back_bus)
	);

endmodule 