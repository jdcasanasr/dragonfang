`timescale 1 ns / 1 ns
`include "C:/Users/jdani/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"


module vector_floating_point_multiply_add_unit_tb

import 	dragonfang_pkg 					:: *,
		dragonfang_floating_point_pkg 	:: *,
		riscv_v_pkg 					:: *,
		execution_vectors_pkg 			:: *;

();

	execution_vector_t execution_vector;
	logic [VLEN - 1:0] vs2;
	logic [VLEN - 1:0] vs1;
	logic [VLEN - 1:0] vdd;
	logic [VLEN - 1:0] vd;
	string instruction;

	initial
		begin
			instruction 		= "NULL";
			execution_vector 	= '0;
			vs2 				= '0;
			vs1 				= '0;
			vdd 				= '0;
		end
		
endmodule 