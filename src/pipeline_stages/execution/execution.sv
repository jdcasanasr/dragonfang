module execution

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	execution_packet_t 	input_port,
	input 	data_packet_t		bypass_port,
	
	output 	data_packet_t 		output_port
);
	
	// Input array for selector.
	logic [VLEN - 1:0] selector_data_array [NUMBER_FUNCTIONAL_UNITS - 1:0];
	
	// Input buses.
	// Selector's input port bus.
	logic [VLEN - 1:0] selector_input_port_bus [NUMBER_FUNCTIONAL_UNITS - 1:0];
	
	// Output buses.
	// Output port's data bus (its functional_unit_tag is appended later).
	logic [VLEN - 1:0] output_port_data_bus;
	
	// Bypass network's output port bus.
	operand_packet_t   bypass_network_output_port_bus;
	
	// Manage output_port as data_packet_t.
	assign output_port.tag 	= input_port.operand_set.vd.tag;
	assign output_port.data = output_port_data_bus;
	
	// Manage key modules instances.
	bypass_network #(.NUMBER_PORTS(NUMBER_FUNCTIONAL_UNITS)) bypass_network
	(
		.input_port 	(input_port.operand_set),	
		.bypass_port 	(bypass_port), 				// data_packet_t
		
		.output_port 	(bypass_network_output_port_bus)
	);
	
	selector #(.NUMBER_PORTS(NUMBER_FUNCTIONAL_UNITS), .PORT_WIDTH(VLEN)) selector
	(
		.input_port 			(selector_input_port_bus),
		.input_port_selection 	(input_port.functional_unit_tag),
		
		.output_port 			(output_port_data_bus)
	);
	
	// Manage functional unit modules instances.
	// Integer functional units.
	vector_logic_unit vector_integer_logic_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[0])
	);
	
	vector_extension_unit vector_integer_extension_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		
		.vd 				(selector_input_port_bus[1]),
		.vd_high 			(),
		.vd_extra 			()
	);
	
	vector_division_unit vector_integer_division_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[2])
	);
	
	vector_comparison_unit vector_integer_comparison_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[3])
	);
	
	vector_add_unit vector_integer_add_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		.v0					(bypass_network_output_port_bus.v0.data),
		
		.vd 				(selector_input_port_bus[4]),
		.vd_high 			()
	);
	
	vector_merge_unit vector_integer_merge_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		.v0					(bypass_network_output_port_bus.v0.data),
		
		.vd 				(selector_input_port_bus[5])
	);
	
	vector_minmax_unit vector_integer_minmax_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[6])
	);
	
	vector_multiplication_unit vector_integer_multiplication_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[7]),
		.vd_high 			()
	);
	
	vector_multiply_add_unit vector_integer_multiply_add_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		.vdd				(bypass_network_output_port_bus.vd.data),
		
		.vd 				(selector_input_port_bus[8]),
		.vd_high 			()
	);
	
	vector_shift_unit vector_integer_shift_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[9])
	);
	
	// Floating-point functional units.
	vector_classify_unit vector_floating_point_classify_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		
		.vd 				(selector_input_port_bus[10])
	);
	
	vector_conversion_unit vector_conversion_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		
		.vd 				(selector_input_port_bus[11]),
		.vd_high 			()
	);
	
	vector_floating_point_add_unit vector_floating_point_add_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[12]),
		.vd_high 			()
	);
	
	vector_floating_point_comparison_unit vector_floating_point_comparison_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[13])
	);
	
	vector_floating_point_divide_unit vector_floating_point_divide_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[14])
	);
	
	vector_floating_point_merge_unit vector_floating_point_merge_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		.v0					(bypass_network_output_port_bus.v0.data),
		
		.vd 				(selector_input_port_bus[15])
	);
	
	vector_floating_point_minmax_unit vector_floating_point_minmax_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[16])
	);
	
	vector_floating_point_multiply_add_unit vector_floating_point_multiply_add_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		.vdd				(bypass_network_output_port_bus.vd.data),
		
		.vd 				(selector_input_port_bus[17]),
		.vd_high 			()
	);
	
	vector_floating_point_multiply_unit vector_floating_point_multiply_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[18]),
		.vd_high 			()
	);
	
	vector_floating_point_sign_injection_unit vector_floating_point_sign_injection_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		.vs1 				(bypass_network_output_port_bus.vs1.data),
		
		.vd 				(selector_input_port_bus[19])
	);
	
	vector_floating_point_square_root_unit vector_floating_point_square_root_unit
	(
		.execution_vector 	(input_port.execution_vector),
		.vs2 				(bypass_network_output_port_bus.vs2.data),
		
		.vd 				(selector_input_port_bus[20])
	);
	
endmodule 