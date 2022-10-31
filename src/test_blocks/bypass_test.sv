module bypass_test
(
	input 	logic 				clock,
	input 	logic 				reset_n,
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	input 	logic [63:0] 		vs1,
	
	output 	logic [63:0] 		vd_low
);

	// Register read to execution flip-flop's.
	logic [63:0] 		rr_ex_vs2_ff;
	logic [63:0] 		rr_ex_vs1_ff;
	execution_vector_t 	rr_ex_execution_vector_ff;
	
	// Execution to commit output bus.
	logic [63:0] 		ex_cm_vd_low_bus;
	
	// Input buses.
	logic [63:0] 				vector_logic_unit_vs2_bus;
	logic [63:0]				vector_logic_unit_vs1_bus;
	logic execution_vector_t 	vector_logic_unit_execution_vector_bus;
	
	// Manage inter-stage flip-flop's.
	always_ff @ (posedge clock, negedge reset_n)
		if (!reset_n)
			begin
				rr_ex_vs2_ff 				<= '0;
				rr_ex_vs1_ff 				<= '0;
				rr_ex_execution_vector_ff 	<= '0;
				
				vd_low 						<= '0;
			end
			
		else
			begin
				rr_ex_vs2_ff 				<= vs2;
				rr_ex_vs1_ff 				<= vs1;
				rr_ex_execution_vector_ff 	<= execution_vector;
				
				vd_low			 			<= ex_cm_vd_low_bus;
			end
	
	// 
	
	
	
	// Manage functional unit instances.
	vector_logic_unit vector_logic_unit_0
	(
		.clock 				(clock),
		.reset_n 			(reset_n),
		.execution_vector 	(execution_vector),
		
		.vs2 				(),
		.vs1 				(),
		
		.vd_bypass 			(),
		.vd_low 			()
	);
	
	vector_shift_unit vector_shift_unit_0
	(
		.clock 				(),
		.reset_n 			(),
		.execution_vector 	(),
		
		.vs2 				(),
		.vs1 				(),
		
		.vd_bypass 			(),
		.vd_low 			()
	);
	
endmodule 