`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_merge_unit_tb

import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;
		
();

	execution_vector_t 	execution_vector;
	
	logic [63:0] 		vs2;
	logic [63:0] 		vs1;
	logic [63:0] 		v0;
	
	logic [63:0] 		vd;
	
	logic [63:0]		expected_vd;
	string 				instruction;

	initial
		begin
			instruction 		= "NULL";
			execution_vector 	= '0;
			
			vs2 				= '0;
			vs1 				= '0;
			v0 					= '0;
		end
			
	always
		begin
			// vmerge.v*m
			#20 instruction 			= "vmerge.v*m @ SEW = 64";
			
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				v0 						= {$random, $random};
				
				execution_vector 		= vmerge_64;
				
				expected_vd 		= (v0[0] ? vs1 : vs2);
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20 instruction 			= "vmerge.v*m @ SEW = 32";
			
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				v0 						= {$random, $random};
				
				execution_vector 		= vmerge_32;
				
				expected_vd[31:0] 	= (v0[0] ? vs1[31:0] : vs2[31:0]);
				expected_vd[63:32] 	= (v0[1] ? vs1[63:32] : vs2[63:32]);
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20 instruction 			= "vmerge.v*m @ SEW = 16";
			
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				v0 						= {$random, $random};
				
				execution_vector 		= vmerge_16;
				
				expected_vd[15:0] 	= (v0[0] ? vs1[15:0] : vs2[15:0]);
				expected_vd[31:16] 	= (v0[1] ? vs1[31:16] : vs2[31:16]);
				expected_vd[47:32] 	= (v0[2] ? vs1[47:32] : vs2[47:32]);
				expected_vd[63:48] 	= (v0[3] ? vs1[63:48] : vs2[63:48]);
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20 instruction 			= "vmerge.v*m @ SEW = 8";
			
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				v0 						= {$random, $random};
				
				execution_vector 		= vmerge_8;
				
				expected_vd[7:0] 	= (v0[0] ? vs1[7:0] : vs2[7:0]);
				expected_vd[15:8] 	= (v0[1] ? vs1[15:8] : vs2[15:8]);
				expected_vd[23:16] 	= (v0[2] ? vs1[23:16] : vs2[23:16]);
				expected_vd[31:24] 	= (v0[3] ? vs1[31:24] : vs2[31:24]);
				expected_vd[39:32] 	= (v0[4] ? vs1[39:32] : vs2[39:32]);
				expected_vd[47:40] 	= (v0[5] ? vs1[47:40] : vs2[47:40]);
				expected_vd[55:48] 	= (v0[6] ? vs1[55:48] : vs2[55:48]);
				expected_vd[63:56] 	= (v0[7] ? vs1[63:56] : vs2[63:56]);
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20 ;
		
			#20 $stop;
		end
	
	vector_merge_unit vector_merge_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		.v0 				(v0),
		
		.vd 				(vd)
	);
	
endmodule 