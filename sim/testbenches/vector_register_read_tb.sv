`timescale 1 ns / 1 ns

module vector_register_read_tb 

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

();
	localparam SIMULATION_CYCLES = 10000;

	// Inputs.
	logic						clock;
	logic						reset_n;
	register_read_vector_t 		register_read_vector;
	
	data_packet_t 				write_back_packet;
	
	logic [TAG_LENGTH - 1:0]	v0_address;
	logic [TAG_LENGTH - 1:0]	vs1_address;
	logic [TAG_LENGTH - 1:0]	vs2_address;
	logic [TAG_LENGTH - 1:0] 	vd_address;

	// Outputs.
	data_packet_t 				v0_packet;
	data_packet_t 				vs1_packet;
	data_packet_t 				vs2_packet;
	data_packet_t 				vd_packet;

	initial
		begin
			clock 					= '1;
			reset_n 				= '1;
			register_read_vector 	= '0;
			
			write_back_packet 		= '0;
			
			v0_address 				= '0;
			vs1_address 			= '0;
			vs2_address 			= '0;
			vd_address 				= '0;
		end
		
	always
		#20 clock = ~clock;
	
	always
		begin
			#5 	reset_n = '0;
			#5 	reset_n = '1;
			
			#10 register_read_vector.read_request 		= $random;
				register_read_vector.write_back_request = $random;
				
				write_back_packet.tag 					= $random;
				write_back_packet.data 					= {$random, $random};
				
				v0_address								= $random;
				vs1_address								= $random;
				vs2_address								= $random;
				vd_address								= $random;
			
			for (int i = 0; i < SIMULATION_CYCLES; i++)
				begin
					#20 register_read_vector.read_request 		= $random;
						register_read_vector.write_back_request = $random;
						
						write_back_packet.tag 					= $random;
						write_back_packet.data 					= {$random, $random};
						
						v0_address								= $random;
						vs1_address								= $random;
						vs2_address								= $random;
						vd_address								= $random;
				end
			
			#20 ;
			#20 $stop;
		end
	
	
	vector_register_read vector_register_read (.*);
	
endmodule 