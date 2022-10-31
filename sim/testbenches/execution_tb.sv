`timescale 1 ns / 1 ns
`include "D:/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module execution_tb 

import 	dragonfang_pkg 			:: *,
		riscv_v_pkg 			:: *,
		execution_vectors_pkg 	:: *;

();

	// Inputs.
	logic 											clock;
	logic 											reset_n;
	execution_vector_t 								execution_vector;

	logic [$clog2(NUMBER_FUNCTIONAL_UNITS) - 1:0]	functional_unit_tag;
	logic [$clog2(NUMBER_PHYSICAL_REGISTERS) - 1:0] destination_vrg_tag;
	operand_data_packet_t 							vrg_input_data;
	
	// Outputs.
	data_packet_t 									vrg_output_data;
	
	logic [63:0] expected_vrg_output_data;
	
	initial
		begin
			clock 				= '1;
			reset_n 			= '1;
			execution_vector 	= '0;
			
			functional_unit_tag = '0;
			destination_vrg_tag = '0;
			vrg_input_data		= '0;
		end
	
	always
		#10 clock = ~clock;
		
	always
		begin
			#5 	reset_n = '0;
			#5 	reset_n = '1;
			
			#10 execution_vector 		= vor_all;
				
				functional_unit_tag 	= '0; 
				destination_vrg_tag 	= 5'd23;
				
				vrg_input_data.vs2.tag 	= 5'd10;
				vrg_input_data.vs2.data = 64'hbd9f_4ca5_0882_21d2;
				
				vrg_input_data.vs1.tag 	= 5'd7;
				vrg_input_data.vs1.data = 64'h763b_e6b0_5314_3df7;
				
			#20 execution_vector 		= vor_all;
				
				functional_unit_tag 	= '1; 
				destination_vrg_tag 	= 5'd17;
				
				vrg_input_data.vs2.tag 	= 5'd23;
				vrg_input_data.vs2.data = 64'h6c1c_9455_f382_1c99;
				
				vrg_input_data.vs1.tag 	= 5'd28;
				vrg_input_data.vs1.data = 64'h950e_3d91_9f9c_49ab;
				
			#60 expected_vrg_output_data = (64'hbd9f_4ca5_0882_21d2 | 64'h763b_e6b0_5314_3df7);
			
			#20 expected_vrg_output_data =  (64'hbd9f_4ca5_0882_21d2 | 64'h763b_e6b0_5314_3df7) | 64'h950e_3d91_9f9c_49ab;
				
			#20 ;
			
			#20 $stop;
		end
	
	execution execution_0 (.*);
	
endmodule 