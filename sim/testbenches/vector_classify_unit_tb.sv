`timescale 1 ns / 1 ns
`include "E:/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_classify_unit_tb

	import 	dragonfang_pkg					:: *,
			dragonfang_floating_point_pkg	:: *,
			ieee_754_2019_pkg				:: *,
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
			#20 instruction 		= "vfclass.v @ SEW = 64";
				execution_vector 	= vfclass_64;
				vs2 				= {$random, $random};
				
			#20 instruction 		= "vfclass.v @ SEW = 32";
				execution_vector 	= vfclass_32;
				vs2 				= {$random, $random};
			
			#20 ;
			#20 $stop;
		end
	
	vector_classify_unit vector_classify_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		
		
		.vd 				(vd)
	);
	
endmodule 