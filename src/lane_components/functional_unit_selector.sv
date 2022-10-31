module functional_unit_selector

import dragonfang_pkg::*;

#(
	parameter EXECUTION_OUTPUT_PACKET_WIDTH = 4
)

(
	input execution_output_packet_t [EXECUTION_OUTPUT_PACKET_WIDTH - 1:0] 	execution_output_packet,

	output commit_input_packet_t 											commit_input_packet
);

	integer i;

	function commit_input_packet_t pack_execution_to_commit (execution_output_packet_t execution_output_packet);
	
		commit_input_packet_t commit_input_packet;
		
		commit_input_packet.vector_destination_address 	= execution_output_packet.vector_destination_address;
		commit_input_packet.vd							= execution_output_packet.vd;
		
		return commit_input_packet;
	
	endfunction

	always_comb
		for (i = 0; i < EXECUTION_OUTPUT_PACKET_WIDTH; i++)
			if (i == execution_output_packet[i].functional_unit_id)
				commit_input_packet = pack_execution_to_commit (execution_output_packet[i]);
				
			else
				commit_input_packet = '0;
	
endmodule 