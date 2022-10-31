`timescale 1 ns / 1 ns
`include "E:/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_floating_point_conversion_unit_tb

import 	dragonfang_pkg 					:: *,
		dragonfang_floating_point_pkg 	:: *,
		riscv_v_pkg 					:: *,
		execution_vectors_pkg 			:: *;

();

	execution_vector_t 	execution_vector;
	logic [VLEN - 1:0] 	vs2;
	logic [VLEN - 1:0] 	vd;
	string 				instruction;

	initial
		begin
			instruction 		= "NULL";
		
			execution_vector 	= '0;
			vs2 				= '0;
		end
	
	always
		begin
			#20 instruction 		= "vfadd.v* @ SEW = 64";
				execution_vector 	= vfadd_64;
				vs2 				= {$random, $random};
				
			#20 ;
			#20 $stop;
		end
		
	vector_floating_point_conversion_unit vector_floating_point_conversion_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		
		.vd 				(vd)
	);
	
endmodule 