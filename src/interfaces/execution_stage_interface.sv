import dragonfang_pkg :: 	execution_vector_t,
							data_packet_t,
							operand_data_packet_t;

interface execution_stage_interface
(
	input logic 				clock,
	input logic 				reset_n,
	input execution_vector_t 	execution_vector,
	
	input logic [4:0]			destination_vrg_tag,
	
	output data_packet_t 		destination_vrg_packet
);

	

endinterface : execution_stage_interface