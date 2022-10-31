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
		
	always
		begin
			#20 instruction 		= "vfmacc.v* @ SEW = 64";
				execution_vector 	= vfmacc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				vdd 				= {$random, $random};
				
			#20 instruction 		= "vfmacc.v* @ SEW = 32";
				execution_vector 	= vfmacc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				vdd 				= {$random, $random};
				
			#20 instruction 		= "vfnmacc.v* @ SEW = 64";
				execution_vector 	= vfnmacc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				vdd 				= {$random, $random};
				
			#20 instruction 		= "vfnmacc.v* @ SEW = 32";
				execution_vector 	= vfnmacc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				vdd 				= {$random, $random};
				
			#20 instruction 		= "vfmsac.v* @ SEW = 64";
				execution_vector 	= vfmsac_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				vdd 				= {$random, $random};
				
			#20 instruction 		= "vfmsac.v* @ SEW = 32";
				execution_vector 	= vfmsac_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				vdd 				= {$random, $random};
				
			#20 instruction 		= "vfnmsac.v* @ SEW = 64";
				execution_vector 	= vfnmsac_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				vdd 				= {$random, $random};
				
			#20 instruction 		= "vfnmsac.v* @ SEW = 32";
				execution_vector 	= vfnmsac_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				vdd 				= {$random, $random};
			
			#20 ;
			#20 $stop;
		end
	
	vector_floating_point_multiply_add_unit vector_floating_point_multiply_add_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		.vdd 	 			(vdd),
		
		.vd 				(vd),
		.vd_high 			()
	);

endmodule 