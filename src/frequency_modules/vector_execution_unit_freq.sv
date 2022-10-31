module vector_execution_unit_freq

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	logic 				clock,
	input 	logic 				reset_n,

	input 	execution_packet_t 	input_port,
	input 	data_packet_t		bypass_port,
	
	output 	data_packet_t 		output_port
);

	execution_packet_t 	input_port_ff;
	data_packet_t 		bypass_port_ff;
	data_packet_t 		output_port_bus;

	always_ff @ (posedge clock, negedge reset_n)
		if (!reset_n)
			begin
				input_port_ff 	<= '0;
				bypass_port_ff 	<= '0;
				
				output_port 	<= '0;
			end
			
		else
			begin
				input_port_ff 	<= input_port;
				bypass_port_ff 	<= bypass_port;
				
				output_port 	<= output_port_bus;
			end
	
	vector_execution vector_execution
	(
		.input_port 	(input_port_ff),
		.bypass_port 	(bypass_port_ff),
		
		.output_port 	(output_port_bus)
	);

endmodule 