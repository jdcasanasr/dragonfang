module scalar_replication_unit

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

(
	input 	execution_vector_t execution_vector,
	input 	logic [VLEN - 1:0] scalar_input,
	
	output 	logic [VLEN - 1:0] vector_output
);

	wire [7:0] 	element_8 	= scalar_input[7:0];
	wire [15:0] element_16	= scalar_input[15:0];
	wire [31:0] element_32 	= scalar_input[31:0];
	
	always_comb
		case (execution_vector.bit_mode)
			ENABLED_64BIT_MODE 	: vector_output = scalar_input;
			ENABLED_32BIT_MODE 	: vector_output = {element_32, element_32};
			ENABLED_16BIT_MODE 	: vector_output = {element_16, element_16, element_16, element_16};
			ENABLED_8BIT_MODE 	: vector_output = {element_8, element_8, element_8, element_8,
													element_8, element_8, element_8, element_8};
			
			default 			: vector_output = '0;
		endcase

endmodule 