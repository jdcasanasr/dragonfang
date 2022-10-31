`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_extension_unit_tb

import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;
		
();

	execution_vector_t 	execution_vector;
	
	logic [63:0] 		vs2;
	
	logic [63:0] 		vd;
	logic [63:0] 		vd_high;
	logic [383:0] 		vd_extra;

	logic [63:0] 		expected_vd;
	logic [63:0] 		expected_vd_high;
	logic [383:0] 		expected_vd_extra;
	
	string 				instruction;
	logic [511:0]		expected_vd_all;
	
	assign expected_vd 		= expected_vd_all[63:0];
	assign expected_vd_high 	= expected_vd_all[127:64];
	assign expected_vd_extra 	= expected_vd_all[511:128];
	
	initial
		begin
			instruction 		= "NULL";
			execution_vector 	= '0;
			
			vs2 				= '0;
			
			expected_vd_all 	= '0;
		end

	always
		begin	
			// vsext.vf2
			#20 instruction 				= "vsext.vf2 @ SEW = 32";
			
				execution_vector 			= vsext_vf2_32;
				
				vs2							= {$random, $random};
				
				expected_vd_all[63:0] 		= {{32{vs2[31]}}, vs2[31:0]};
				expected_vd_all[127:64] 	= {{32{vs2[63]}}, vs2[63:32]};
				expected_vd_all[511:128] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
			
			#20 instruction 				= "vsext.vf2 @ SEW = 16";
			
				execution_vector 			= vsext_vf2_16;
				
				vs2							= {$random, $random};
				
				expected_vd_all[31:0] 		= {{16{vs2[15]}}, vs2[15:0]};
				expected_vd_all[63:32] 		= {{16{vs2[31]}}, vs2[31:16]};
				expected_vd_all[95:64] 		= {{16{vs2[47]}}, vs2[47:32]};
				expected_vd_all[127:96] 	= {{16{vs2[63]}}, vs2[63:48]};
				expected_vd_all[511:128] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			#20 instruction 				= "vsext.vf2 @ SEW = 8";
			
				execution_vector 			= vsext_vf2_8;
				
				vs2							= {$random, $random};
				
				expected_vd_all[15:0] 		= {{8{vs2[7]}}, vs2[7:0]};
				expected_vd_all[31:16] 		= {{8{vs2[15]}}, vs2[15:8]};
				expected_vd_all[47:32] 		= {{8{vs2[23]}}, vs2[23:16]};
				expected_vd_all[63:48] 		= {{8{vs2[31]}}, vs2[31:24]};
				expected_vd_all[79:64] 		= {{8{vs2[39]}}, vs2[39:32]};
				expected_vd_all[95:80] 		= {{8{vs2[47]}}, vs2[47:40]};
				expected_vd_all[111:96] 	= {{8{vs2[55]}}, vs2[55:48]};
				expected_vd_all[127:112] 	= {{8{vs2[63]}}, vs2[63:56]};
				expected_vd_all[511:128] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vsext.vf4
			#20 instruction 				= "vsext.vf4 @ SEW = 16";
			
				execution_vector 			= vsext_vf4_16;
				
				vs2							= {$random, $random};
				
				expected_vd_all[63:0] 		= {{48{vs2[15]}}, vs2[15:0]};
				expected_vd_all[127:64] 	= {{48{vs2[31]}}, vs2[31:16]};
				expected_vd_all[191:128] 	= {{48{vs2[47]}}, vs2[47:32]};
				expected_vd_all[255:192] 	= {{48{vs2[63]}}, vs2[63:48]};
				expected_vd_all[511:256] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			#20 instruction 				= "vsext.vf4 @ SEW = 8";
			
				execution_vector 			= vsext_vf4_8;
				
				vs2							= {$random, $random};
				
				expected_vd_all[31:0] 		= {{24{vs2[7]}}, vs2[7:0]};
				expected_vd_all[63:32] 		= {{24{vs2[15]}}, vs2[15:8]};
				expected_vd_all[95:64] 		= {{24{vs2[23]}}, vs2[23:16]};
				expected_vd_all[127:96] 	= {{24{vs2[31]}}, vs2[31:24]};
				expected_vd_all[159:128] 	= {{24{vs2[39]}}, vs2[39:32]};
				expected_vd_all[191:160] 	= {{24{vs2[47]}}, vs2[47:40]};
				expected_vd_all[223:192] 	= {{24{vs2[55]}}, vs2[55:48]};
				expected_vd_all[255:224] 	= {{24{vs2[63]}}, vs2[63:56]};
				expected_vd_all[511:256] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vsext.vf8
			#20 instruction 				= "vsext.vf8 @ SEW = 8";
			
				execution_vector 			= vsext_vf8_8;
				
				vs2							= {$random, $random};
				
				expected_vd_all[63:0] 		= {{56{vs2[7]}}, vs2[7:0]};
				expected_vd_all[127:64] 	= {{56{vs2[15]}}, vs2[15:8]};
				expected_vd_all[191:128] 	= {{56{vs2[23]}}, vs2[23:16]};
				expected_vd_all[255:192] 	= {{56{vs2[31]}}, vs2[31:24]};
				expected_vd_all[319:256] 	= {{56{vs2[39]}}, vs2[39:32]};
				expected_vd_all[383:320] 	= {{56{vs2[47]}}, vs2[47:40]};
				expected_vd_all[447:384] 	= {{56{vs2[55]}}, vs2[55:48]};
				expected_vd_all[511:448] 	= {{56{vs2[63]}}, vs2[63:56]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vzext.vf2
			#20 instruction 				= "vzext.vf2 @ SEW = 32";
			
				execution_vector 			= vzext_vf2_32;
				
				vs2							= {$random, $random};
				
				expected_vd_all[63:0] 		= {{32{1'b0}}, vs2[31:0]};
				expected_vd_all[127:64] 	= {{32{1'b0}}, vs2[63:32]};
				expected_vd_all[511:128] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			#20 instruction 				= "vzext.vf2 @ SEW = 16";
			
				execution_vector 			= vzext_vf2_16;
				
				vs2							= {$random, $random};
				
				expected_vd_all[31:0] 		= {{16{1'b0}}, vs2[15:0]};
				expected_vd_all[63:32] 		= {{16{1'b0}}, vs2[31:16]};
				expected_vd_all[95:64] 		= {{16{1'b0}}, vs2[47:32]};
				expected_vd_all[127:96] 	= {{16{1'b0}}, vs2[63:48]};
				expected_vd_all[511:128] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			#20 instruction 				= "vzext.vf2 @ SEW = 8";
			
				execution_vector 			= vzext_vf2_8;
				
				vs2							= {$random, $random};
				
				expected_vd_all[15:0] 		= {{8{1'b0}}, vs2[7:0]};
				expected_vd_all[31:16] 		= {{8{1'b0}}, vs2[15:8]};
				expected_vd_all[47:32] 		= {{8{1'b0}}, vs2[23:16]};
				expected_vd_all[63:48] 		= {{8{1'b0}}, vs2[31:24]};
				expected_vd_all[79:64] 		= {{8{1'b0}}, vs2[39:32]};
				expected_vd_all[95:80] 		= {{8{1'b0}}, vs2[47:40]};
				expected_vd_all[111:96] 	= {{8{1'b0}}, vs2[55:48]};
				expected_vd_all[127:112] 	= {{8{1'b0}}, vs2[63:56]};
				expected_vd_all[511:128] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vsext.vf4
			#20 instruction 				= "vzext.vf4 @ SEW = 16";
			
				execution_vector 			= vzext_vf4_16;
				
				vs2							= {$random, $random};
				
				expected_vd_all[63:0] 		= {{48{1'b0}}, vs2[15:0]};
				expected_vd_all[127:64] 	= {{48{1'b0}}, vs2[31:16]};
				expected_vd_all[191:128] 	= {{48{1'b0}}, vs2[47:32]};
				expected_vd_all[255:192] 	= {{48{1'b0}}, vs2[63:48]};
				expected_vd_all[511:256] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			#20 instruction 				= "vzext.vf4 @ SEW = 8";
			
				execution_vector 			= vzext_vf4_8;
				
				vs2							= {$random, $random};
				
				expected_vd_all[31:0] 		= {{24{1'b0}}, vs2[7:0]};
				expected_vd_all[63:32] 		= {{24{1'b0}}, vs2[15:8]};
				expected_vd_all[95:64] 		= {{24{1'b0}}, vs2[23:16]};
				expected_vd_all[127:96] 	= {{24{1'b0}}, vs2[31:24]};
				expected_vd_all[159:128] 	= {{24{1'b0}}, vs2[39:32]};
				expected_vd_all[191:160] 	= {{24{1'b0}}, vs2[47:40]};
				expected_vd_all[223:192] 	= {{24{1'b0}}, vs2[55:48]};
				expected_vd_all[255:224] 	= {{24{1'b0}}, vs2[63:56]};
				expected_vd_all[511:256] 	= '0;
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			// vsext.vf8
			#20 instruction 				= "vzext.vf8 @ SEW = 8";
			
				execution_vector 			= vzext_vf8_8;
				
				vs2							= {$random, $random};
				
				expected_vd_all[63:0] 		= {{56{1'b0}}, vs2[7:0]};
				expected_vd_all[127:64] 	= {{56{1'b0}}, vs2[15:8]};
				expected_vd_all[191:128] 	= {{56{1'b0}}, vs2[23:16]};
				expected_vd_all[255:192] 	= {{56{1'b0}}, vs2[31:24]};
				expected_vd_all[319:256] 	= {{56{1'b0}}, vs2[39:32]};
				expected_vd_all[383:320] 	= {{56{1'b0}}, vs2[47:40]};
				expected_vd_all[447:384] 	= {{56{1'b0}}, vs2[55:48]};
				expected_vd_all[511:448] 	= {{56{1'b0}}, vs2[63:56]};
			
			#10 if (expected_vd == vd)
					$display("Instruction '%s' Test: OK", instruction);
					
				else
					$display("Instruction '%s' Test: Failed", instruction);
		
			#20 ;
			
			#20 $stop;
		end
	
	vector_extension_unit vector_extension_unit_0
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		
		.vd 				(vd),
		.vd_high 			(),
		.vd_extra 			()
	);
	
endmodule 