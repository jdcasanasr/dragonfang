module bypass_network

import dragonfang_pkg :: *;

#(
	parameter NUMBER_PORTS 	= 2
)
(
	input 	operand_packet_t 	input_port,
	input 	data_packet_t 		bypass_port,
	
	output 	operand_packet_t 	output_port
);

	// Select between the data fed by the bypass port
	// of what's in input_operand_data_port.
	always_comb
		begin
			output_port.v0 	= ((bypass_port.tag == input_port.v0.tag) ? bypass_port : input_port.v0);
			output_port.vs2 = ((bypass_port.tag == input_port.vs2.tag) ? bypass_port : input_port.vs2);
			output_port.vs1 = ((bypass_port.tag == input_port.vs1.tag) ? bypass_port : input_port.vs1);
			output_port.vd 	= ((bypass_port.tag == input_port.vd.tag) ? bypass_port : input_port.vd);
		end

endmodule 