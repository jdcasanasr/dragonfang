`timescale 1 ns / 1 ns
`include "C:/Users/jdani/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_multiplication_unit_tb

import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;

();
	
	execution_vector_t 	execution_vector;
	
	logic [63:0] 		vs2;
	logic [63:0] 		vs1;
	
	logic [63:0] 		vd;
	
	logic [63:0]		expected_vd;
	logic [127:0]		expected_vd_complete;
	
	string 				instruction;
	
	initial
		begin
			execution_vector 	= '0;
			vs2 				= '0;
			vs1 				= '0;
			instruction 		= "NULL";
		end

	always
		begin
			// vmul.v* @ 64
			#20 instruction 					= "vmul.v* @ 64";
				execution_vector 				= vmul_64;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete 			= $signed(vs2) * $signed(vs1);
				
				expected_vd						= expected_vd_complete[63:0];
			
			// vmul.v* @ 32
			#20 instruction 					= "vmul.v* @ 32";
				execution_vector 				= vmul_32;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[63:0] 		= $signed(vs2[31:0]) 	* $signed(vs1[31:0]);
				expected_vd_complete[127:64] 	= $signed(vs2[63:32]) 	* $signed(vs1[63:32]);
				
				expected_vd						= {expected_vd_complete[95:64], expected_vd_complete[31:0]};
			
			// vmul.v* @ 16
			#20 instruction 					= "vmul.v* @ 16";
				execution_vector 				= vmul_16;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[31:0] 		= $signed(vs2[15:0]) 	* $signed(vs1[15:0]);
				expected_vd_complete[63:32] 	= $signed(vs2[31:16]) 	* $signed(vs1[31:16]);
				expected_vd_complete[95:64] 	= $signed(vs2[47:32]) 	* $signed(vs1[47:32]);
				expected_vd_complete[127:96] 	= $signed(vs2[63:48]) 	* $signed(vs1[63:48]);
				
				expected_vd						= {expected_vd_complete[111:96], expected_vd_complete[79:64], 
													expected_vd_complete[47:32], expected_vd_complete[15:0]};

			// vmul.v* @ 8
			#20 instruction 					= "vmul.v* @ 8";
				execution_vector 				= vmul_8;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[15:0] 		= $signed(vs2[7:0]) 	* $signed(vs1[7:0]);
				expected_vd_complete[31:16] 	= $signed(vs2[15:8]) 	* $signed(vs1[15:8]);
				expected_vd_complete[47:32] 	= $signed(vs2[23:16]) 	* $signed(vs1[23:16]);
				expected_vd_complete[63:48] 	= $signed(vs2[31:24]) 	* $signed(vs1[31:24]);
				expected_vd_complete[79:64] 	= $signed(vs2[39:32]) 	* $signed(vs1[39:32]);
				expected_vd_complete[95:80] 	= $signed(vs2[47:40]) 	* $signed(vs1[47:40]);
				expected_vd_complete[111:96] 	= $signed(vs2[55:48]) 	* $signed(vs1[55:48]);
				expected_vd_complete[127:112] 	= $signed(vs2[63:56]) 	* $signed(vs1[63:56]);
				
				expected_vd						= {expected_vd_complete[119:112], expected_vd_complete[103:96], 
													expected_vd_complete[87:80], expected_vd_complete[71:64],
													expected_vd_complete[55:48], expected_vd_complete[39:32],
													expected_vd_complete[23:16], expected_vd_complete[7:0]};
				
			// vmulh.v* @ 64
			#20 instruction 					= "vmulh.v* @ 64";
				execution_vector 				= vmulh_64;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete 			= $signed(vs2) * $signed(vs1);
				
				expected_vd 					= expected_vd_complete[127:64];
			
			// vmulh.v* @ 32
			#20 instruction 					= "vmulh.v* @ 32";
				execution_vector 				= vmulh_32;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[63:0] 		= $signed(vs2[31:0]) 	* $signed(vs1[31:0]);
				expected_vd_complete[127:64] 	= $signed(vs2[63:32]) 	* $signed(vs1[63:32]);
				
				expected_vd						= {expected_vd_complete[127:96], expected_vd_complete[63:32]};
				
			// vmulh.v* @ 16
			#20 instruction 					= "vmulh.v* @ 16";
				execution_vector 				= vmulh_16;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[31:0] 		= $signed(vs2[15:0]) 	* $signed(vs1[15:0]);
				expected_vd_complete[63:32] 	= $signed(vs2[31:16]) 	* $signed(vs1[31:16]);
				expected_vd_complete[95:64] 	= $signed(vs2[47:32]) 	* $signed(vs1[47:32]);
				expected_vd_complete[127:96] 	= $signed(vs2[63:48]) 	* $signed(vs1[63:48]);
				
				expected_vd						= {expected_vd_complete[127:112], expected_vd_complete[95:80],
													expected_vd_complete[63:48], expected_vd_complete[31:16]};
													
			// vmulh.v* @ 8
			#20 instruction 					= "vmulh.v* @ 8";
				execution_vector 				= vmulh_8;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[15:0] 		= $signed(vs2[7:0]) 	* $signed(vs1[7:0]);
				expected_vd_complete[31:16] 	= $signed(vs2[15:8]) 	* $signed(vs1[15:8]);
				expected_vd_complete[47:32] 	= $signed(vs2[23:16]) 	* $signed(vs1[23:16]);
				expected_vd_complete[63:48] 	= $signed(vs2[31:24]) 	* $signed(vs1[31:24]);
				expected_vd_complete[79:64] 	= $signed(vs2[39:32]) 	* $signed(vs1[39:32]);
				expected_vd_complete[95:80] 	= $signed(vs2[47:40]) 	* $signed(vs1[47:40]);
				expected_vd_complete[111:96] 	= $signed(vs2[55:48]) 	* $signed(vs1[55:48]);
				expected_vd_complete[127:112] 	= $signed(vs2[63:56]) 	* $signed(vs1[63:56]);
				
				expected_vd						= {expected_vd_complete[127:120], expected_vd_complete[111:104],
													expected_vd_complete[95:88], expected_vd_complete[79:72],
													expected_vd_complete[63:56], expected_vd_complete[47:40],
													expected_vd_complete[31:24], expected_vd_complete[15:8]};

			// vmulhu.v* @ 64
			#20 instruction 					= "vmulhu.v* @ 64";
				execution_vector 				= vmulhu_64;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete 			= $unsigned(vs2) * $unsigned(vs1);
				
				expected_vd 					= expected_vd_complete[127:64];
				
			// vmulhu.v* @ 32
			#20 instruction 					= "vmulhu.v* @ 32";
				execution_vector 				= vmulhu_32;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[63:0] 		= $unsigned(vs2[31:0]) 	* $unsigned(vs1[31:0]);
				expected_vd_complete[127:64] 	= $unsigned(vs2[63:32]) * $unsigned(vs1[63:32]);
				
				expected_vd						= {expected_vd_complete[127:96], expected_vd_complete[63:32]};

			// vmulhu.v* @ 16
			#20 instruction 					= "vmulhu.v* @ 16";
				execution_vector 				= vmulhu_16;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[31:0] 		= $unsigned(vs2[15:0]) 	* $unsigned(vs1[15:0]);
				expected_vd_complete[63:32] 	= $unsigned(vs2[31:16]) * $unsigned(vs1[31:16]);
				expected_vd_complete[95:64] 	= $unsigned(vs2[47:32]) * $unsigned(vs1[47:32]);
				expected_vd_complete[127:96] 	= $unsigned(vs2[63:48]) * $unsigned(vs1[63:48]);
				
				expected_vd						= {expected_vd_complete[127:112], expected_vd_complete[95:80],
													expected_vd_complete[63:48], expected_vd_complete[31:16]};

			// vmulhu.v* @ 8
			#20 instruction 					= "vmulhu.v* @ 8";
				execution_vector 				= vmulhu_8;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[15:0] 		= $unsigned(vs2[7:0]) 	* $unsigned(vs1[7:0]);
				expected_vd_complete[31:16] 	= $unsigned(vs2[15:8]) 	* $unsigned(vs1[15:8]);
				expected_vd_complete[47:32] 	= $unsigned(vs2[23:16]) * $unsigned(vs1[23:16]);
				expected_vd_complete[63:48] 	= $unsigned(vs2[31:24]) * $unsigned(vs1[31:24]);
				expected_vd_complete[79:64] 	= $unsigned(vs2[39:32]) * $unsigned(vs1[39:32]);
				expected_vd_complete[95:80] 	= $unsigned(vs2[47:40]) * $unsigned(vs1[47:40]);
				expected_vd_complete[111:96] 	= $unsigned(vs2[55:48]) * $unsigned(vs1[55:48]);
				expected_vd_complete[127:112] 	= $unsigned(vs2[63:56]) * $unsigned(vs1[63:56]);
				
				expected_vd						= {expected_vd_complete[127:120], expected_vd_complete[111:104],
													expected_vd_complete[95:88], expected_vd_complete[79:72],
													expected_vd_complete[63:56], expected_vd_complete[47:40],
													expected_vd_complete[31:24], expected_vd_complete[15:8]};

			// vmulhsu.v* @ 64
			#20 instruction 					= "vmulhsu.v* @ 64";
				execution_vector 				= vmulhsu_64;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete 			= $signed(vs2) * $unsigned(vs1);
				
				expected_vd 					= expected_vd_complete[127:64];
				
			// vmulhsu.v* @ 32
			#20 instruction 					= "vmulhsu.v* @ 32";
				execution_vector 				= vmulhsu_32;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[63:0] 		= $signed(vs2[31:0]) 	* $unsigned(vs1[31:0]);
				expected_vd_complete[127:64] 	= $signed(vs2[63:32]) 	* $unsigned(vs1[63:32]);
				
				expected_vd						= {expected_vd_complete[127:96], expected_vd_complete[63:32]};

			// vmulhsu.v* @ 16
			#20 instruction 					= "vmulhsu.v* @ 16";
				execution_vector 				= vmulhsu_16;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[31:0] 		= $signed(vs2[15:0]) 	* $unsigned(vs1[15:0]);
				expected_vd_complete[63:32] 	= $signed(vs2[31:16]) 	* $unsigned(vs1[31:16]);
				expected_vd_complete[95:64] 	= $signed(vs2[47:32]) 	* $unsigned(vs1[47:32]);
				expected_vd_complete[127:96] 	= $signed(vs2[63:48]) 	* $unsigned(vs1[63:48]);
				
				expected_vd						= {expected_vd_complete[127:112], expected_vd_complete[95:80],
													expected_vd_complete[63:48], expected_vd_complete[31:16]};

			// vmulhsu.v* @ 8
			#20 instruction 					= "vmulhsu.v* @ 8";
				execution_vector 				= vmulhsu_8;
				vs2 							= {$random, $random};
				vs1 							= {$random, $random};
				
				expected_vd_complete[15:0] 		= $signed(vs2[7:0]) 	* $unsigned(vs1[7:0]);
				expected_vd_complete[31:16] 	= $signed(vs2[15:8]) 	* $unsigned(vs1[15:8]);
				expected_vd_complete[47:32] 	= $signed(vs2[23:16]) * $unsigned(vs1[23:16]);
				expected_vd_complete[63:48] 	= $signed(vs2[31:24]) * $unsigned(vs1[31:24]);
				expected_vd_complete[79:64] 	= $signed(vs2[39:32]) * $unsigned(vs1[39:32]);
				expected_vd_complete[95:80] 	= $signed(vs2[47:40]) * $unsigned(vs1[47:40]);
				expected_vd_complete[111:96] 	= $signed(vs2[55:48]) * $unsigned(vs1[55:48]);
				expected_vd_complete[127:112] 	= $signed(vs2[63:56]) * $unsigned(vs1[63:56]);
				
				expected_vd						= {expected_vd_complete[127:120], expected_vd_complete[111:104],
													expected_vd_complete[95:88], expected_vd_complete[79:72],
													expected_vd_complete[63:56], expected_vd_complete[47:40],
													expected_vd_complete[31:24], expected_vd_complete[15:8]};
													
			#20 ;

			#20 $stop;
		end
	
	vector_multiply_unit vector_multiply_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		
		.vd 				(vd),
		.vd_high 			()
	);

endmodule 