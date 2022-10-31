module vector_floating_point_sign_injection_unit_freq

import 	dragonfang_pkg 	:: *,
		dragonfang_floating_point_pkg :: *,
		riscv_v_pkg 	:: *;
		
(
	input 	logic clock,
	input 	logic reset_n,

	input 	execution_vector_t 	execution_vector,
	
	input 	logic [VLEN - 1:0] 	vs2,
	input 	logic [VLEN - 1:0] 	vs1,
	
	output 	logic [VLEN - 1:0] 	vd
);

	execution_vector_t execution_vector_ff;
	logic [VLEN - 1:0] vs2_ff;
	logic [VLEN - 1:0] vs1_ff;
	logic [VLEN - 1:0] vd_bus;

	always_ff @ (posedge clock, negedge reset_n)
		if (!reset_n)
			begin
				execution_vector_ff <= '0;
				
				vs2_ff 				<= '0;
				vs1_ff 				<= '0;
				
				vd 					<= '0;
			end
			
		else
			begin
				execution_vector_ff <= execution_vector;
				
				vs2_ff 				<= vs2;
				vs1_ff 				<= vs1;
				
				vd 					<= vd_bus;
			end
	
	vector_floating_point_sign_injection_unit vector_floating_point_sign_injection_unit
	(
		.execution_vector 	(execution_vector_ff),
		
		.vs2 				(vs2_ff),
		.vs1 				(vs1_ff),
		
		.vd 				(vd_bus)
	);

endmodule 