`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_shift_unit_tb

import 	dragonfang_pkg 			:: *,
		execution_vectors_pkg 	:: *,
		riscv_v_pkg 			:: *;

();

	string instruction;

	execution_vector_t execution_vector;
	
	logic [VLEN - 1:0] vs2;
	logic [VLEN - 1:0] vs1;
	logic [VLEN - 1:0] vd;
	logic [VLEN - 1:0] expected_vd;
	
	initial
		begin
			instruction 		= "NULL";
		
			execution_vector 	= '0;
			
			vs2 				= '0;
			vs1 				= '0;
		end

	always
		begin
			// vsll.v* (Vector shift left logical).
			#20 instruction 		= "vsll.v* @ SEW = 64";
				
				execution_vector 	= vsll_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd			 = vs2 << vs1[5:0];
				
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 		= "vsll.v* @ SEW = 32";
				
				execution_vector 	= vsll_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[31:0]	= vs2[31:0] 	<< vs1[4:0];
				expected_vd[63:32]	= vs2[63:32] 	<< vs1[36:32];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			#20 instruction 		= "vsll.v* @ SEW = 16";
				
				execution_vector 	= vsll_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[15:0]	= vs2[15:0] 	<< vs1[3:0];
				expected_vd[31:16]	= vs2[31:16] 	<< vs1[19:16];
				expected_vd[47:32]	= vs2[47:32] 	<< vs1[35:32];
				expected_vd[63:48]	= vs2[63:48] 	<< vs1[51:48];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			#20 instruction 		= "vsll.v* @ SEW = 8";
				
				execution_vector 	= vsll_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[7:0]	= vs2[7:0] 		<< vs1[2:0];
				expected_vd[15:8]	= vs2[15:8] 	<< vs1[10:8];
				expected_vd[23:16]	= vs2[23:16] 	<< vs1[18:16];
				expected_vd[31:24]	= vs2[31:24] 	<< vs1[26:24];
				expected_vd[39:32]	= vs2[39:32] 	<< vs1[34:32];
				expected_vd[47:40]	= vs2[47:40] 	<< vs1[42:40];
				expected_vd[55:48]	= vs2[55:48] 	<< vs1[50:48];
				expected_vd[63:56]	= vs2[63:56] 	<< vs1[58:56];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			// vsrl.v* (Vector shift right logical).
			#20 instruction 		= "vsrl.v* @ SEW = 64";
				
				execution_vector 	= vsrl_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd			 = vs2 >> vs1[5:0];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
			
			#20 instruction 		= "vsrl.v* @ SEW = 32";
				
				execution_vector 	= vsrl_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[31:0]	= vs2[31:0] 	>> vs1[4:0];
				expected_vd[63:32]	= vs2[63:32] 	>> vs1[36:32];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			#20 instruction 		= "vsrl.v* @ SEW = 16";
				
				execution_vector 	= vsrl_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[15:0]	= vs2[15:0] 	>> vs1[3:0];
				expected_vd[31:16]	= vs2[31:16] 	>> vs1[19:16];
				expected_vd[47:32]	= vs2[47:32] 	>> vs1[35:32];
				expected_vd[63:48]	= vs2[63:48] 	>> vs1[51:48];
				
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 		= "vsrl.v* @ SEW = 8";
				
				execution_vector 	= vsrl_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[7:0]	= vs2[7:0] 		>> vs1[2:0];
				expected_vd[15:8]	= vs2[15:8] 	>> vs1[10:8];
				expected_vd[23:16]	= vs2[23:16] 	>> vs1[18:16];
				expected_vd[31:24]	= vs2[31:24] 	>> vs1[26:24];
				expected_vd[39:32]	= vs2[39:32] 	>> vs1[34:32];
				expected_vd[47:40]	= vs2[47:40] 	>> vs1[42:40];
				expected_vd[55:48]	= vs2[55:48] 	>> vs1[50:48];
				expected_vd[63:56]	= vs2[63:56] 	>> vs1[58:56];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			// vsra.v* (Vector shift right arithmetic).
			#20 instruction 		= "vsra.v* @ SEW = 64";
				
				execution_vector 	= vsra_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd			 = vs2 >>> vs1[5:0];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			#20 instruction 		= "vsra.v* @ SEW = 32";
				
				execution_vector 	= vsra_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[31:0]	= vs2[31:0] 	>>> vs1[4:0];
				expected_vd[63:32]	= vs2[63:32] 	>>> vs1[36:32];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			#20 instruction 		= "vsra.v* @ SEW = 16";
				
				execution_vector 	= vsra_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[15:0]	= vs2[15:0] 	>>> vs1[3:0];
				expected_vd[31:16]	= vs2[31:16] 	>>> vs1[19:16];
				expected_vd[47:32]	= vs2[47:32] 	>>> vs1[35:32];
				expected_vd[63:48]	= vs2[63:48] 	>>> vs1[51:48];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			#20 instruction 		= "vsra.v* @ SEW = 8";
				
				execution_vector 	= vsra_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[7:0]	= vs2[7:0] 		>>> vs1[2:0];
				expected_vd[15:8]	= vs2[15:8] 	>>> vs1[10:8];
				expected_vd[23:16]	= vs2[23:16] 	>>> vs1[18:16];
				expected_vd[31:24]	= vs2[31:24] 	>>> vs1[26:24];
				expected_vd[39:32]	= vs2[39:32] 	>>> vs1[34:32];
				expected_vd[47:40]	= vs2[47:40] 	>>> vs1[42:40];
				expected_vd[55:48]	= vs2[55:48] 	>>> vs1[50:48];
				expected_vd[63:56]	= vs2[63:56] 	>>> vs1[58:56];
			
			#10 if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			#20 ;
			
			#20 $stop;
		end
	
	vector_shift_unit vector_shift_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		
		.vd 				(vd)
	);
	
endmodule 