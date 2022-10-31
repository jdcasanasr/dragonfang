`timescale 1 ns / 1 ns

module vector_write_back_tb 

import 	dragonfang_pkg 	:: *,
		riscv_v_pkg 	:: *;

();

	localparam SIMULATION_CYCLES = 2500;
	
	// Inputs.
	logic 				clock;
	logic 				reset_n;
	write_back_vector_t write_back_vector;
	data_packet_t 		v0;
	data_packet_t 		vd_old;
	data_packet_t 		vd_new;
	
	// Outputs.
	data_packet_t 		vd_write_back;
	
	initial
		begin
			clock 				= '1;
			reset_n  			= '1;
			write_back_vector 	= '0;
			v0 					= '0;
			vd_old				= '0;
			vd_new				= '0;
		end
		
	always
		#20 clock = ~clock;
		
	always
		begin
			#5 	reset_n = '0;
			#5 	reset_n = '1;
			
			#10 write_back_vector.bit_mode 	= ENABLED_8BIT_MODE;
				write_back_vector.vm 		= $random;
				write_back_vector.vma 		= $random;
				write_back_vector.vta 		= $random;
				
				v0.tag 						= $random;
				v0.data 					= {$random, $random};
				
				vd_old.tag 					= $random;
				vd_old.data 				= {$random, $random};
				
				vd_new.tag 					= $random;
				vd_new.data 				= {$random, $random};
			
			for (int i = 0; i < SIMULATION_CYCLES; i++)
				begin
					#20 write_back_vector.bit_mode	= ENABLED_8BIT_MODE;
						write_back_vector.vm 		= $random;
						write_back_vector.vma 		= $random;
						write_back_vector.vta 		= $random;
				
						v0.tag 						= $random;
						v0.data 					= {$random, $random};
						
						vd_old.tag 					= $random;
						vd_old.data 				= {$random, $random};
						
						vd_new.tag 					= $random;
						vd_new.data 				= {$random, $random};
						
					#20 write_back_vector.bit_mode	= ENABLED_16BIT_MODE;
						write_back_vector.vm 		= $random;
						write_back_vector.vma 		= $random;
						write_back_vector.vta 		= $random;
				
						v0.tag 						= $random;
						v0.data 					= {$random, $random};
						
						vd_old.tag 					= $random;
						vd_old.data 				= {$random, $random};
						
						vd_new.tag 					= $random;
						vd_new.data 				= {$random, $random};
						
					#20 write_back_vector.bit_mode	= ENABLED_32BIT_MODE;
						write_back_vector.vm 		= $random;
						write_back_vector.vma 		= $random;
						write_back_vector.vta 		= $random;
				
						v0.tag 						= $random;
						v0.data 					= {$random, $random};
						
						vd_old.tag 					= $random;
						vd_old.data 				= {$random, $random};
						
						vd_new.tag 					= $random;
						vd_new.data 				= {$random, $random};
						
					#20 write_back_vector.bit_mode	= ENABLED_64BIT_MODE;
						write_back_vector.vm 		= $random;
						write_back_vector.vma 		= $random;
						write_back_vector.vta 		= $random;
				
						v0.tag 						= $random;
						v0.data 					= {$random, $random};
						
						vd_old.tag 					= $random;
						vd_old.data 				= {$random, $random};
						
						vd_new.tag 					= $random;
						vd_new.data 				= {$random, $random};
				end
			
			#20 ;
			#20 $stop;
		end
	
	// Instances.
	vector_write_back vector_write_back (.*);
	
endmodule 