`timescale 1 ns / 1 ns
`include "E:/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_floating_point_add_unit_tb

import 	dragonfang_pkg 					:: *,
		dragonfang_floating_point_pkg 	:: *,
		riscv_v_pkg 					:: *,
		execution_vectors_pkg 			:: *;

();

	execution_vector_t 	execution_vector;
	logic [VLEN - 1:0] 	vs2;
	logic [VLEN - 1:0] 	vs1;
	logic [VLEN - 1:0] 	vd;
	string 				instruction;

	initial
		begin
			instruction 		= "NULL";
		
			execution_vector 	= '0;
			vs2 				= '0;
			vs1 				= '0;
		end
	
	always
		begin
			#20 instruction 		= "vfadd.v* @ SEW = 64";
				execution_vector 	= vfadd_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
			#20 instruction 		= "vfadd.v* @ SEW = 32";
				execution_vector 	= vfadd_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
			#20 instruction 		= "vfsub.v* @ SEW = 64";
				execution_vector 	= vfsub_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
			#20 instruction 		= "vfsub.v* @ SEW = 32";
				execution_vector 	= vfsub_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
			#20 instruction 		= "vfrsub.v* @ SEW = 64";
				execution_vector 	= vfrsub_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
			#20 instruction 		= "vfrsub.v* @ SEW = 32";
				execution_vector 	= vfrsub_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
			#20 ;
			#20 $stop;
		end
		
	vector_floating_point_add_unit vector_floating_point_add_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		
		.vd 				(vd),
		.vd_high 			()
	);
	
endmodule 