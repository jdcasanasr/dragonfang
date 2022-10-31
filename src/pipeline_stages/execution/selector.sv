module selector
#(
	parameter NUMBER_PORTS 	= 2,
	parameter PORT_WIDTH 	= 64
)
(
	input 	logic [PORT_WIDTH - 1:0] 			input_port [NUMBER_PORTS - 1:0],
	input 	logic [$clog2(NUMBER_PORTS) - 1:0] 	input_port_selection,
	
	output 	logic [PORT_WIDTH - 1:0] 			output_port
);

	logic [PORT_WIDTH - 1:0] effective_data;

	always_comb
		begin
			output_port = '0;
	
			for (int i = 0; i < NUMBER_PORTS; i++)
				if (input_port_selection == i)
					output_port = input_port[i];
		end

endmodule 