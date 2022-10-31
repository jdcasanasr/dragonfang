module execution_test

import dragonfang_pkg :: *;

(
	input logic 												clock,
	input logic 												reset_n,
	input execution_vector_t 									execution_vector,
	
	input logic [4:0] 											destination_tag,
	input operand_data_packet_t [NUMBER_FUNCTIONAL_UNITS - 1:0] operand_data_packet,
	
	output data_packet_t 										output_data_packet
);

	functional_unit_interface fui
	(
		.clock 				(clock),
		.reset_t 			(reset_n),
		.execution_vector 	(execution_vector)
	);

	bypass_network bypass_network_0
	(
		.feedback_interface 		(),
		.feedback_port_selection 	(),
		.input_operand_interface 	(),
		
		.fuiboo 					(fui)
	);
	
	vector_logic_unit vector_logic_unit_0 	(.fuic(fui));
	vector_logic_unit vector_logic_unit_1 	(.fuic(fui));
	
endmodule 