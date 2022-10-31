`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_comparison_unit_tb
	
import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;

();

	execution_vector_t 	execution_vector;
	
	logic [63:0] 		vs2;
	logic [63:0] 		vs1;
	logic [7:0] 		vd;
	
	logic [7:0]			expected_vd;
	
	string 				instruction;
	
	initial
		begin
			execution_vector 	= '0;
			vs2 				= '0;
			vs1					= '0;
			expected_vd 		= '0;
			instruction = "NULL";
		end
		
	always
		begin
			// vmseq.v* @ 64
			#20 instruction 	= "vmseq.v* @ 64";
				execution_vector 		= vmseq_64;
				vs2 					= {$urandom, $urandom};
				vs1 					= {$urandom, $urandom};
				
				expected_vd[0] 			= (vs2 == vs1 ? 1'b1 : 1'b0);
				expected_vd[7:1]		= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vmseq.v* @ 32
			#20 instruction 	= "vmseq.v* @ 32";
				execution_vector 		= vmseq_32;
				vs2 					= {$urandom, $urandom};
				vs1 					= {$urandom, $urandom};
				
				expected_vd[0] 			= (vs2[31:0]  == vs1[31:0] ? 1'b1 : 1'b0);
				expected_vd[1] 			= (vs2[63:32] == vs1[63:32] ? 1'b1 : 1'b0);
				expected_vd[7:2]		= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vmseq.v* @ 16
			#20 instruction 	= "vmseq.v* @ 16";
				execution_vector 		= vmseq_16;
				vs2 					= {$urandom, $urandom};
				vs1 					= {$urandom, $urandom};
				
				expected_vd[0] 			= (vs2[15:0] == vs1[15:0] ? 1'b1 : 1'b0);
				expected_vd[1] 			= (vs2[31:16] == vs1[31:16] ? 1'b1 : 1'b0);
				expected_vd[2] 			= (vs2[47:32] == vs1[47:32] ? 1'b1 : 1'b0);
				expected_vd[3] 			= (vs2[63:48] == vs1[63:48] ? 1'b1 : 1'b0);
				expected_vd[7:4]			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vmseq.v* @ 8
			#20 instruction		= "vmseq.v* @ 8";
				execution_vector 		= vmseq_8;
				vs2 					= {$urandom, $urandom};
				vs1 					= {$urandom, $urandom};
				
				expected_vd[0] 			= (vs2[7:0] == vs1[7:0] ? 1'b1 : 1'b0);
				expected_vd[1] 			= (vs2[15:8] == vs1[15:8] ? 1'b1 : 1'b0);
				expected_vd[2] 			= (vs2[23:16] == vs1[23:16] ? 1'b1 : 1'b0);
				expected_vd[3] 			= (vs2[31:24] == vs1[31:24] ? 1'b1 : 1'b0);
				expected_vd[4] 			= (vs2[39:32] == vs1[39:32] ? 1'b1 : 1'b0);
				expected_vd[5] 			= (vs2[47:40] == vs1[47:40] ? 1'b1 : 1'b0);
				expected_vd[6] 			= (vs2[55:48] == vs1[55:48] ? 1'b1 : 1'b0);
				expected_vd[7] 			= (vs2[63:56] == vs1[63:56] ? 1'b1 : 1'b0);
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vmsne.v* @ 64
			#20 instruction = "vmsne.v* @ 64";
				execution_vector 	= vmsne_64;
				vs2 				= {$urandom(5), $urandom(5)};
				vs1 				= {$urandom(5), $urandom(5)};
				
				expected_vd[0] 		= (vs2 != vs1 ? 1'b1 : 1'b0);
				expected_vd[7:1]	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vmsne.v* @ 32
			#20 instruction = "vmsne.v* @ 32";
				execution_vector 	= vmsne_32;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[31:0] != vs1[31:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[63:32] != vs1[63:32] ? 1'b1 : 1'b0);
				expected_vd[7:2]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsne.v* @ 16
			#20 instruction = "vmsne.v* @ 16";
				execution_vector 	= vmsne_16;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[15:0] != vs1[15:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[31:16] != vs1[31:16] ? 1'b1 : 1'b0);
				expected_vd[2] 		= (vs2[47:32] != vs1[47:32] ? 1'b1 : 1'b0);
				expected_vd[3] 		= (vs2[63:48] != vs1[63:48] ? 1'b1 : 1'b0);
				expected_vd[7:4]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsne.v* @ 8
			#20 instruction	= "vmsne.v* @ 8";
				execution_vector 	= vmsne_8;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[7:0] != vs1[7:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[15:8] != vs1[15:8] ? 1'b1 : 1'b0);
				expected_vd[2] 		= (vs2[23:16] != vs1[23:16] ? 1'b1 : 1'b0);
				expected_vd[3] 		= (vs2[31:24] != vs1[31:24] ? 1'b1 : 1'b0);
				expected_vd[4] 		= (vs2[39:32] != vs1[39:32] ? 1'b1 : 1'b0);
				expected_vd[5] 		= (vs2[47:40] != vs1[47:40] ? 1'b1 : 1'b0);
				expected_vd[6] 		= (vs2[55:48] != vs1[55:48] ? 1'b1 : 1'b0);
				expected_vd[7] 		= (vs2[63:56] != vs1[63:56] ? 1'b1 : 1'b0);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsltu.v* @ 64
			#20 instruction = "vmsltu.v* @ 64";
				execution_vector 	= vmsltu_64;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2 < vs1 ? 1'b1 : 1'b0);
				expected_vd[7:1]	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vmsltu.v* @ 32
			#20 instruction = "vmsltu.v* @ 32";
				execution_vector 	= vmsltu_32;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[31:0] < vs1[31:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[63:32] < vs1[63:32] ? 1'b1 : 1'b0);
				expected_vd[7:2]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsltu.v* @ 16
			#20 instruction = "vmsltu.v* @ 16";
				execution_vector 	= vmsltu_16;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[15:0] < vs1[15:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[31:16] < vs1[31:16] ? 1'b1 : 1'b0);
				expected_vd[2] 		= (vs2[47:32] < vs1[47:32] ? 1'b1 : 1'b0);
				expected_vd[3] 		= (vs2[63:48] < vs1[63:48] ? 1'b1 : 1'b0);
				expected_vd[7:4]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsltu.v* @ 8
			#20 instruction	= "vmsltu.v* @ 8";
				execution_vector 	= vmsltu_8;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[7:0] < vs1[7:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[15:8] < vs1[15:8] ? 1'b1 : 1'b0);
				expected_vd[2] 		= (vs2[23:16] < vs1[23:16] ? 1'b1 : 1'b0);
				expected_vd[3] 		= (vs2[31:24] < vs1[31:24] ? 1'b1 : 1'b0);
				expected_vd[4] 		= (vs2[39:32] < vs1[39:32] ? 1'b1 : 1'b0);
				expected_vd[5] 		= (vs2[47:40] < vs1[47:40] ? 1'b1 : 1'b0);
				expected_vd[6] 		= (vs2[55:48] < vs1[55:48] ? 1'b1 : 1'b0);
				expected_vd[7] 		= (vs2[63:56] < vs1[63:56] ? 1'b1 : 1'b0);
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vmslt.v* @ 64
			#20 instruction = "vmslt.v* @ 64";
				execution_vector 	= vmslt_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2) < $signed(vs1) ? 1'b1 : 1'b0);
				expected_vd[7:1]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmslt.v* @ 32
			#20 instruction = "vmslt.v* @ 32";
				execution_vector 	= vmslt_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[31:0]) < $signed(vs1[31:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[63:32]) < $signed(vs1[63:32]) ? 1'b1 : 1'b0);
				expected_vd[7:2]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmslt.v* @ 16
			#20 instruction = "vmslt.v* @ 16";
				execution_vector 	= vmslt_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[15:0]) < $signed(vs1[15:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[31:16]) < $signed(vs1[31:16]) ? 1'b1 : 1'b0);
				expected_vd[2] 		= ($signed(vs2[47:32]) < $signed(vs1[47:32]) ? 1'b1 : 1'b0);
				expected_vd[3] 		= ($signed(vs2[63:48]) < $signed(vs1[63:48]) ? 1'b1 : 1'b0);
				expected_vd[7:4]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmslt.v* @ 8
			#20 instruction	= "vmslt.v* @ 8";
				execution_vector 	= vmslt_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[7:0]) < $signed(vs1[7:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[15:8]) < $signed(vs1[15:8]) ? 1'b1 : 1'b0);
				expected_vd[2] 		= ($signed(vs2[23:16]) < $signed(vs1[23:16]) ? 1'b1 : 1'b0);
				expected_vd[3] 		= ($signed(vs2[31:24]) < $signed(vs1[31:24]) ? 1'b1 : 1'b0);
				expected_vd[4] 		= ($signed(vs2[39:32]) < $signed(vs1[39:32]) ? 1'b1 : 1'b0);
				expected_vd[5] 		= ($signed(vs2[47:40]) < $signed(vs1[47:40]) ? 1'b1 : 1'b0);
				expected_vd[6] 		= ($signed(vs2[55:48]) < $signed(vs1[55:48]) ? 1'b1 : 1'b0);
				expected_vd[7] 		= ($signed(vs2[63:56]) < $signed(vs1[63:56]) ? 1'b1 : 1'b0);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsleu.v* @ 64
			#20 instruction = "vmsleu.v* @ 64";
				execution_vector 	= vmsleu_64;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2 <= vs1 ? 1'b1 : 1'b0);
				expected_vd[7:1]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsleu.v* @ 32
			#20 instruction = "vmsleu.v* @ 32";
				execution_vector 	= vmsleu_32;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[31:0] <= vs1[31:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[63:32] <= vs1[63:32] ? 1'b1 : 1'b0);
				expected_vd[7:2]	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vmsleu.v* @ 16
			#20 instruction = "vmsleu.v* @ 16";
				execution_vector 	= vmsleu_16;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[15:0] 	<= vs1[15:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[31:16] 	<= vs1[31:16] ? 1'b1 : 1'b0);
				expected_vd[2] 		= (vs2[47:32] 	<= vs1[47:32] ? 1'b1 : 1'b0);
				expected_vd[3] 		= (vs2[63:48] 	<= vs1[63:48] ? 1'b1 : 1'b0);
				expected_vd[7:4]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsleu.v* @ 8
			#20 instruction	= "vmsleu.v* @ 8";
				execution_vector 	= vmsleu_8;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[7:0] <= vs1[7:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[15:8] <= vs1[15:8] ? 1'b1 : 1'b0);
				expected_vd[2] 		= (vs2[23:16] <= vs1[23:16] ? 1'b1 : 1'b0);
				expected_vd[3] 		= (vs2[31:24] <= vs1[31:24] ? 1'b1 : 1'b0);
				expected_vd[4] 		= (vs2[39:32] <= vs1[39:32] ? 1'b1 : 1'b0);
				expected_vd[5] 		= (vs2[47:40] <= vs1[47:40] ? 1'b1 : 1'b0);
				expected_vd[6] 		= (vs2[55:48] <= vs1[55:48] ? 1'b1 : 1'b0);
				expected_vd[7] 		= (vs2[63:56] <= vs1[63:56] ? 1'b1 : 1'b0);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsle.v* @ 64
			#20 instruction = "vmsle.v* @ 64";
				execution_vector 	= vmsle_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2) <= $signed(vs1) ? 1'b1 : 1'b0);
				expected_vd[7:1]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsle.v* @ 32
			#20 instruction = "vmsle.v* @ 32";
				execution_vector 	= vmsle_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[31:0]) <= $signed(vs1[31:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[63:32]) <= $signed(vs1[63:32]) ? 1'b1 : 1'b0);
				expected_vd[7:2]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsle.v* @ 16
			#20 instruction = "vmsle.v* @ 16";
				execution_vector 	= vmsle_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[15:0]) <= $signed(vs1[15:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[31:16]) <= $signed(vs1[31:16]) ? 1'b1 : 1'b0);
				expected_vd[2] 		= ($signed(vs2[47:32]) <= $signed(vs1[47:32]) ? 1'b1 : 1'b0);
				expected_vd[3] 		= ($signed(vs2[63:48]) <= $signed(vs1[63:48]) ? 1'b1 : 1'b0);
				expected_vd[7:4]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsle.v* @ 8
			#20 instruction	= "vmsle.v* @ 8";
				execution_vector 	= vmsle_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[7:0]) <= $signed(vs1[7:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[15:8]) <= $signed(vs1[15:8]) ? 1'b1 : 1'b0);
				expected_vd[2] 		= ($signed(vs2[23:16]) <= $signed(vs1[23:16]) ? 1'b1 : 1'b0);
				expected_vd[3] 		= ($signed(vs2[31:24]) <= $signed(vs1[31:24]) ? 1'b1 : 1'b0);
				expected_vd[4] 		= ($signed(vs2[39:32]) <= $signed(vs1[39:32]) ? 1'b1 : 1'b0);
				expected_vd[5] 		= ($signed(vs2[47:40]) <= $signed(vs1[47:40]) ? 1'b1 : 1'b0);
				expected_vd[6] 		= ($signed(vs2[55:48]) <= $signed(vs1[55:48]) ? 1'b1 : 1'b0);
				expected_vd[7] 		= ($signed(vs2[63:56]) <= $signed(vs1[63:56]) ? 1'b1 : 1'b0);
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsgtu.v* @ 64
			#20 instruction = "vmsgtu.v* @ 64";
				execution_vector 	= vmsgtu_64;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2 > vs1 ? 1'b1 : 1'b0);
				expected_vd[7:1]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsgtu.v* @ 32
			#20 instruction = "vmsgtu.v* @ 32";
				execution_vector 	= vmsgtu_32;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[31:0] > vs1[31:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[63:32] > vs1[63:32] ? 1'b1 : 1'b0);
				expected_vd[7:2]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsgtu.v* @ 16
			#20 instruction = "vmsgtu.v* @ 16";
				execution_vector 	= vmsgtu_16;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[15:0] > vs1[15:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[31:16] > vs1[31:16] ? 1'b1 : 1'b0);
				expected_vd[2] 		= (vs2[47:32] > vs1[47:32] ? 1'b1 : 1'b0);
				expected_vd[3] 		= (vs2[63:48] > vs1[63:48] ? 1'b1 : 1'b0);
				expected_vd[7:4]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsgtu.v* @ 8
			#20 instruction	= "vmsgtu.v* @ 8";
				execution_vector 	= vmsgtu_8;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
				
				expected_vd[0] 		= (vs2[7:0] > vs1[7:0] ? 1'b1 : 1'b0);
				expected_vd[1] 		= (vs2[15:8] > vs1[15:8] ? 1'b1 : 1'b0);
				expected_vd[2] 		= (vs2[23:16] > vs1[23:16] ? 1'b1 : 1'b0);
				expected_vd[3] 		= (vs2[31:24] > vs1[31:24] ? 1'b1 : 1'b0);
				expected_vd[4] 		= (vs2[39:32] > vs1[39:32] ? 1'b1 : 1'b0);
				expected_vd[5] 		= (vs2[47:40] > vs1[47:40] ? 1'b1 : 1'b0);
				expected_vd[6] 		= (vs2[55:48] > vs1[55:48] ? 1'b1 : 1'b0);
				expected_vd[7] 		= (vs2[63:56] > vs1[63:56] ? 1'b1 : 1'b0);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsgt.v* @ 64
			#20 instruction = "vmsgt.v* @ 64";
				execution_vector 	= vmsgt_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2) > $signed(vs1) ? 1'b1 : 1'b0);
				expected_vd[7:1]	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vmsgt.v* @ 32
			#20 instruction = "vmsgt.v* @ 32";
				execution_vector 	= vmsgt_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[31:0]) > $signed(vs1[31:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[63:32]) > $signed(vs1[63:32]) ? 1'b1 : 1'b0);
				expected_vd[7:2]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsgt.v* @ 16
			#20 instruction = "vmsgt.v* @ 16";
				execution_vector 	= vmsgt_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[15:0]) > $signed(vs1[15:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[31:16]) > $signed(vs1[31:16]) ? 1'b1 : 1'b0);
				expected_vd[2] 		= ($signed(vs2[47:32]) > $signed(vs1[47:32]) ? 1'b1 : 1'b0);
				expected_vd[3] 		= ($signed(vs2[63:48]) > $signed(vs1[63:48]) ? 1'b1 : 1'b0);
				expected_vd[7:4]	= '0;

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmsgt.v* @ 8
			#20 instruction	= "vmsgt.v* @ 8";
				execution_vector 	= vmsgt_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[0] 		= ($signed(vs2[7:0])> $signed(vs1[7:0]) ? 1'b1 : 1'b0);
				expected_vd[1] 		= ($signed(vs2[15:8]) > $signed(vs1[15:8]) ? 1'b1 : 1'b0);
				expected_vd[2] 		= ($signed(vs2[23:16]) > $signed(vs1[23:16]) ? 1'b1 : 1'b0);
				expected_vd[3] 		= ($signed(vs2[31:24]) > $signed(vs1[31:24]) ? 1'b1 : 1'b0);
				expected_vd[4] 		= ($signed(vs2[39:32]) > $signed(vs1[39:32]) ? 1'b1 : 1'b0);
				expected_vd[5] 		= ($signed(vs2[47:40]) > $signed(vs1[47:40]) ? 1'b1 : 1'b0);
				expected_vd[6] 		= ($signed(vs2[55:48]) > $signed(vs1[55:48]) ? 1'b1 : 1'b0);
				expected_vd[7] 		= ($signed(vs2[63:56]) > $signed(vs1[63:56]) ? 1'b1 : 1'b0);
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			#20 ;
			
			#20 $stop;
		end
		
	vector_comparison_unit vector_comparison_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		
		.vd 				(vd)
	);

endmodule 