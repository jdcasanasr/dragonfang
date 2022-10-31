module vector_multiply_add_unit_freq

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;
		
(
	input 	logic clock,
	input 	logic reset_n,

	input 	execution_vector_t 	execution_vector,
	
	input 	logic [VLEN - 1:0] 	vs2,
	input 	logic [VLEN - 1:0] 	vs1,
	input 	logic [VLEN - 1:0]	vdd,
	
	output 	logic [VLEN - 1:0] 	vd
);
	
	execution_vector_t execution_vector_ff;
	logic [VLEN - 1:0] vs2_ff;
	logic [VLEN - 1:0] vs1_ff;
	logic [VLEN - 1:0] vdd_ff;
	logic [VLEN - 1:0] vd_bus;

	always_ff @ (posedge clock, negedge reset_n)
		if (!reset_n)
			begin
				execution_vector_ff <= '0;
				
				vs2_ff 				<= '0;
				vs1_ff 				<= '0;
				vdd_ff 				<= '0;
				
				vd 					<= '0;
			end
			
		else
			begin
				execution_vector_ff <= execution_vector;
				
				vs2_ff 				<= vs2;
				vs1_ff 				<= vs1;
				vdd_ff 				<= vdd;
				
				vd 					<= vd_bus;
			end
	
	vector_multiply_add_unit vector_multiply_add_unit
	(
		.execution_vector 	(execution_vector_ff),
		
		.vs2 				(vs2_ff),
		.vs1 				(vs1_ff),
		.vdd 				(vdd_ff),
		
		.vd 				(vd_bus)
	);

endmodule 