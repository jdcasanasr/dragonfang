module vector_logic_unit 

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	execution_vector_t 	execution_vector,

	input 	logic [VLEN - 1:0]	vs2,
	input 	logic [VLEN - 1:0] 	vs1,
	
	output 	logic [VLEN - 1:0] 	vd
);

	always_comb
		case (execution_vector.logic_mode)
			ENABLED_AND_MODE 	: vd = vs2 & vs1;
			ENABLED_OR_MODE 	: vd = vs2 | vs1;
			ENABLED_XOR_MODE 	: vd = vs2 ^ vs1;
			
			default 			: vd = '0;
		endcase
	
endmodule 