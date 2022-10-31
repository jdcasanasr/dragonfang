module register_read

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	logic						clock,
	input 	logic						reset_n,
	input 	register_read_vector_t 		register_read_vector
	
	input 	data_packet_t 				write_back_packet,
	
	input 	logic [VLEN - 1:0]	 		v0_address,
	input 	logic [VLEN - 1:0]	 		vs1_address,
	input 	logic [VLEN - 1:0]	 		vs2_address,
	input 	logic [VLEN - 1:0]	 		vd_address,

	output 	data_packet_t 				v0_packet,
	output 	data_packet_t 				vs1_packet,
	output 	data_packet_t 				vs2_packet,
	output 	data_packet_t 				vd_packet
);
	
	assign v0_packet.tag 	= v0_address;
	assign vs2_packet.tag 	= vs1_address;
	assign vs1_packet.tag 	= vs2_address;
	assign vd_packet.tag 	= vd_address;
	
	vector_register_file #(.NUMBER_REGISTERS(NUMBER_PHYSICAL_REGISTERS), .REGISTER_LENGTH(VLEN)) vector_register_file
	(
		.clock 			(clock),
		.reset_n 		(reset_n),
		.read_enable 	(register_read_vector.read_request),
		.write_enable 	(register_read_vector.write_back_request),
		
		.read_address_0 ('0),
		.read_address_1 (input_port.operand_tag_packet.vs2),
		.read_address_2 (input_port.operand_tag_packet.vs1),
		.read_address_3 (input_port.operand_tag_packet.vd),
		
		.write_address 	(write_back_port.tag),
		.write_port 	(write_back_port.data),
		
		.read_port_0 	(output_port.operand_set.v0.data),
		.read_port_1 	(output_port.operand_set.vs2.data),
		.read_port_2 	(vector_register_file_read_port_2_bus),
		.read_port_3 	(output_port.operand_set.vd.data)
	);
	
endmodule 