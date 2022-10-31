module vector_register_read_freq

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	logic						clock,
	input 	logic						reset_n,
	input 	register_read_vector_t 		register_read_vector,
	
	input 	data_packet_t 				write_back_packet,
	
	input 	logic [TAG_LENGTH - 1:0]	v0_address,
	input 	logic [TAG_LENGTH - 1:0]	vs1_address,
	input 	logic [TAG_LENGTH - 1:0]	vs2_address,
	input 	logic [TAG_LENGTH - 1:0] 	vd_address,

	output 	data_packet_t 				v0_packet,
	output 	data_packet_t 				vs1_packet,
	output 	data_packet_t 				vs2_packet,
	output 	data_packet_t 				vd_packet
);

	register_read_vector_t 		register_read_vector_ff;
	
	data_packet_t 				write_back_packet_ff;
	
	logic [TAG_LENGTH - 1:0]	v0_address_ff;
	logic [TAG_LENGTH - 1:0]	vs1_address_ff;
	logic [TAG_LENGTH - 1:0]	vs2_address_ff;
	logic [TAG_LENGTH - 1:0] 	vd_address_ff;
	
	data_packet_t 				v0_packet_bus;
	data_packet_t 				vs1_packet_bus;
	data_packet_t 				vs2_packet_bus;
	data_packet_t 				vd_packet_bus;

	always_ff @ (posedge clock, negedge reset_n)
		if (!reset_n)
			begin
				register_read_vector_ff <= '0;
				
				write_back_packet_ff 	<= '0;
				
				v0_address_ff			<= '0;
				vs1_address_ff			<= '0;
				vs2_address_ff			<= '0;
				vd_address_ff			<= '0;
				
				v0_packet				<= '0;
				vs1_packet				<= '0;
				vs2_packet				<= '0;
				vd_packet				<= '0;
			end
			
		else
			begin
				register_read_vector_ff <= register_read_vector;
				
				write_back_packet_ff 	<= write_back_packet;
				
				v0_address_ff			<= v0_address;
				vs1_address_ff			<= vs1_address;
				vs2_address_ff			<= vs2_address;
				vd_address_ff			<= vd_address;
				
				v0_packet				<= v0_packet_bus;
				vs1_packet				<= vs1_packet_bus;
				vs2_packet				<= vs2_packet_bus;
				vd_packet				<= vd_packet_bus;
			end
	
	vector_register_read vector_register_read
	(
		.clock 					(clock),
		.reset_n 				(reset_n),
		.register_read_vector 	(register_read_vector_ff),
		
		.write_back_packet 		(write_back_packet_ff),
		
		.v0_address 			(v0_address_ff),
		.vs1_address 			(vs1_address_ff),
		.vs2_address 			(vs2_address_ff),
		.vd_address 			(vd_address_ff),
		
		.v0_packet 				(v0_packet_bus),
		.vs1_packet				(vs1_packet_bus),
		.vs2_packet 			(vs2_packet_bus),
		.vd_packet 				(vd_packet_bus)
	);

endmodule 