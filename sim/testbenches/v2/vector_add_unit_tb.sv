`timescale 1 ns / 1 ns
`include "C:/Users/jdani/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

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

	// Test signals.
	string				instruction;
	logic [63:0] 		expected_vd;
	logic [8:0]			sum_8 	[7:0];
	logic [16:0]		sum_16 	[3:0];
	logic [32:0]		sum_32 	[1:0];
	logic [64:0]		sum_64;

	initial
		begin
			instruction 		= "NULL";
			
			execution_vector 	= '0;
			vs2 				= '0;
			vs1 				= '0;
			v0 					= '0;
			
			expected_vd			= '0;
		end
		
	always
		begin
			// vadd.v*
			#20 instruction 		= "vadd.v* @ SEW = 64";
				execution_vector 	= vadd_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd 		= vs2 + vs1;
				
			#20 instruction 		= "vadd.v* @ SEW = 32";
				execution_vector 	= vadd_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd[31:0] 	= vs2[31:0] + vs1[31:0];
				expected_vd[63:32]	= vs2[63:32] + vs1[63:32];
			
			#20 instruction 		= "vadd.v* @ SEW = 16";
				execution_vector 	= vadd_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd[15:0] 	= vs2[15:0] 	+ vs1[15:0];
				expected_vd[31:16]	= vs2[31:16] 	+ vs1[31:16];
				expected_vd[47:32] 	= vs2[47:32] 	+ vs1[47:32];
				expected_vd[63:48]	= vs2[63:48] 	+ vs1[63:48];
				
			#20 instruction 		= "vadd.v* @ SEW = 8";
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
			
			// vsub.v*
			#20 instruction 		= "vsub.v* @ SEW = 64";
				execution_vector 	= vsub_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd 		= vs2 - vs1;
				
			#20 instruction 		= "vsub.v* @ SEW = 32";
				execution_vector 	= vsub_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd[31:0] 	= vs2[31:0] - vs1[31:0];
				expected_vd[63:32]	= vs2[63:32] - vs1[63:32];
				
			#20 instruction 		= "vsub.v* @ SEW = 16";
				execution_vector 	= vsub_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd[15:0] 	= vs2[15:0] 	- vs1[15:0];
				expected_vd[31:16]	= vs2[31:16] 	- vs1[31:16];
				expected_vd[47:32] 	= vs2[47:32] 	- vs1[47:32];
				expected_vd[63:48]	= vs2[63:48] 	- vs1[63:48];
				
			#20 instruction 		= "vsub.v* @ SEW = 8";
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
			
			// vrsub.v*
			#20 instruction 		= "vrsub.v* @ SEW = 64";
				execution_vector 	= vrsub_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd 		= vs1 - vs2;
				
				
			#20 instruction 		= "vrsub.v* @ SEW = 32";
				execution_vector 	= vrsub_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd[31:0] 	= vs1[31:0] - vs2[31:0];
				expected_vd[63:32]	= vs1[63:32] - vs2[63:32];
				
			#20 instruction 		= "vrsub.v* @ SEW = 16";
				execution_vector 	= vrsub_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				expected_vd[15:0] 	= vs1[15:0] 	- vs2[15:0];
				expected_vd[31:16]	= vs1[31:16] 	- vs2[31:16];
				expected_vd[47:32] 	= vs1[47:32] 	- vs2[47:32];
				expected_vd[63:48]	= vs1[63:48] 	- vs2[63:48];
				
			#20 instruction 		= "vrsub.v* @ SEW = 8";
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
			
			// vadc.v*m
			#20 instruction 		= "vadc.v*m @ SEW = 64";
				execution_vector 	= vadc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				expected_vd 		= vs2 + vs1 + v0[0];
				
				
			#20 instruction 		= "vadc.v*m @ SEW = 32";
				execution_vector 	= vadc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				expected_vd[31:0] 	= vs2[31:0] + vs1[31:0] 	+ v0[0];
				expected_vd[63:32]	= vs2[63:32] + vs1[63:32] 	+ v0[1];
				
				
			#20 instruction 		= "vadc.v*m @ SEW = 16";
				execution_vector 	= vadc_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				expected_vd[15:0] 	= vs2[15:0] 	+ vs1[15:0] 	+ v0[0];
				expected_vd[31:16]	= vs2[31:16] 	+ vs1[31:16] 	+ v0[1];
				expected_vd[47:32] 	= vs2[47:32] 	+ vs1[47:32] 	+ v0[2];
				expected_vd[63:48]	= vs2[63:48] 	+ vs1[63:48] 	+ v0[3];
			
			#20	instruction 		= "vadc.v*m @ SEW = 8";
				execution_vector 	= vadc_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				expected_vd[7:0] 	= vs2[7:0] 		+ vs1[7:0] 		+ v0[0];
				expected_vd[15:8]	= vs2[15:8] 	+ vs1[15:8] 	+ v0[1];
				expected_vd[23:16] 	= vs2[23:16] 	+ vs1[23:16] 	+ v0[2];
				expected_vd[31:24]	= vs2[31:24] 	+ vs1[31:24] 	+ v0[3];
				expected_vd[39:32] 	= vs2[39:32] 	+ vs1[39:32] 	+ v0[4];
				expected_vd[47:40]	= vs2[47:40] 	+ vs1[47:40] 	+ v0[5];
				expected_vd[55:48] 	= vs2[55:48] 	+ vs1[55:48] 	+ v0[6];
				expected_vd[63:56]	= vs2[63:56] 	+ vs1[63:56] 	+ v0[7];
				
			// vsbc.v*m
			#20	instruction 		= "vsbc.v*m @ SEW = 64";
				execution_vector 	= vsbc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				expected_vd 		= vs2 - vs1 - v0[0];
			
			#20	instruction 		= "vsbc.v*m @ SEW = 32";
				execution_vector 	= vsbc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				expected_vd[31:0] 	= vs2[31:0] 	- vs1[31:0] 	- v0[0];
				expected_vd[63:32]	= vs2[63:32] 	- vs1[63:32] 	- v0[1];
			
			#20	instruction 		= "vsbc.v*m @ SEW = 16";
				execution_vector 	= vsbc_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				expected_vd[15:0] 	= vs2[15:0] 	- vs1[15:0] 	- v0[0];
				expected_vd[31:16]	= vs2[31:16] 	- vs1[31:16] 	- v0[1];
				expected_vd[47:32] 	= vs2[47:32] 	- vs1[47:32] 	- v0[2];
				expected_vd[63:48]	= vs2[63:48] 	- vs1[63:48] 	- v0[3];
			
			#20	instruction 		= "vsbc.v*m @ SEW = 8";
				execution_vector 	= vsbc_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				expected_vd[7:0] 	= vs2[7:0] 		- vs1[7:0] 		- v0[0];
				expected_vd[15:8]	= vs2[15:8] 	- vs1[15:8] 	- v0[1];
				expected_vd[23:16] 	= vs2[23:16] 	- vs1[23:16] 	- v0[2];
				expected_vd[31:24]	= vs2[31:24] 	- vs1[31:24] 	- v0[3];
				expected_vd[39:32] 	= vs2[39:32] 	- vs1[39:32] 	- v0[4];
				expected_vd[47:40]	= vs2[47:40] 	- vs1[47:40] 	- v0[5];
				expected_vd[55:48] 	= vs2[55:48] 	- vs1[55:48] 	- v0[6];
				expected_vd[63:56]	= vs2[63:56] 	- vs1[63:56] 	- v0[7];
				
			// vmadc.v*m
			#20	instruction 		= "vmadc.v*m @ SEW = 64";
				execution_vector 	= vmadc_m64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_64 				= vs2 + vs1 + v0[0];
				expected_vd 		= {{63{1'b0}}, sum_64[64]};
			
			#20	instruction 		= "vmadc.v*m @ SEW = 32";
				execution_vector 	= vmadc_m32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_32[0] 			= vs2[31:0] 	+ vs1[31:0] 	+ v0[0];
				sum_32[1] 			= vs2[63:32] 	+ vs1[63:32] 	+ v0[1];
				expected_vd 	= {{62{1'b0}}, sum_32[1][32], sum_32[0][32]};

			#20	instruction 		= "vmadc.v*m @ SEW = 16";
				execution_vector 	= vmadc_m16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_16[0] 			= vs2[15:0] 	+ vs1[15:0] 	+ v0[0];
				sum_16[1] 			= vs2[31:16] 	+ vs1[31:16] 	+ v0[1];
				sum_16[2] 			= vs2[47:32] 	+ vs1[47:32] 	+ v0[2];
				sum_16[3] 			= vs2[63:48] 	+ vs1[63:48] 	+ v0[3];
				expected_vd 	= {{60{1'b0}}, sum_16[3][16], sum_16[2][16], sum_16[1][16], sum_16[0][16]};
			
			#20	instruction 		= "vmadc.v*m @ SEW = 8";
				execution_vector 	= vmadc_m8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_8[0] 			= vs2[7:0] 		+ vs1[7:0] 		+ v0[0];
				sum_8[1] 			= vs2[15:8] 	+ vs1[15:8] 	+ v0[1];
				sum_8[2] 			= vs2[23:16] 	+ vs1[23:16] 	+ v0[2];
				sum_8[3] 			= vs2[31:24] 	+ vs1[31:24] 	+ v0[3];
				sum_8[4] 			= vs2[39:32] 	+ vs1[39:32] 	+ v0[4];
				sum_8[5] 			= vs2[47:40] 	+ vs1[47:40] 	+ v0[5];
				sum_8[6] 			= vs2[55:48] 	+ vs1[55:48] 	+ v0[6];
				sum_8[7] 			= vs2[63:56] 	+ vs1[63:56] 	+ v0[7];
				
				expected_vd 		= {{56{1'b0}}, sum_8[7][8], sum_8[6][8], sum_8[5][8], sum_8[4][8],
										sum_8[3][8], sum_8[2][8], sum_8[1][8], sum_8[0][8]};
										
			// vmadc.v*
			#20	instruction 		= "vmadc.v* @ SEW = 64";
				execution_vector 	= vmadc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_64 				= vs2 + vs1;
				expected_vd 		= {{63{1'b0}}, sum_64[64]};
			
			#20	instruction 		= "vmadc.v* @ SEW = 32";
				execution_vector 	= vmadc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_32[0] 			= vs2[31:0] 	+ vs1[31:0];
				sum_32[1] 			= vs2[63:32] 	+ vs1[63:32];
				expected_vd 		= {{62{1'b0}}, sum_32[1][32], sum_32[0][32]};

			#20	instruction 		= "vmadc.v* @ SEW = 16";
				execution_vector 	= vmadc_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_16[0] 			= vs2[15:0] 	+ vs1[15:0];
				sum_16[1] 			= vs2[31:16] 	+ vs1[31:16];
				sum_16[2] 			= vs2[47:32] 	+ vs1[47:32];
				sum_16[3] 			= vs2[63:48] 	+ vs1[63:48];
				expected_vd 		= {{60{1'b0}}, sum_16[3][16], sum_16[2][16], sum_16[1][16], sum_16[0][16]};
			
			#20	instruction 		= "vmadc.v* @ SEW = 8";
				execution_vector 	= vmadc_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_8[0] 			= vs2[7:0] 		+ vs1[7:0];
				sum_8[1] 			= vs2[15:8] 	+ vs1[15:8];
				sum_8[2] 			= vs2[23:16] 	+ vs1[23:16];
				sum_8[3] 			= vs2[31:24] 	+ vs1[31:24];
				sum_8[4] 			= vs2[39:32] 	+ vs1[39:32];
				sum_8[5] 			= vs2[47:40] 	+ vs1[47:40];
				sum_8[6] 			= vs2[55:48] 	+ vs1[55:48];
				sum_8[7] 			= vs2[63:56] 	+ vs1[63:56];
				expected_vd 		= {{56{1'b0}}, sum_8[7][8], sum_8[6][8], sum_8[5][8], sum_8[4][8],
										sum_8[3][8], sum_8[2][8], sum_8[1][8], sum_8[0][8]};
			
			// vmsbc.v*m
			#20	instruction 		= "vmsbc.v*m @ SEW = 64";
				execution_vector 	= vmsbc_m64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_64 				= vs2 - vs1 - v0[0];
				expected_vd 		= {{63{1'b0}}, sum_64[64]};
			
			#20	instruction 		= "vmsbc.v*m @ SEW = 32";
				execution_vector 	= vmsbc_m32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_32[0] 			= vs2[31:0] 	- vs1[31:0] 	- v0[0];
				sum_32[1] 			= vs2[63:32] 	- vs1[63:32] 	- v0[1];
				expected_vd 		= {{62{1'b0}}, sum_32[1][32], sum_32[0][32]};

			#20	instruction 		= "vmsbc.v*m @ SEW = 16";
				execution_vector 	= vmsbc_m16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_16[0] 			= vs2[15:0] 	- vs1[15:0] 	- v0[0];
				sum_16[1] 			= vs2[31:16] 	- vs1[31:16] 	- v0[1];
				sum_16[2] 			= vs2[47:32] 	- vs1[47:32] 	- v0[2];
				sum_16[3] 			= vs2[63:48] 	- vs1[63:48] 	- v0[3];
				expected_vd 		= {{60{1'b0}}, sum_16[3][16], sum_16[2][16], sum_16[1][16], sum_16[0][16]};
			
			#20	instruction 		= "vmsbc.v*m @ SEW = 8";
				execution_vector 	= vmsbc_m8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_8[0] 			= vs2[7:0] 		- vs1[7:0] 		- v0[0];
				sum_8[1] 			= vs2[15:8] 	- vs1[15:8] 	- v0[1];
				sum_8[2] 			= vs2[23:16] 	- vs1[23:16] 	- v0[2];
				sum_8[3] 			= vs2[31:24] 	- vs1[31:24] 	- v0[3];
				sum_8[4] 			= vs2[39:32] 	- vs1[39:32] 	- v0[4];
				sum_8[5] 			= vs2[47:40] 	- vs1[47:40] 	- v0[5];
				sum_8[6] 			= vs2[55:48] 	- vs1[55:48] 	- v0[6];
				sum_8[7] 			= vs2[63:56] 	- vs1[63:56] 	- v0[7];
				expected_vd 		= {{56{1'b0}}, sum_8[7][8], sum_8[6][8], sum_8[5][8], sum_8[4][8],
										sum_8[3][8], sum_8[2][8], sum_8[1][8], sum_8[0][8]};
										
			// vmsbc.v*
			#20	instruction 		= "vmsbc.v* @ SEW = 64";
				execution_vector 	= vmsbc_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_64 				= vs2 - vs1;
				expected_vd 		= {{63{1'b0}}, sum_64[64]};
			
			#20	instruction 		= "vmsbc.v* @ SEW = 32";
				execution_vector 	= vmsbc_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_32[0] 			= vs2[31:0] 	- vs1[31:0];
				sum_32[1] 			= vs2[63:32] 	- vs1[63:32];
				expected_vd 		= {{62{1'b0}}, sum_32[1][32], sum_32[0][32]};

			#20	instruction 		= "vmsbc.v* @ SEW = 16";
				execution_vector 	= vmsbc_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_16[0] 			= vs2[15:0] 	- vs1[15:0];
				sum_16[1] 			= vs2[31:16] 	- vs1[31:16];
				sum_16[2] 			= vs2[47:32] 	- vs1[47:32];
				sum_16[3] 			= vs2[63:48] 	- vs1[63:48];
				expected_vd 		= {{60{1'b0}}, sum_16[3][16], sum_16[2][16], sum_16[1][16], sum_16[0][16]};
			
			#20	instruction 		= "vmsbc.v* @ SEW = 8";
				execution_vector 	= vmsbc_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				v0 					= {$random, $random};
				sum_8[0] 			= vs2[7:0] 		- vs1[7:0];
				sum_8[1] 			= vs2[15:8] 	- vs1[15:8];
				sum_8[2] 			= vs2[23:16] 	- vs1[23:16];
				sum_8[3] 			= vs2[31:24] 	- vs1[31:24];
				sum_8[4] 			= vs2[39:32] 	- vs1[39:32];
				sum_8[5] 			= vs2[47:40] 	- vs1[47:40];
				sum_8[6] 			= vs2[55:48] 	- vs1[55:48];
				sum_8[7] 			= vs2[63:56] 	- vs1[63:56];
				expected_vd 		= {{56{1'b0}}, sum_8[7][8], sum_8[6][8], sum_8[5][8], sum_8[4][8],
									sum_8[3][8], sum_8[2][8], sum_8[1][8], sum_8[0][8]};
									
			#20 $stop;
					
		end
	
	vector_add_unit vector_add_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		.v0 				(v0),
		
		.vd 				(vd),
		.vd_high			()
	);

endmodule 