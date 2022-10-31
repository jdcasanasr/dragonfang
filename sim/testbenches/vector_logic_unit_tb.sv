`timescale 1 ns / 1 ns
`include "C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_logic_unit_tb

import 	dragonfang_pkg			:: *,
		execution_vectors_pkg	:: *,
		riscv_v_pkg 			:: *;

();

	execution_vector_t 	execution_vector;
	logic [VLEN - 1:0] 	vs2;
	logic [VLEN - 1:0] 	vs1;
	logic [VLEN - 1:0] 	vd;
	
	logic [63:0]		expected_vd;
	string 				instruction;
	
	initial
		begin
			execution_vector 	= '0;
			vs2 				= '0;
			vs1 				= '0;
			
			expected_vd 		= '0;
			instruction			= "NULL";
		end
		
	always
		begin
			#20 instruction 		= "vand.v* @ all";
				execution_vector 	= vand_all;
				vs2 				= {$random, $random};
				vs1					= {$random, $random};
				
				expected_vd			= vs2 & vs1;
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 instruction			= "vor.v* @ all";
				execution_vector	= vor_all;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd			= vs2 | vs1;
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20	instruction			= "vxor.v* @ all";
				execution_vector	= vxor_all;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
				expected_vd			= vs2 ^ vs1;
				
			#10	if (expected_vd == vd)
					$display("Test: OK");
					
				else
					$display("Test: FAILED");
				
			#20 ;
			
			#20 $stop;
		end
	
	vector_logic_unit vector_logic_unit (.*);
	
endmodule 