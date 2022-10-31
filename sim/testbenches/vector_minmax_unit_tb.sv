`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_minmax_unit_tb

import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;
		
();

	execution_vector_t 	execution_vector;
	logic [63:0] 		vs2;
	logic [63:0] 		vs1;
	
	logic [63:0] 		vd;
	
	string 				instruction;
	logic [63:0] 		expected_vd;

	initial
		begin
			instruction 		= "NULL";

			execution_vector 	= '0;
			
			vs2 				= '0;
			vs1 				= '0;
		end

	always
		begin
			// vmin.v*
			#20 instruction 			= "vmin.v* @ SEW = 64";
				
				execution_vector 		= vmin_64;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd				= ($signed(vs2) < $signed(vs1) ? vs2 : vs1);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmin.v* @ SEW = 32";
				
				execution_vector 		= vmin_32;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[31:0] 		= ($signed(vs2[31:0]) < $signed(vs1[31:0]) ? vs2[31:0] : vs1[31:0]);
				expected_vd[63:32] 		= ($signed(vs2[63:32]) < $signed(vs1[63:32]) ? vs2[63:32] : vs1[63:32]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmin.v* @ SEW = 16";
				
				execution_vector 		= vmin_16;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[15:0] 		= ($signed(vs2[15:0]) < $signed(vs1[15:0]) ? vs2[15:0] : vs1[15:0]);
				expected_vd[31:16] 		= ($signed(vs2[31:16]) < $signed(vs1[31:16]) ? vs2[31:16] : vs1[31:16]);
				expected_vd[47:32] 		= ($signed(vs2[47:32]) < $signed(vs1[47:32]) ? vs2[47:32] : vs1[47:32]);
				expected_vd[63:48] 		= ($signed(vs2[63:48]) < $signed(vs1[63:48]) ? vs2[63:48] : vs1[63:48]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmin.v* @ SEW = 8";
				
				execution_vector 		= vmin_8;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[7:0] 		= ($signed(vs2[7:0]) < $signed(vs1[7:0]) ? vs2[7:0] : vs1[7:0]);
				expected_vd[15:8] 		= ($signed(vs2[15:8]) < $signed(vs1[15:8]) ? vs2[15:8] : vs1[15:8]);
				expected_vd[23:16] 		= ($signed(vs2[23:16]) < $signed(vs1[23:16]) ? vs2[23:16] : vs1[23:16]);
				expected_vd[31:24] 		= ($signed(vs2[31:24]) < $signed(vs1[31:24]) ? vs2[31:24] : vs1[31:24]);
				expected_vd[39:32] 		= ($signed(vs2[39:32]) < $signed(vs1[39:32]) ? vs2[39:32] : vs1[39:32]);
				expected_vd[47:40] 		= ($signed(vs2[47:40]) < $signed(vs1[47:40]) ? vs2[47:40] : vs1[47:40]);
				expected_vd[55:48] 		= ($signed(vs2[55:48]) < $signed(vs1[55:48]) ? vs2[55:48] : vs1[55:48]);
				expected_vd[63:56] 		= ($signed(vs2[63:56]) < $signed(vs1[63:56]) ? vs2[63:56] : vs1[63:56]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
			
			// vminu.v*
			#20 instruction 			= "vminu.v* @ SEW = 64";
				
				execution_vector 		= vminu_64;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd				= ($unsigned(vs2) < $unsigned(vs1) ? vs2 : vs1);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vminu.v* @ SEW = 32";
				
				execution_vector 		= vminu_32;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[31:0] 		= ($unsigned(vs2[31:0]) < $unsigned(vs1[31:0]) ? vs2[31:0] : vs1[31:0]);
				expected_vd[63:32] 		= ($unsigned(vs2[63:32]) < $unsigned(vs1[63:32]) ? vs2[63:32] : vs1[63:32]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vminu.v* @ SEW = 16";
				
				execution_vector 		= vminu_16;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[15:0] 		= ($unsigned(vs2[15:0]) < $unsigned(vs1[15:0]) ? vs2[15:0] : vs1[15:0]);
				expected_vd[31:16] 		= ($unsigned(vs2[31:16]) < $unsigned(vs1[31:16]) ? vs2[31:16] : vs1[31:16]);
				expected_vd[47:32] 		= ($unsigned(vs2[47:32]) < $unsigned(vs1[47:32]) ? vs2[47:32] : vs1[47:32]);
				expected_vd[63:48] 		= ($unsigned(vs2[63:48]) < $unsigned(vs1[63:48]) ? vs2[63:48] : vs1[63:48]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vminu.v* @ SEW = 8";
				
				execution_vector 		= vminu_8;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[7:0] 		= ($unsigned(vs2[7:0]) < $unsigned(vs1[7:0]) ? vs2[7:0] : vs1[7:0]);
				expected_vd[15:8] 		= ($unsigned(vs2[15:8]) < $unsigned(vs1[15:8]) ? vs2[15:8] : vs1[15:8]);
				expected_vd[23:16] 		= ($unsigned(vs2[23:16]) < $unsigned(vs1[23:16]) ? vs2[23:16] : vs1[23:16]);
				expected_vd[31:24] 		= ($unsigned(vs2[31:24]) < $unsigned(vs1[31:24]) ? vs2[31:24] : vs1[31:24]);
				expected_vd[39:32] 		= ($unsigned(vs2[39:32]) < $unsigned(vs1[39:32]) ? vs2[39:32] : vs1[39:32]);
				expected_vd[47:40] 		= ($unsigned(vs2[47:40]) < $unsigned(vs1[47:40]) ? vs2[47:40] : vs1[47:40]);
				expected_vd[55:48] 		= ($unsigned(vs2[55:48]) < $unsigned(vs1[55:48]) ? vs2[55:48] : vs1[55:48]);
				expected_vd[63:56] 		= ($unsigned(vs2[63:56]) < $unsigned(vs1[63:56]) ? vs2[63:56] : vs1[63:56]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
			
			// vmax.v*
			#20 instruction 			= "vmax.v* @ SEW = 64";
				
				execution_vector 		= vmax_64;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd				= ($signed(vs2) > $signed(vs1) ? vs2 : vs1);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmax.v* @ SEW = 32";
				
				execution_vector 		= vmax_32;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[31:0] 		= ($signed(vs2[31:0]) > $signed(vs1[31:0]) ? vs2[31:0] : vs1[31:0]);
				expected_vd[63:32] 		= ($signed(vs2[63:32]) > $signed(vs1[63:32]) ? vs2[63:32] : vs1[63:32]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmax.v* @ SEW = 16";
				
				execution_vector 		= vmax_16;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[15:0] 		= ($signed(vs2[15:0]) > $signed(vs1[15:0]) ? vs2[15:0] : vs1[15:0]);
				expected_vd[31:16] 		= ($signed(vs2[31:16]) > $signed(vs1[31:16]) ? vs2[31:16] : vs1[31:16]);
				expected_vd[47:32] 		= ($signed(vs2[47:32]) > $signed(vs1[47:32]) ? vs2[47:32] : vs1[47:32]);
				expected_vd[63:48] 		= ($signed(vs2[63:48]) > $signed(vs1[63:48]) ? vs2[63:48] : vs1[63:48]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmax.v* @ SEW = 8";
				
				execution_vector 		= vmax_8;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[7:0] 		= ($signed(vs2[7:0]) > $signed(vs1[7:0]) ? vs2[7:0] : vs1[7:0]);
				expected_vd[15:8] 		= ($signed(vs2[15:8]) > $signed(vs1[15:8]) ? vs2[15:8] : vs1[15:8]);
				expected_vd[23:16] 		= ($signed(vs2[23:16]) > $signed(vs1[23:16]) ? vs2[23:16] : vs1[23:16]);
				expected_vd[31:24] 		= ($signed(vs2[31:24]) > $signed(vs1[31:24]) ? vs2[31:24] : vs1[31:24]);
				expected_vd[39:32] 		= ($signed(vs2[39:32]) > $signed(vs1[39:32]) ? vs2[39:32] : vs1[39:32]);
				expected_vd[47:40] 		= ($signed(vs2[47:40]) > $signed(vs1[47:40]) ? vs2[47:40] : vs1[47:40]);
				expected_vd[55:48] 		= ($signed(vs2[55:48]) > $signed(vs1[55:48]) ? vs2[55:48] : vs1[55:48]);
				expected_vd[63:56] 		= ($signed(vs2[63:56]) > $signed(vs1[63:56]) ? vs2[63:56] : vs1[63:56]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			// vmaxu.v*
			#20 instruction 			= "vmaxu.v* @ SEW = 64";
				
				execution_vector 		= vmaxu_64;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd				= ($unsigned(vs2) > $unsigned(vs1) ? vs2 : vs1);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmaxu.v* @ SEW = 32";
				
				execution_vector 		= vmaxu_32;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[31:0] 		= ($unsigned(vs2[31:0]) > $unsigned(vs1[31:0]) ? vs2[31:0] : vs1[31:0]);
				expected_vd[63:32] 		= ($unsigned(vs2[63:32]) > $unsigned(vs1[63:32]) ? vs2[63:32] : vs1[63:32]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmaxu.v* @ SEW = 16";
				
				execution_vector 		= vmaxu_16;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[15:0] 		= ($unsigned(vs2[15:0]) > $unsigned(vs1[15:0]) ? vs2[15:0] : vs1[15:0]);
				expected_vd[31:16] 		= ($unsigned(vs2[31:16]) > $unsigned(vs1[31:16]) ? vs2[31:16] : vs1[31:16]);
				expected_vd[47:32] 		= ($unsigned(vs2[47:32]) > $unsigned(vs1[47:32]) ? vs2[47:32] : vs1[47:32]);
				expected_vd[63:48] 		= ($unsigned(vs2[63:48]) > $unsigned(vs1[63:48]) ? vs2[63:48] : vs1[63:48]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction 			= "vmaxu.v* @ SEW = 8";
				
				execution_vector 		= vmaxu_8;
			
				vs2						= {$random, $random};
				vs1						= {$random, $random};
				
				expected_vd[7:0] 		= ($unsigned(vs2[7:0]) > $unsigned(vs1[7:0]) ? vs2[7:0] : vs1[7:0]);
				expected_vd[15:8] 		= ($unsigned(vs2[15:8]) > $unsigned(vs1[15:8]) ? vs2[15:8] : vs1[15:8]);
				expected_vd[23:16] 		= ($unsigned(vs2[23:16]) > $unsigned(vs1[23:16]) ? vs2[23:16] : vs1[23:16]);
				expected_vd[31:24] 		= ($unsigned(vs2[31:24]) > $unsigned(vs1[31:24]) ? vs2[31:24] : vs1[31:24]);
				expected_vd[39:32] 		= ($unsigned(vs2[39:32]) > $unsigned(vs1[39:32]) ? vs2[39:32] : vs1[39:32]);
				expected_vd[47:40] 		= ($unsigned(vs2[47:40]) > $unsigned(vs1[47:40]) ? vs2[47:40] : vs1[47:40]);
				expected_vd[55:48] 		= ($unsigned(vs2[55:48]) > $unsigned(vs1[55:48]) ? vs2[55:48] : vs1[55:48]);
				expected_vd[63:56] 		= ($unsigned(vs2[63:56]) > $unsigned(vs1[63:56]) ? vs2[63:56] : vs1[63:56]);
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
		
			#20 ;
			
			#20 $stop;
		end
	
	vector_minmax_unit vector_minmax_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		
		.vd 				(vd)
	);
	
endmodule 