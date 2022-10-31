module functional_unit_dispatcher

import dragonfang_pkg::*;

#(
	parameter FUNCTIONAL_UNIT_INPUT_BUS_WIDTH = 4
)
(
	input 	execution_packet_t execution_packet,

	// Unpacked vs. packed array?
	output 	execution_packet_t [FUNCTIONAL_UNIT_INPUT_BUS_WIDTH - 1:0] functional_unit_input_bus
);

	integer i;

	// Forward the data packet into the correct functional unit bus
	// and clear the rest.
	always_comb
		for (i = 0; i < FUNCTIONAL_UNIT_INPUT_BUS_WIDTH; i++)
			if (i == execution_packet.functional_unit_id)
				functional_unit_input_bus[i] = execution_packet;
				
			else
				functional_unit_input_bus[i] = '0;

endmodule 