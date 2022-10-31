`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_multiply_add_unit_tb 

import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;

();

	execution_vector_t 	execution_vector;
	
	logic [63:0] 		vs2;
	logic [63:0] 		vs1;
	logic [63:0] 		vdd;
	
	logic [63:0] 		vdd_high;
	logic [63:0] 		vd;

	logic [63:0]		expected_vd;
	logic [63:0]		expected_vdd_high;
	logic [127:0]		expected_vdd_complete;
	
	string 				current_instruction;
	
	initial
		begin
			execution_vector 	= '0;
			
			vs2 				= '0;
			vs1 				= '0;
			vdd 				= '0;
			
			current_instruction = "NULL";
		end

	always
		begin
			
			// vmacc.v*
			#20 current_instruction 		= "vmacc.v* @ 64";
				execution_vector 			= vmacc_64;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd 				= vs2 			* vs1 			+ vdd;
				expected_vdd_high 			= '0;
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
				
			#20 current_instruction 		= "vmacc.v* @ 32";
				execution_vector 			= vmacc_32;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[31:0] 			= vs2[31:0] 	* vs1[31:0] 	+ vdd[31:0];
				expected_vd[63:32] 			= vs2[63:32] 	* vs1[63:32] 	+ vdd[63:32];
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			#20 current_instruction 		= "vmacc.v* @ 16";
				execution_vector 			= vmacc_16;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[15:0] 			= vs2[15:0] 	* vs1[15:0] 	+ vdd[15:0];
				expected_vd[31:16] 			= vs2[31:16] 	* vs1[31:16] 	+ vdd[31:16];
				expected_vd[47:32] 			= vs2[47:32] 	* vs1[47:32] 	+ vdd[47:32];
				expected_vd[63:48] 			= vs2[63:48] 	* vs1[63:48] 	+ vdd[63:48];
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			#20 current_instruction 		= "vmacc.v* @ 8";
				execution_vector 			= vmacc_8;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[7:0] 			= vs2[7:0] 		* vs1[7:0] 		+ vdd[7:0];
				expected_vd[15:8] 			= vs2[15:8] 	* vs1[15:8] 	+ vdd[15:8];
				expected_vd[23:16] 			= vs2[23:16] 	* vs1[23:16] 	+ vdd[23:16];
				expected_vd[31:24] 			= vs2[31:24] 	* vs1[31:24] 	+ vdd[31:24];
				expected_vd[39:32] 			= vs2[39:32] 	* vs1[39:32] 	+ vdd[39:32];
				expected_vd[47:40] 			= vs2[47:40] 	* vs1[47:40] 	+ vdd[47:40];
				expected_vd[55:48] 			= vs2[55:48] 	* vs1[55:48] 	+ vdd[55:48];
				expected_vd[63:56] 			= vs2[63:56] 	* vs1[63:56] 	+ vdd[63:56];
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			// vmadd.v*
			#20 current_instruction 		= "vmadd.v* @ 64";
				execution_vector 			= vmadd_64;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd 				= vs2 			* vdd 		+ vs1;
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			#20 current_instruction 		= "vmadd.v* @ 32";
				execution_vector 			= vmadd_32;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[31:0] 			= vs2[31:0] 	* vdd[31:0] 	+ vs1[31:0];
				expected_vd[63:32] 			= vs2[63:32] 	* vdd[63:32] + vs1[63:32];
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			#20 current_instruction 		= "vmadd.v* @ 16";
				execution_vector 			= vmadd_16;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[15:0] 			= vs2[15:0] 	* vdd[15:0] 	+ vs1[15:0];
				expected_vd[31:16] 			= vs2[31:16] 	* vdd[31:16] + vs1[31:16];
				expected_vd[47:32] 			= vs2[47:32] 	* vdd[47:32] + vs1[47:32];
				expected_vd[63:48] 			= vs2[63:48] 	* vdd[63:48] + vs1[63:48];
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			#20 current_instruction 		= "vmadd.v* @ 8";
				execution_vector 			= vmadd_8;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[7:0] 			= vs2[7:0] 		* vdd[7:0] 	+ vs1[7:0];
				expected_vd[15:8] 			= vs2[15:8] 	* vdd[15:8] 	+ vs1[15:8];
				expected_vd[23:16] 			= vs2[23:16] 	* vdd[23:16] + vs1[23:16];
				expected_vd[31:24] 			= vs2[31:24] 	* vdd[31:24] + vs1[31:24];
				expected_vd[39:32] 			= vs2[39:32] 	* vdd[39:32] + vs1[39:32];
				expected_vd[47:40] 			= vs2[47:40] 	* vdd[47:40] + vs1[47:40];
				expected_vd[55:48] 			= vs2[55:48] 	* vdd[55:48] + vs1[55:48];
				expected_vd[63:56] 			= vs2[63:56] 	* vdd[63:56] + vs1[63:56];
				expected_vdd_high 			= '0;	
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
		
			// vnmsac.v*
			#20 current_instruction 		= "vnmsac.v* @ 64";
				execution_vector 			= vnmsac_64;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd 				= -1 * (vs2 		* vs1) 			+ vdd;
				expected_vdd_high 			= '0;
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
				
			#20 current_instruction 		= "vnmsac.v* @ 32";
				execution_vector 			= vnmsac_32;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[31:0] 			= -1 * (vs2[31:0] 	* vs1[31:0]) 	+ vdd[31:0];
				expected_vd[63:32] 			= -1 * (vs2[63:32] 	* vs1[63:32]) 	+ vdd[63:32];
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			#20 current_instruction 		= "vnmsac.v* @ 16";
				execution_vector 			= vnmsac_16;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[15:0] 			= -1 * (vs2[15:0] 	* vs1[15:0]) 	+ vdd[15:0];
				expected_vd[31:16] 			= -1 * (vs2[31:16] 	* vs1[31:16]) 	+ vdd[31:16];
				expected_vd[47:32] 			= -1 * (vs2[47:32] 	* vs1[47:32]) 	+ vdd[47:32];
				expected_vd[63:48] 			= -1 * (vs2[63:48] 	* vs1[63:48]) 	+ vdd[63:48];
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			#20 current_instruction 		= "vnmsac.v* @ 8";
				execution_vector 			= vnmsac_8;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[7:0] 			= -1 * (vs2[7:0] 	* vs1[7:0]) 	+ vdd[7:0];
				expected_vd[15:8] 			= -1 * (vs2[15:8] 	* vs1[15:8]) 	+ vdd[15:8];
				expected_vd[23:16] 			= -1 * (vs2[23:16] 	* vs1[23:16]) 	+ vdd[23:16];
				expected_vd[31:24] 			= -1 * (vs2[31:24] 	* vs1[31:24]) 	+ vdd[31:24];
				expected_vd[39:32] 			= -1 * (vs2[39:32] 	* vs1[39:32]) 	+ vdd[39:32];
				expected_vd[47:40] 			= -1 * (vs2[47:40] 	* vs1[47:40]) 	+ vdd[47:40];
				expected_vd[55:48] 			= -1 * (vs2[55:48] 	* vs1[55:48]) 	+ vdd[55:48];
				expected_vd[63:56] 			= -1 * (vs2[63:56] 	* vs1[63:56]) 	+ vdd[63:56];
				expected_vdd_high 			= '0;
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			// vnmsub.v*
			#20 current_instruction 		= "vnmsub.v* @ 64";
				execution_vector 			= vnmsub_64;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd 				= -1 * (vs2 		* vdd) 			+ vs1;
				expected_vdd_high 			= '0;
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
				
			#20 current_instruction 		= "vnmsub.v* @ 32";
				execution_vector 			= vnmsub_32;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[31:0] 			= -1 * (vs2[31:0] 	* vdd[31:0]) 	+ vs1[31:0];
				expected_vd[63:32] 			= -1 * (vs2[63:32] 	* vdd[63:32]) 	+ vs1[63:32];
				expected_vdd_high 			= '0;
				
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
				
			#20 current_instruction 		= "vnmsub.v* @ 16";
				execution_vector 			= vnmsub_16;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[15:0] 			= -1 * (vs2[15:0] 	* vdd[15:0]) 	+ vs1[15:0];
				expected_vd[31:16] 			= -1 * (vs2[31:16] 	* vdd[31:16]) 	+ vs1[31:16];
				expected_vd[47:32] 			= -1 * (vs2[47:32] 	* vdd[47:32]) 	+ vs1[47:32];
				expected_vd[63:48] 			= -1 * (vs2[63:48] 	* vdd[63:48]) 	+ vs1[63:48];
				expected_vdd_high 			= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);
			
			#20 current_instruction 		= "vnmsub.v* @ 8";
				execution_vector 			= vnmsub_8;
				vs2 						= {$random, $random};
				vs1 						= {$random, $random};
				vdd 						= {$random, $random};
				
				expected_vd[7:0] 			= -1 * (vs2[7:0] 	* vdd[7:0]) 		+ vs1[7:0];
				expected_vd[15:8] 			= -1 * (vs2[15:8] 	* vdd[15:8]) 	+ vs1[15:8];
				expected_vd[23:16] 			= -1 * (vs2[23:16] 	* vdd[23:16]) 	+ vs1[23:16];
				expected_vd[31:24] 			= -1 * (vs2[31:24] 	* vdd[31:24]) 	+ vs1[31:24];
				expected_vd[39:32] 			= -1 * (vs2[39:32] 	* vdd[39:32]) 	+ vs1[39:32];
				expected_vd[47:40] 			= -1 * (vs2[47:40] 	* vdd[47:40]) 	+ vs1[47:40];
				expected_vd[55:48] 			= -1 * (vs2[55:48] 	* vdd[55:48]) 	+ vs1[55:48];
				expected_vd[63:56] 			= -1 * (vs2[63:56] 	* vdd[63:56]) 	+ vs1[63:56];
				expected_vdd_high 			= '0;	
				
				#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", current_instruction);
					
				else
					$display("Instruction '%s' Test: Failed", current_instruction);

//			#20 ;
//			
//				
//			// vwmaccu.v*
//			#20 current_instruction 				= "vwmaccu.v* @ 64";
//				execution_vector 					= vwmaccu_64;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete			= vs2 			* vs1 			+ {{64{1'b0}}, vdd};
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccu.v* @ 32";
//				execution_vector 					= vwmaccu_32;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				
//				expected_vdd_complete[63:0] 		= vs2[31:0] 	* vs1[31:0] 	+ {{32{1'b0}}, vdd[31:0]};
//				expected_vdd_complete[127:64] 	= vs2[63:32] 	* vs1[63:32] 	+ {{32{1'b0}}, vdd[63:32]};
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccu.v* @ 16";
//				execution_vector 					= vwmaccu_16;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete[31:0] 		= vs2[15:0] 	* vs1[15:0] 	+ {{16{1'b0}}, vdd[15:0]};
//				expected_vdd_complete[63:32] 	= vs2[31:16] 	* vs1[31:16] 	+ {{16{1'b0}}, vdd[31:16]};
//				expected_vdd_complete[95:64] 	= vs2[47:32] 	* vs1[47:32] 	+ {{16{1'b0}}, vdd[47:32]};
//				expected_vdd_complete[127:96] 	= vs2[63:48] 	* vs1[63:48] 	+ {{16{1'b0}}, vdd[63:48]};
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccu.v* @ 8";
//				execution_vector 					= vwmaccu_8;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete[15:0] 		= vs2[7:0] 		* vs1[7:0] 		+ {{8{1'b0}}, vdd[7:0]};
//				expected_vdd_complete[31:16] 	= vs2[15:8] 	* vs1[15:8] 	+ {{8{1'b0}}, vdd[15:8]};
//				expected_vdd_complete[47:32] 	= vs2[23:16] 	* vs1[23:16] 	+ {{8{1'b0}}, vdd[23:16]};
//				expected_vdd_complete[63:48] 	= vs2[31:24] 	* vs1[31:24] 	+ {{8{1'b0}}, vdd[31:24]};
//				expected_vdd_complete[79:64] 	= vs2[39:32] 	* vs1[39:32] 	+ {{8{1'b0}}, vdd[39:32]};
//				expected_vdd_complete[95:80] 	= vs2[47:40] 	* vs1[47:40] 	+ {{8{1'b0}}, vdd[47:40]};
//				expected_vdd_complete[111:96] 	= vs2[55:48] 	* vs1[55:48] 	+ {{8{1'b0}}, vdd[55:48]};
//				expected_vdd_complete[127:112] 	= vs2[63:56] 	* vs1[63:56] 	+ {{8{1'b0}}, vdd[63:56]};
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 ;
//			
//			// vwmacc.v*
//			#20 current_instruction 				= "vwmacc.v* @ 64";
//				execution_vector 					= vwmacc_64;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete			= $signed(vs2)			* $signed(vs1) 				+ $unsigned({{64{1'b0}}, vdd});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmacc.v* @ 32";
//				execution_vector 					= vwmacc_32;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				
//				expected_vdd_complete[63:0] 		= $signed(vs2[31:0]) 		* $signed(vs1[31:0]) 	+ $unsigned({{32{1'b0}}, vdd[31:0]});
//				expected_vdd_complete[127:64] 	= $signed(vs2[63:32]) 		* $signed(vs1[63:32]) 	+ $unsigned({{32{1'b0}}, vdd[63:32]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmacc.v* @ 16";
//				execution_vector 					= vwmacc_16;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete[31:0] 		= $signed(vs2[15:0]) 		* $signed(vs1[15:0]) 	+ $unsigned({{16{1'b0}}, vdd[15:0]});
//				expected_vdd_complete[63:32] 	= $signed(vs2[31:16]) 		* $signed(vs1[31:16]) 	+ $unsigned({{16{1'b0}}, vdd[31:16]});
//				expected_vdd_complete[95:64] 	= $signed(vs2[47:32]) 		* $signed(vs1[47:32]) 	+ $unsigned({{16{1'b0}}, vdd[47:32]});
//				expected_vdd_complete[127:96] 	= $signed(vs2[63:48]) 		* $signed(vs1[63:48]) 	+ $unsigned({{16{1'b0}}, vdd[63:48]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmacc.v* @ 8";
//				execution_vector 					= vwmacc_8;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete[15:0] 		= $signed(vs2[7:0]) 		* $signed(vs1[7:0]) 	+ $unsigned({{8{1'b0}}, vdd[7:0]});
//				expected_vdd_complete[31:16] 	= $signed(vs2[15:8]) 		* $signed(vs1[15:8]) 	+ $unsigned({{8{1'b0}}, vdd[15:8]});
//				expected_vdd_complete[47:32] 	= $signed(vs2[23:16]) 		* $signed(vs1[23:16]) 	+ $unsigned({{8{1'b0}}, vdd[23:16]});
//				expected_vdd_complete[63:48] 	= $signed(vs2[31:24]) 		* $signed(vs1[31:24]) 	+ $unsigned({{8{1'b0}}, vdd[31:24]});
//				expected_vdd_complete[79:64] 	= $signed(vs2[39:32]) 		* $signed(vs1[39:32]) 	+ $unsigned({{8{1'b0}}, vdd[39:32]});
//				expected_vdd_complete[95:80] 	= $signed(vs2[47:40]) 		* $signed(vs1[47:40]) 	+ $unsigned({{8{1'b0}}, vdd[47:40]});
//				expected_vdd_complete[111:96] 	= $signed(vs2[55:48]) 		* $signed(vs1[55:48]) 	+ $unsigned({{8{1'b0}}, vdd[55:48]});
//				expected_vdd_complete[127:112] 	= $signed(vs2[63:56]) 		* $signed(vs1[63:56]) 	+ $unsigned({{8{1'b0}}, vdd[63:56]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 ;
//			
//			// vwmaccsu.v*
//			#20 current_instruction 				= "vwmaccsu.v* @ 64";
//				execution_vector 					= vwmaccsu_64;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete			= $signed(vs2)			* $unsigned(vs1) 			+ $unsigned({{64{1'b0}}, vdd});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccsu.v* @ 32";
//				execution_vector 					= vwmaccsu_32;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				
//				expected_vdd_complete[63:0] 		= $signed(vs2[31:0]) 	* $unsigned(vs1[31:0]) 	+ $unsigned({{32{1'b0}}, vdd[31:0]});
//				expected_vdd_complete[127:64] 	= $signed(vs2[63:32]) 	* $unsigned(vs1[63:32]) + $unsigned({{32{1'b0}}, vdd[63:32]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccsu.v* @ 16";
//				execution_vector 					= vwmaccsu_16;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete[31:0] 		= $signed(vs2[15:0]) 	* $unsigned(vs1[15:0]) 	+ $unsigned({{16{1'b0}}, vdd[15:0]});
//				expected_vdd_complete[63:32] 	= $signed(vs2[31:16]) 	* $unsigned(vs1[31:16]) + $unsigned({{16{1'b0}}, vdd[31:16]});
//				expected_vdd_complete[95:64] 	= $signed(vs2[47:32]) 	* $unsigned(vs1[47:32]) + $unsigned({{16{1'b0}}, vdd[47:32]});
//				expected_vdd_complete[127:96] 	= $signed(vs2[63:48]) 	* $unsigned(vs1[63:48]) + $unsigned({{16{1'b0}}, vdd[63:48]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccsu.v* @ 8";
//				execution_vector 					= vwmaccsu_8;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete[15:0] 		= $signed(vs2[7:0]) 	* $unsigned(vs1[7:0]) 	+ $unsigned({{8{1'b0}}, vdd[7:0]});
//				expected_vdd_complete[31:16] 	= $signed(vs2[15:8]) 	* $unsigned(vs1[15:8]) 	+ $unsigned({{8{1'b0}}, vdd[15:8]});
//				expected_vdd_complete[47:32] 	= $signed(vs2[23:16]) 	* $unsigned(vs1[23:16]) + $unsigned({{8{1'b0}}, vdd[23:16]});
//				expected_vdd_complete[63:48] 	= $signed(vs2[31:24]) 	* $unsigned(vs1[31:24]) + $unsigned({{8{1'b0}}, vdd[31:24]});
//				expected_vdd_complete[79:64] 	= $signed(vs2[39:32]) 	* $unsigned(vs1[39:32]) + $unsigned({{8{1'b0}}, vdd[39:32]});
//				expected_vdd_complete[95:80] 	= $signed(vs2[47:40]) 	* $unsigned(vs1[47:40]) + $unsigned({{8{1'b0}}, vdd[47:40]});
//				expected_vdd_complete[111:96] 	= $signed(vs2[55:48]) 	* $unsigned(vs1[55:48]) + $unsigned({{8{1'b0}}, vdd[55:48]});
//				expected_vdd_complete[127:112] 	= $signed(vs2[63:56]) 	* $unsigned(vs1[63:56]) + $unsigned({{8{1'b0}}, vdd[63:56]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 ;
//			
//			// vwmaccus.v*
//			#20 current_instruction 				= "vwmaccus.v* @ 64";
//				execution_vector 					= vwmaccus_64;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete			= $unsigned(vs2)			* $signed(vs1) 			+ $unsigned({{64{1'b0}}, vdd});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccus.v* @ 32";
//				execution_vector 					= vwmaccus_32;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				
//				expected_vdd_complete[63:0] 		= $unsigned(vs2[31:0]) 		* $signed(vs1[31:0]) 	+ $unsigned({{32{1'b0}}, vdd[31:0]});
//				expected_vdd_complete[127:64] 	= $unsigned(vs2[63:32]) 	* $signed(vs1[63:32]) 	+ $unsigned({{32{1'b0}}, vdd[63:32]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccus.v* @ 16";
//				execution_vector 					= vwmaccus_16;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete[31:0] 		= $unsigned(vs2[15:0]) 		* $signed(vs1[15:0]) 	+ $unsigned({{16{1'b0}}, vdd[15:0]});
//				expected_vdd_complete[63:32] 	= $unsigned(vs2[31:16]) 	* $signed(vs1[31:16]) 	+ $unsigned({{16{1'b0}}, vdd[31:16]});
//				expected_vdd_complete[95:64] 	= $unsigned(vs2[47:32]) 	* $signed(vs1[47:32]) 	+ $unsigned({{16{1'b0}}, vdd[47:32]});
//				expected_vdd_complete[127:96] 	= $unsigned(vs2[63:48]) 	* $signed(vs1[63:48]) 	+ $unsigned({{16{1'b0}}, vdd[63:48]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
//				
//			#20 current_instruction 				= "vwmaccus.v* @ 8";
//				execution_vector 					= vwmaccus_8;
//				vs2 					= {$random, $random};
//				vs1 					= {$random, $random};
//				vdd 					= {$random, $random};
//				
//				expected_vdd_complete[15:0] 		= $unsigned(vs2[7:0]) 		* $signed(vs1[7:0]) 	+ $unsigned({{8{1'b0}}, vdd[7:0]});
//				expected_vdd_complete[31:16] 	= $unsigned(vs2[15:8]) 		* $signed(vs1[15:8]) 	+ $unsigned({{8{1'b0}}, vdd[15:8]});
//				expected_vdd_complete[47:32] 	= $unsigned(vs2[23:16]) 	* $signed(vs1[23:16]) 	+ $unsigned({{8{1'b0}}, vdd[23:16]});
//				expected_vdd_complete[63:48] 	= $unsigned(vs2[31:24]) 	* $signed(vs1[31:24]) 	+ $unsigned({{8{1'b0}}, vdd[31:24]});
//				expected_vdd_complete[79:64] 	= $unsigned(vs2[39:32]) 	* $signed(vs1[39:32]) 	+ $unsigned({{8{1'b0}}, vdd[39:32]});
//				expected_vdd_complete[95:80] 	= $unsigned(vs2[47:40]) 	* $signed(vs1[47:40]) 	+ $unsigned({{8{1'b0}}, vdd[47:40]});
//				expected_vdd_complete[111:96] 	= $unsigned(vs2[55:48]) 	* $signed(vs1[55:48]) 	+ $unsigned({{8{1'b0}}, vdd[55:48]});
//				expected_vdd_complete[127:112] 	= $unsigned(vs2[63:56]) 	* $signed(vs1[63:56]) 	+ $unsigned({{8{1'b0}}, vdd[63:56]});
//				
//				expected_vd 				= expected_vdd_complete[63:0];
//				expected_vdd_high 				= expected_vdd_complete[127:64];
				
			#20 ;
				
			#20 $stop;
		end
	
	vector_multiply_add_unit vector_multiply_add_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		.vdd 				(vdd),
		
		.vd 				(vd),
		.vd_high 			()
	
	);
	
endmodule 