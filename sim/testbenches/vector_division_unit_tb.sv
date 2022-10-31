`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_division_unit_tb

import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;

();
	execution_vector_t 	execution_vector;
	
	logic [63:0] 		vs2;
	logic [63:0] 		vs1;
	
	logic [63:0] 		vd;

	logic [63:0]		expected_vd;
	
	string 				instruction;
	
	initial
		begin
			execution_vector 	= '0;
			vs2 	= '0;
			vs1 	= '0;
			instruction = "NULL";
		end
			
	always
		begin
			// vdiv.v* @ 64
			#20 instruction 				= "vdiv.v* @ 64";
				execution_vector 					= vdiv_64;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd		 				= $signed(vs2) / $signed(vs1);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vdiv.v* @ 32
			#20 instruction 				= "vdiv.v* @ 32";
				execution_vector 					= vdiv_32;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[31:0] 				= $signed(vs2[31:0]) 	/ $signed(vs1[31:0]);
				expected_vd[63:32] 				= $signed(vs2[63:32]) 	/ $signed(vs1[63:32]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vdiv.v* @ 16
			#20 instruction 				= "vdiv.v* @ 16";
				execution_vector 					= vdiv_16;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[15:0] 				= $signed(vs2[15:0]) 	/ $signed(vs1[15:0]);
				expected_vd[31:16] 				= $signed(vs2[31:16]) 	/ $signed(vs1[31:16]);
				expected_vd[47:32] 				= $signed(vs2[47:32]) 	/ $signed(vs1[47:32]);
				expected_vd[63:48] 				= $signed(vs2[63:48]) 	/ $signed(vs1[63:48]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vdiv.v* @ 8
			#20 instruction 				= "vdiv.v* @ 8";
				execution_vector 					= vdiv_8;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[7:0] 				= $signed(vs2[7:0]) 	/ $signed(vs1[7:0]);
				expected_vd[15:8] 				= $signed(vs2[15:8]) 	/ $signed(vs1[15:8]);
				expected_vd[23:16] 				= $signed(vs2[23:16]) 	/ $signed(vs1[23:16]);
				expected_vd[31:24] 				= $signed(vs2[31:24]) 	/ $signed(vs1[31:24]);
				expected_vd[39:32] 				= $signed(vs2[39:32]) 	/ $signed(vs1[39:32]);
				expected_vd[47:40] 				= $signed(vs2[47:40]) 	/ $signed(vs1[47:40]);
				expected_vd[55:48] 				= $signed(vs2[55:48]) 	/ $signed(vs1[55:48]);
				expected_vd[63:56] 				= $signed(vs2[63:56]) 	/ $signed(vs1[63:56]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vdivu.v* @ 64
			#20 instruction 				= "vdivu.v* @ 64";
				execution_vector 					= vdivu_64;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd		 				= $unsigned(vs2) / $unsigned(vs1);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vdivu.v* @ 32
			#20 instruction 				= "vdivu.v* @ 32";
				execution_vector 					= vdivu_32;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[31:0] 				= $unsigned(vs2[31:0]) 	/ $unsigned(vs1[31:0]);
				expected_vd[63:32] 				= $unsigned(vs2[63:32]) / $unsigned(vs1[63:32]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vdivu.v* @ 16
			#20 instruction 				= "vdivu.v* @ 16";
				execution_vector 					= vdivu_16;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[15:0] 				= $unsigned(vs2[15:0]) 	/ $unsigned(vs1[15:0]);
				expected_vd[31:16] 				= $unsigned(vs2[31:16]) / $unsigned(vs1[31:16]);
				expected_vd[47:32] 				= $unsigned(vs2[47:32]) / $unsigned(vs1[47:32]);
				expected_vd[63:48] 				= $unsigned(vs2[63:48]) / $unsigned(vs1[63:48]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vdivu.v* @ 8
			#20 instruction 				= "vdivu.v* @ 8";
				execution_vector 					= vdivu_8;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[7:0] 				= $unsigned(vs2[7:0]) 	/ $unsigned(vs1[7:0]);
				expected_vd[15:8] 				= $unsigned(vs2[15:8]) 	/ $unsigned(vs1[15:8]);
				expected_vd[23:16] 				= $unsigned(vs2[23:16]) / $unsigned(vs1[23:16]);
				expected_vd[31:24] 				= $unsigned(vs2[31:24]) / $unsigned(vs1[31:24]);
				expected_vd[39:32] 				= $unsigned(vs2[39:32]) / $unsigned(vs1[39:32]);
				expected_vd[47:40] 				= $unsigned(vs2[47:40]) / $unsigned(vs1[47:40]);
				expected_vd[55:48] 				= $unsigned(vs2[55:48]) / $unsigned(vs1[55:48]);
				expected_vd[63:56] 				= $unsigned(vs2[63:56]) / $unsigned(vs1[63:56]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vrem.v* @ 64
			#20 instruction 				= "vrem.v* @ 64";
				execution_vector 					= vrem_64;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd		 				= $signed(vs2) % $signed(vs1);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vrem.v* @ 32
			#20 instruction 				= "vrem.v* @ 32";
				execution_vector 					= vrem_32;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[31:0] 				= $signed(vs2[31:0]) 	% $signed(vs1[31:0]);
				expected_vd[63:32] 				= $signed(vs2[63:32]) 	% $signed(vs1[63:32]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vrem.v* @ 16
			#20 instruction 				= "vrem.v* @ 16";
				execution_vector 					= vrem_16;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[15:0] 				= $signed(vs2[15:0]) 	% $signed(vs1[15:0]);
				expected_vd[31:16] 				= $signed(vs2[31:16]) 	% $signed(vs1[31:16]);
				expected_vd[47:32] 				= $signed(vs2[47:32]) 	% $signed(vs1[47:32]);
				expected_vd[63:48] 				= $signed(vs2[63:48]) 	% $signed(vs1[63:48]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vrem.v* @ 8
			#20 instruction 				= "vrem.v* @ 8";
				execution_vector 					= vrem_8;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[7:0] 				= $signed(vs2[7:0]) 	% $signed(vs1[7:0]);
				expected_vd[15:8] 				= $signed(vs2[15:8]) 	% $signed(vs1[15:8]);
				expected_vd[23:16] 				= $signed(vs2[23:16]) 	% $signed(vs1[23:16]);
				expected_vd[31:24] 				= $signed(vs2[31:24]) 	% $signed(vs1[31:24]);
				expected_vd[39:32] 				= $signed(vs2[39:32]) 	% $signed(vs1[39:32]);
				expected_vd[47:40] 				= $signed(vs2[47:40]) 	% $signed(vs1[47:40]);
				expected_vd[55:48] 				= $signed(vs2[55:48]) 	% $signed(vs1[55:48]);
				expected_vd[63:56] 				= $signed(vs2[63:56]) 	% $signed(vs1[63:56]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vremu.v* @ 64
			#20 instruction 				= "vremu.v* @ 64";
				execution_vector 					= vremu_64;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd		 				= $unsigned(vs2) % $unsigned(vs1);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vremu.v* @ 32
			#20 instruction 				= "vremu.v* @ 32";
				execution_vector 					= vremu_32;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[31:0] 				= $unsigned(vs2[31:0]) 	% $unsigned(vs1[31:0]);
				expected_vd[63:32] 				= $unsigned(vs2[63:32]) % $unsigned(vs1[63:32]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vremu.v* @ 16
			#20 instruction 				= "vremu.v* @ 16";
				execution_vector 					= vremu_16;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[15:0] 				= $unsigned(vs2[15:0]) 	% $unsigned(vs1[15:0]);
				expected_vd[31:16] 				= $unsigned(vs2[31:16]) % $unsigned(vs1[31:16]);
				expected_vd[47:32] 				= $unsigned(vs2[47:32]) % $unsigned(vs1[47:32]);
				expected_vd[63:48] 				= $unsigned(vs2[63:48]) % $unsigned(vs1[63:48]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vrem.v* @ 8
			#20 instruction 				= "vremu.v* @ 8";
				execution_vector 					= vremu_8;
				vs2 					= {$random, $random};
				vs1 					= {$random, $random};
				
				expected_vd[7:0] 				= $unsigned(vs2[7:0]) 	% $unsigned(vs1[7:0]);
				expected_vd[15:8] 				= $unsigned(vs2[15:8]) 	% $unsigned(vs1[15:8]);
				expected_vd[23:16] 				= $unsigned(vs2[23:16]) % $unsigned(vs1[23:16]);
				expected_vd[31:24] 				= $unsigned(vs2[31:24]) % $unsigned(vs1[31:24]);
				expected_vd[39:32] 				= $unsigned(vs2[39:32]) % $unsigned(vs1[39:32]);
				expected_vd[47:40] 				= $unsigned(vs2[47:40]) % $unsigned(vs1[47:40]);
				expected_vd[55:48] 				= $unsigned(vs2[55:48]) % $unsigned(vs1[55:48]);
				expected_vd[63:56] 				= $unsigned(vs2[63:56]) % $unsigned(vs1[63:56]);

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20 ;

			#20 $stop;
		end
	
	vector_division_unit vector_division_unit_0
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		
		.vd 			(vd)
	);

endmodule 