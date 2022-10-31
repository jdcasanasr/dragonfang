`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_add_unit_tb 

import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;

();

	// Input and output signals.
	execution_vector_t 	execution_vector;
	
	logic [63:0] 		vs2;
	logic [63:0] 		vs1;
	logic [7:0] 		v0;
	
	logic [63:0] 		vd;
	logic [63:0] 		vd_high;

	// Test signals.
	string				instruction;
	string				diagnosis;
	logic [63:0] 		expected_vd;
	logic [63:0] 		expected_vd_high;
	logic [8:0]			sum_8 	[7:0];
	logic [16:0]		sum_16 	[3:0];
	logic [32:0]		sum_32 	[1:0];
	logic [64:0]		sum_64;

	initial
		begin
			instruction 		= "NULL";
			diagnosis			= "NULL";
			
			execution_vector 	= '0;
			vs2 				= '0;
			vs1 				= '0;
			v0 			= '0;
			
			expected_vd		= '0;
			expected_vd_high	= '0;
		end

	always
		begin
			#20 instruction 		= "vadd.v* @ SEW = 64";
				execution_vector 	= vadd_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd 	= vs2 + vs1;
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vadd.v* @ SEW = 32";
				execution_vector 	= vadd_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[31:0] 	= vs2[31:0] + vs1[31:0];
				expected_vd[63:32]	= vs2[63:32] + vs1[63:32];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vadd.v* @ SEW = 16";
				execution_vector 	= vadd_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[15:0] 	= vs2[15:0] 	+ vs1[15:0];
				expected_vd[31:16]	= vs2[31:16] 	+ vs1[31:16];
				expected_vd[47:32] 	= vs2[47:32] 	+ vs1[47:32];
				expected_vd[63:48]	= vs2[63:48] 	+ vs1[63:48];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vadd.v* @ SEW = 8";
				execution_vector 	= vadd_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				expected_vd[7:0] 	= vs2[7:0] 		+ vs1[7:0];
				expected_vd[15:8]	= vs2[15:8] 	+ vs1[15:8];
				expected_vd[23:16] 	= vs2[23:16] 	+ vs1[23:16];
				expected_vd[31:24]	= vs2[31:24] 	+ vs1[31:24];
				expected_vd[39:32] 	= vs2[39:32] 	+ vs1[39:32];
				expected_vd[47:40]	= vs2[47:40] 	+ vs1[47:40];
				expected_vd[55:48] 	= vs2[55:48] 	+ vs1[55:48];
				expected_vd[63:56]	= vs2[63:56] 	+ vs1[63:56];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vsub.v*
			#20	instruction 		= "vsub.v* @ SEW = 64";
				execution_vector 	= vsub_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd 	= vs2 - vs1;
				
				#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vsub.v* @ SEW = 32";
				execution_vector 	= vsub_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[31:0] 	= vs2[31:0] - vs1[31:0];
				expected_vd[63:32]	= vs2[63:32] - vs1[63:32];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vsub.v* @ SEW = 16";
				execution_vector 	= vsub_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[15:0] 	= vs2[15:0] 	- vs1[15:0];
				expected_vd[31:16]	= vs2[31:16] 	- vs1[31:16];
				expected_vd[47:32] 	= vs2[47:32] 	- vs1[47:32];
				expected_vd[63:48]	= vs2[63:48] 	- vs1[63:48];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vsub.v* @ SEW = 8";
				execution_vector 	= vsub_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				expected_vd[7:0] 	= vs2[7:0] 		- vs1[7:0];
				expected_vd[15:8]	= vs2[15:8] 	- vs1[15:8];
				expected_vd[23:16] 	= vs2[23:16] 	- vs1[23:16];
				expected_vd[31:24]	= vs2[31:24] 	- vs1[31:24];
				expected_vd[39:32] 	= vs2[39:32] 	- vs1[39:32];
				expected_vd[47:40]	= vs2[47:40] 	- vs1[47:40];
				expected_vd[55:48] 	= vs2[55:48] 	- vs1[55:48];
				expected_vd[63:56]	= vs2[63:56] 	- vs1[63:56];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vrsub.v*
			#20	instruction 		= "vrsub.v* @ SEW = 64";
				execution_vector 	= vrsub_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd 	= vs1 - vs2;
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vrsub.v* @ SEW = 32";
				execution_vector 	= vrsub_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[31:0] 	= vs1[31:0] - vs2[31:0];
				expected_vd[63:32]	= vs1[63:32] - vs2[63:32];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vrsub.v* @ SEW = 16";
				execution_vector 	= vrsub_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[15:0] 	= vs1[15:0] 	- vs2[15:0];
				expected_vd[31:16]	= vs1[31:16] 	- vs2[31:16];
				expected_vd[47:32] 	= vs1[47:32] 	- vs2[47:32];
				expected_vd[63:48]	= vs1[63:48] 	- vs2[63:48];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vrsub.v* @ SEW = 8";
				execution_vector 	= vrsub_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				expected_vd[7:0] 	= vs1[7:0] 		- vs2[7:0];
				expected_vd[15:8]	= vs1[15:8] 	- vs2[15:8];
				expected_vd[23:16] 	= vs1[23:16] 	- vs2[23:16];
				expected_vd[31:24]	= vs1[31:24] 	- vs2[31:24];
				expected_vd[39:32] 	= vs1[39:32] 	- vs2[39:32];
				expected_vd[47:40]	= vs1[47:40] 	- vs2[47:40];
				expected_vd[55:48] 	= vs1[55:48] 	- vs2[55:48];
				expected_vd[63:56]	= vs1[63:56] 	- vs2[63:56];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vadc.v*m
			#20 instruction 		= "vadc.v*m @ SEW = 64";
				execution_vector 	= vadc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd 	= vs2 + vs1 + v0[0];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vadc.v*m @ SEW = 32";
				execution_vector 	= vadc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[31:0] 	= vs2[31:0] + vs1[31:0] 	+ v0[0];
				expected_vd[63:32]	= vs2[63:32] + vs1[63:32] 	+ v0[1];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vadc.v*m @ SEW = 16";
				execution_vector 	= vadc_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[15:0] 	= vs2[15:0] 	+ vs1[15:0] 	+ v0[0];
				expected_vd[31:16]	= vs2[31:16] 	+ vs1[31:16] 	+ v0[1];
				expected_vd[47:32] 	= vs2[47:32] 	+ vs1[47:32] 	+ v0[2];
				expected_vd[63:48]	= vs2[63:48] 	+ vs1[63:48] 	+ v0[3];
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vadc.v*m @ SEW = 8";
				execution_vector 	= vadc_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				expected_vd[7:0] 	= vs2[7:0] 		+ vs1[7:0] 		+ v0[0];
				expected_vd[15:8]	= vs2[15:8] 	+ vs1[15:8] 	+ v0[1];
				expected_vd[23:16] 	= vs2[23:16] 	+ vs1[23:16] 	+ v0[2];
				expected_vd[31:24]	= vs2[31:24] 	+ vs1[31:24] 	+ v0[3];
				expected_vd[39:32] 	= vs2[39:32] 	+ vs1[39:32] 	+ v0[4];
				expected_vd[47:40]	= vs2[47:40] 	+ vs1[47:40] 	+ v0[5];
				expected_vd[55:48] 	= vs2[55:48] 	+ vs1[55:48] 	+ v0[6];
				expected_vd[63:56]	= vs2[63:56] 	+ vs1[63:56] 	+ v0[7];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vsbc.v*m
			#20	instruction 		= "vsbc.v*m @ SEW = 64";
				execution_vector 	= vsbc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd 	= vs2 - vs1 - v0[0];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vsbc.v*m @ SEW = 32";
				execution_vector 	= vsbc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[31:0] 	= vs2[31:0] 	- vs1[31:0] 	- v0[0];
				expected_vd[63:32]	= vs2[63:32] 	- vs1[63:32] 	- v0[1];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vsbc.v*m @ SEW = 16";
				execution_vector 	= vsbc_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd[15:0] 	= vs2[15:0] 	- vs1[15:0] 	- v0[0];
				expected_vd[31:16]	= vs2[31:16] 	- vs1[31:16] 	- v0[1];
				expected_vd[47:32] 	= vs2[47:32] 	- vs1[47:32] 	- v0[2];
				expected_vd[63:48]	= vs2[63:48] 	- vs1[63:48] 	- v0[3];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vsbc.v*m @ SEW = 8";
				execution_vector 	= vsbc_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				expected_vd[7:0] 	= vs2[7:0] 		- vs1[7:0] 		- v0[0];
				expected_vd[15:8]	= vs2[15:8] 	- vs1[15:8] 	- v0[1];
				expected_vd[23:16] 	= vs2[23:16] 	- vs1[23:16] 	- v0[2];
				expected_vd[31:24]	= vs2[31:24] 	- vs1[31:24] 	- v0[3];
				expected_vd[39:32] 	= vs2[39:32] 	- vs1[39:32] 	- v0[4];
				expected_vd[47:40]	= vs2[47:40] 	- vs1[47:40] 	- v0[5];
				expected_vd[55:48] 	= vs2[55:48] 	- vs1[55:48] 	- v0[6];
				expected_vd[63:56]	= vs2[63:56] 	- vs1[63:56] 	- v0[7];
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			// vmadc.v*m
			#20	instruction 		= "vmadc.v*m @ SEW = 64";
				execution_vector 	= vmadc_m64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_64 				= vs2 + vs1 + v0[0];
				expected_vd 	= {{63{1'b0}}, sum_64[64]};
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vmadc.v*m @ SEW = 32";
				execution_vector 	= vmadc_m32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_32[0] 			= vs2[31:0] 	+ vs1[31:0] 	+ v0[0];
				sum_32[1] 			= vs2[63:32] 	+ vs1[63:32] 	+ v0[1];
				expected_vd 	= {{62{1'b0}}, sum_32[1][32], sum_32[0][32]};

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20	instruction 		= "vmadc.v*m @ SEW = 16";
				execution_vector 	= vmadc_m16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_16[0] 			= vs2[15:0] 	+ vs1[15:0] 	+ v0[0];
				sum_16[1] 			= vs2[31:16] 	+ vs1[31:16] 	+ v0[1];
				sum_16[2] 			= vs2[47:32] 	+ vs1[47:32] 	+ v0[2];
				sum_16[3] 			= vs2[63:48] 	+ vs1[63:48] 	+ v0[3];
				
				expected_vd 	= {{60{1'b0}}, sum_16[3][16], sum_16[2][16], sum_16[1][16], sum_16[0][16]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vmadc.v*m @ SEW = 8";
				execution_vector 	= vmadc_m8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				sum_8[0] 			= vs2[7:0] 		+ vs1[7:0] 		+ v0[0];
				sum_8[1] 			= vs2[15:8] 	+ vs1[15:8] 	+ v0[1];
				sum_8[2] 			= vs2[23:16] 	+ vs1[23:16] 	+ v0[2];
				sum_8[3] 			= vs2[31:24] 	+ vs1[31:24] 	+ v0[3];
				sum_8[4] 			= vs2[39:32] 	+ vs1[39:32] 	+ v0[4];
				sum_8[5] 			= vs2[47:40] 	+ vs1[47:40] 	+ v0[5];
				sum_8[6] 			= vs2[55:48] 	+ vs1[55:48] 	+ v0[6];
				sum_8[7] 			= vs2[63:56] 	+ vs1[63:56] 	+ v0[7];
				
				expected_vd 	= {{56{1'b0}}, sum_8[7][8], sum_8[6][8], sum_8[5][8], sum_8[4][8],
										sum_8[3][8], sum_8[2][8], sum_8[1][8], sum_8[0][8]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vmadc.v*
			#20	instruction 		= "vmadc.v* @ SEW = 64";
				execution_vector 	= vmadc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_64 				= vs2 + vs1;
				expected_vd 	= {{63{1'b0}}, sum_64[64]};
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vmadc.v* @ SEW = 32";
				execution_vector 	= vmadc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_32[0] 			= vs2[31:0] 	+ vs1[31:0];
				sum_32[1] 			= vs2[63:32] 	+ vs1[63:32];
				expected_vd 	= {{62{1'b0}}, sum_32[1][32], sum_32[0][32]};

				#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20	instruction 		= "vmadc.v* @ SEW = 16";
				execution_vector 	= vmadc_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_16[0] 			= vs2[15:0] 	+ vs1[15:0];
				sum_16[1] 			= vs2[31:16] 	+ vs1[31:16];
				sum_16[2] 			= vs2[47:32] 	+ vs1[47:32];
				sum_16[3] 			= vs2[63:48] 	+ vs1[63:48];
				
				expected_vd 	= {{60{1'b0}}, sum_16[3][16], sum_16[2][16], sum_16[1][16], sum_16[0][16]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vmadc.v* @ SEW = 8";
				execution_vector 	= vmadc_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				sum_8[0] 			= vs2[7:0] 		+ vs1[7:0];
				sum_8[1] 			= vs2[15:8] 	+ vs1[15:8];
				sum_8[2] 			= vs2[23:16] 	+ vs1[23:16];
				sum_8[3] 			= vs2[31:24] 	+ vs1[31:24];
				sum_8[4] 			= vs2[39:32] 	+ vs1[39:32];
				sum_8[5] 			= vs2[47:40] 	+ vs1[47:40];
				sum_8[6] 			= vs2[55:48] 	+ vs1[55:48];
				sum_8[7] 			= vs2[63:56] 	+ vs1[63:56];
				
				expected_vd 	= {{56{1'b0}}, sum_8[7][8], sum_8[6][8], sum_8[5][8], sum_8[4][8],
										sum_8[3][8], sum_8[2][8], sum_8[1][8], sum_8[0][8]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vmsbc.v*m
			#20	instruction 		= "vmsbc.v*m @ SEW = 64";
				execution_vector 	= vmsbc_m64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_64 				= vs2 - vs1 - v0[0];
				expected_vd 	= {{63{1'b0}}, sum_64[64]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vmsbc.v*m @ SEW = 32";
				execution_vector 	= vmsbc_m32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_32[0] 			= vs2[31:0] 	- vs1[31:0] 	- v0[0];
				sum_32[1] 			= vs2[63:32] 	- vs1[63:32] 	- v0[1];
				expected_vd 	= {{62{1'b0}}, sum_32[1][32], sum_32[0][32]};

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20	instruction 		= "vmsbc.v*m @ SEW = 16";
				execution_vector 	= vmsbc_m16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_16[0] 			= vs2[15:0] 	- vs1[15:0] 	- v0[0];
				sum_16[1] 			= vs2[31:16] 	- vs1[31:16] 	- v0[1];
				sum_16[2] 			= vs2[47:32] 	- vs1[47:32] 	- v0[2];
				sum_16[3] 			= vs2[63:48] 	- vs1[63:48] 	- v0[3];
				
				expected_vd 	= {{60{1'b0}}, sum_16[3][16], sum_16[2][16], sum_16[1][16], sum_16[0][16]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vmsbc.v*m @ SEW = 8";
				execution_vector 	= vmsbc_m8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				sum_8[0] 			= vs2[7:0] 		- vs1[7:0] 		- v0[0];
				sum_8[1] 			= vs2[15:8] 	- vs1[15:8] 	- v0[1];
				sum_8[2] 			= vs2[23:16] 	- vs1[23:16] 	- v0[2];
				sum_8[3] 			= vs2[31:24] 	- vs1[31:24] 	- v0[3];
				sum_8[4] 			= vs2[39:32] 	- vs1[39:32] 	- v0[4];
				sum_8[5] 			= vs2[47:40] 	- vs1[47:40] 	- v0[5];
				sum_8[6] 			= vs2[55:48] 	- vs1[55:48] 	- v0[6];
				sum_8[7] 			= vs2[63:56] 	- vs1[63:56] 	- v0[7];
				
				expected_vd 	= {{56{1'b0}}, sum_8[7][8], sum_8[6][8], sum_8[5][8], sum_8[4][8],
										sum_8[3][8], sum_8[2][8], sum_8[1][8], sum_8[0][8]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			// vmsbc.v*
			#20	instruction 		= "vmsbc.v* @ SEW = 64";
				execution_vector 	= vmsbc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_64 				= vs2 - vs1;
				expected_vd 	= {{63{1'b0}}, sum_64[64]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vmsbc.v* @ SEW = 32";
				execution_vector 	= vmsbc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_32[0] 			= vs2[31:0] 	- vs1[31:0];
				sum_32[1] 			= vs2[63:32] 	- vs1[63:32];
				expected_vd 	= {{62{1'b0}}, sum_32[1][32], sum_32[0][32]};

			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
				
			#20	instruction 		= "vmsbc.v* @ SEW = 16";
				execution_vector 	= vmsbc_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				sum_16[0] 			= vs2[15:0] 	- vs1[15:0];
				sum_16[1] 			= vs2[31:16] 	- vs1[31:16];
				sum_16[2] 			= vs2[47:32] 	- vs1[47:32];
				sum_16[3] 			= vs2[63:48] 	- vs1[63:48];
				
				expected_vd 	= {{60{1'b0}}, sum_16[3][16], sum_16[2][16], sum_16[1][16], sum_16[0][16]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20	instruction 		= "vmsbc.v* @ SEW = 8";
				execution_vector 	= vmsbc_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
			
				sum_8[0] 			= vs2[7:0] 		- vs1[7:0];
				sum_8[1] 			= vs2[15:8] 	- vs1[15:8];
				sum_8[2] 			= vs2[23:16] 	- vs1[23:16];
				sum_8[3] 			= vs2[31:24] 	- vs1[31:24];
				sum_8[4] 			= vs2[39:32] 	- vs1[39:32];
				sum_8[5] 			= vs2[47:40] 	- vs1[47:40];
				sum_8[6] 			= vs2[55:48] 	- vs1[55:48];
				sum_8[7] 			= vs2[63:56] 	- vs1[63:56];
				
				expected_vd 	= {{56{1'b0}}, sum_8[7][8], sum_8[6][8], sum_8[5][8], sum_8[4][8],
										sum_8[3][8], sum_8[2][8], sum_8[1][8], sum_8[0][8]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
//			// vwadd.v*
//				instruction 		= "vwadd.v* @ SEW = 64";
//				execution_vector 	= vwadd_64;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd 	= vs2 + vs1;
//				expected_vd_high	= {64{expected_vd[63]}};
//			
//				instruction 		= "vwadd.v* @ SEW = 32";
//				execution_vector 	= vwadd_32;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd[31:0] 	= vs2[31:0] + vs1[31:0];
//				expected_vd[63:32]	= {32{expected_vd[31]}};
//			
//				expected_vd_high[31:0]	= vs2[63:32] + vs1[63:32];
//				expected_vd_high[63:32] = {32{expected_vd_high[63]}};
//			
//				instruction 		= "vwadd.v* @ SEW = 16";
//				execution_vector 	= vwadd_16;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd[15:0] 	= vs2[15:0] + vs1[15:0];
//				expected_vd[31:16]	= {16{expected_vd[15]}};
//				expected_vd[47:32] 	= vs2[31:16] + vs1[31:16];
//				expected_vd[63:48]	= {16{expected_vd[31]}};
//			
//				expected_vd_high[15:0]	= vs2[47:32] + vs1[47:32];
//				expected_vd_high[31:16] = {16{expected_vd_high[47]}};
//				expected_vd_high[47:32]	= vs2[63:48] + vs1[63:48];
//				expected_vd_high[63:48] = {16{expected_vd_high[63]}};
//			
//				instruction 		= "vwadd.v* @ SEW = 8";
//				execution_vector 	= vwadd_8;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//			
//			#20 expected_vd[7:0] 	= vs2[7:0] + vs1[7:0];
//				expected_vd[15:8]	= {8{expected_vd[7]}};
//				expected_vd[23:16] 	= vs2[15:8] + vs1[15:8];
//				expected_vd[31:24]	= {8{expected_vd[15]}};
//				expected_vd[39:32] 	= vs2[23:16] + vs1[23:16];
//				expected_vd[47:40]	= {8{expected_vd[23]}};
//				expected_vd[55:48] 	= vs2[31:24] + vs1[31:24];
//				expected_vd[63:56]	= {8{expected_vd[31]}};
//				
//			
//				expected_vd_high[7:0]	= vs2[39:32] + vs1[39:32];
//				expected_vd_high[15:8] 	= {8{expected_vd_high[39]}};
//				expected_vd_high[23:16]	= vs2[47:40] + vs1[47:40];
//				expected_vd_high[31:24] = {8{expected_vd_high[47]}};
//				expected_vd_high[39:32]	= vs2[55:48] + vs1[55:48];
//				expected_vd_high[47:40] = {8{expected_vd_high[55]}};
//				expected_vd_high[55:48]	= vs2[63:56] + vs1[63:56];
//				expected_vd_high[63:56] = {8{expected_vd_high[63]}};
//				
//				
//			// vwaddu.v*
//				instruction 		= "vwaddu.v* @ SEW = 64";
//				execution_vector 	= vwaddu_64;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd 	= vs2 + vs1;
//				expected_vd_high	= {64{1'b0}};
//			
//				instruction 		= "vwaddu.v* @ SEW = 32";
//				execution_vector 	= vwaddu_32;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd[31:0] 	= vs2[31:0] + vs1[31:0];
//				expected_vd[63:32]	= {32{1'b0}};
//			
//				expected_vd_high[31:0]	= vs2[63:32] + vs1[63:32];
//				expected_vd_high[63:32] = {32{1'b0}};
//			
//				instruction 		= "vwaddu.v* @ SEW = 16";
//				execution_vector 	= vwaddu_16;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd[15:0] 	= vs2[15:0] + vs1[15:0];
//				expected_vd[31:16]	= {16{1'b0}};
//				expected_vd[47:32] 	= vs2[31:16] + vs1[31:16];
//				expected_vd[63:48]	= {16{1'b0}};
//			
//				expected_vd_high[15:0]	= vs2[47:32] + vs1[47:32];
//				expected_vd_high[31:16] = {16{1'b0}};
//				expected_vd_high[47:32]	= vs2[63:48] + vs1[63:48];
//				expected_vd_high[63:48] = {16{1'b0}};
//			
//				instruction 		= "vwaddu.v* @ SEW = 8";
//				execution_vector 	= vwaddu_8;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//			
//			#20 expected_vd[7:0] 	= vs2[7:0] + vs1[7:0];
//				expected_vd[15:8]	= {8{1'b0}};
//				expected_vd[23:16] 	= vs2[15:8] + vs1[15:8];
//				expected_vd[31:24]	= {8{1'b0}};
//				expected_vd[39:32] 	= vs2[23:16] + vs1[23:16];
//				expected_vd[47:40]	= {8{1'b0}};
//				expected_vd[55:48] 	= vs2[31:24] + vs1[31:24];
//				expected_vd[63:56]	= {8{1'b0}};
//				
//			
//				expected_vd_high[7:0]	= vs2[39:32] + vs1[39:32];
//				expected_vd_high[15:8] 	= {8{1'b0}};
//				expected_vd_high[23:16]	= vs2[47:40] + vs1[47:40];
//				expected_vd_high[31:24] = {8{1'b0}};
//				expected_vd_high[39:32]	= vs2[55:48] + vs1[55:48];
//				expected_vd_high[47:40] = {8{1'b0}};
//				expected_vd_high[55:48]	= vs2[63:56] + vs1[63:56];
//				expected_vd_high[63:56] = {8{1'b0}};
//				
//			// vwsub.v*
//				instruction 		= "vwsub.v* @ SEW = 64";
//				execution_vector 	= vwsub_64;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd 	= vs2 - vs1;
//				expected_vd_high	= {64{expected_vd[63]}};
//			
//				instruction 		= "vwsub.v* @ SEW = 32";
//				execution_vector 	= vwsub_32;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd[31:0] 	= vs2[31:0] - vs1[31:0];
//				expected_vd[63:32]	= {32{expected_vd[31]}};
//			
//				expected_vd_high[31:0]	= vs2[63:32] - vs1[63:32];
//				expected_vd_high[63:32] = {32{expected_vd_high[63]}};
//			
//				instruction 		= "vwsub.v* @ SEW = 16";
//				execution_vector 	= vwsub_16;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd[15:0] 	= vs2[15:0] - vs1[15:0];
//				expected_vd[31:16]	= {16{expected_vd[15]}};
//				expected_vd[47:32] 	= vs2[31:16] - vs1[31:16];
//				expected_vd[63:48]	= {16{expected_vd[31]}};
//			
//				expected_vd_high[15:0]	= vs2[47:32] - vs1[47:32];
//				expected_vd_high[31:16] = {16{expected_vd_high[47]}};
//				expected_vd_high[47:32]	= vs2[63:48] - vs1[63:48];
//				expected_vd_high[63:48] = {16{expected_vd_high[63]}};
//			
//				instruction 		= "vwsub.v* @ SEW = 8";
//				execution_vector 	= vwsub_8;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//			
//			#20 expected_vd[7:0] 	= vs2[7:0] - vs1[7:0];
//				expected_vd[15:8]	= {8{expected_vd[7]}};
//				expected_vd[23:16] 	= vs2[15:8] - vs1[15:8];
//				expected_vd[31:24]	= {8{expected_vd[15]}};
//				expected_vd[39:32] 	= vs2[23:16] - vs1[23:16];
//				expected_vd[47:40]	= {8{expected_vd[23]}};
//				expected_vd[55:48] 	= vs2[31:24] - vs1[31:24];
//				expected_vd[63:56]	= {8{expected_vd[31]}};
//				
//			
//				expected_vd_high[7:0]	= vs2[39:32] - vs1[39:32];
//				expected_vd_high[15:8] 	= {8{expected_vd_high[39]}};
//				expected_vd_high[23:16]	= vs2[47:40] - vs1[47:40];
//				expected_vd_high[31:24] = {8{expected_vd_high[47]}};
//				expected_vd_high[39:32]	= vs2[55:48] - vs1[55:48];
//				expected_vd_high[47:40] = {8{expected_vd_high[55]}};
//				expected_vd_high[55:48]	= vs2[63:56] - vs1[63:56];
//				expected_vd_high[63:56] = {8{expected_vd_high[63]}};
//				
//				
//			// vwsubu.v*
//				instruction 		= "vwsubu.v* @ SEW = 64";
//				execution_vector 	= vwsubu_64;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd 	= vs2 - vs1;
//				expected_vd_high	= {64{1'b0}};
//			
//				instruction 		= "vwsubu.v* @ SEW = 32";
//				execution_vector 	= vwsubu_32;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd[31:0] 	= vs2[31:0] - vs1[31:0];
//				expected_vd[63:32]	= {32{1'b0}};
//			
//				expected_vd_high[31:0]	= vs2[63:32] - vs1[63:32];
//				expected_vd_high[63:32] = {32{1'b0}};
//			
//				instruction 		= "vwsubu.v* @ SEW = 16";
//				execution_vector 	= vwsubu_16;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//				
//			#20 expected_vd[15:0] 	= vs2[15:0] - vs1[15:0];
//				expected_vd[31:16]	= {16{1'b0}};
//				expected_vd[47:32] 	= vs2[31:16] - vs1[31:16];
//				expected_vd[63:48]	= {16{1'b0}};
//			
//				expected_vd_high[15:0]	= vs2[47:32] - vs1[47:32];
//				expected_vd_high[31:16] = {16{1'b0}};
//				expected_vd_high[47:32]	= vs2[63:48] - vs1[63:48];
//				expected_vd_high[63:48] = {16{1'b0}};
//			
//				instruction 		= "vwsubu.v* @ SEW = 8";
//				execution_vector 	= vwsubu_8;
//				vs2 				= {$random, $random};
//				vs1 				= {$random, $random};
//			
//			#20 expected_vd[7:0] 	= vs2[7:0] - vs1[7:0];
//				expected_vd[15:8]	= {8{1'b0}};
//				expected_vd[23:16] 	= vs2[15:8] - vs1[15:8];
//				expected_vd[31:24]	= {8{1'b0}};
//				expected_vd[39:32] 	= vs2[23:16] - vs1[23:16];
//				expected_vd[47:40]	= {8{1'b0}};
//				expected_vd[55:48] 	= vs2[31:24] - vs1[31:24];
//				expected_vd[63:56]	= {8{1'b0}};
//				
//			
//				expected_vd_high[7:0]	= vs2[39:32] - vs1[39:32];
//				expected_vd_high[15:8] 	= {8{1'b0}};
//				expected_vd_high[23:16]	= vs2[47:40] - vs1[47:40];
//				expected_vd_high[31:24] = {8{1'b0}};
//				expected_vd_high[39:32]	= vs2[55:48] - vs1[55:48];
//				expected_vd_high[47:40] = {8{1'b0}};
//				expected_vd_high[55:48]	= vs2[63:56] - vs1[63:56];
//				expected_vd_high[63:56] = {8{1'b0}};

			#20 ;

			#20 $stop;
					
		end
	
	vector_add_unit vector_add_unit_0
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		.v0 			(v0),
		
		.vd 				(vd),
		.vd_high			()
	);

endmodule 