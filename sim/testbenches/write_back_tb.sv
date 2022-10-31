`timescale 1 ns / 1 ns

module write_back_tb 

	import dragonfang_pkg :: *;

();

	write_back_vector_t write_back_vector;
	
	data_packet_t 		v0;
	data_packet_t 		vd_old;
	data_packet_t		vd_new;
	
	data_packet_t 		vd_write_back;

	initial
		begin
			write_back_vector 	= '0;
			
			v0 					= '0;
			vd_old 				= '0;
			vd_new 				= '0;
		end
	
	always
		begin 
			// vma - vta : 00 OK!
			// vma - vta : 01 OK!
			// vma - vta : 10 OK!
			// vma - vta : 11 OK!
			#20 write_back_vector.bit_mode 	= ENABLED_64BIT_MODE;
				write_back_vector.vm 		= '1;
				write_back_vector.vma 		= '1;
				write_back_vector.vta 		= '1;
			
				v0.tag						= $random;
				v0.data						= {$random, $random};
				
				vd_old.tag 					= $random;
				vd_old.data 				= {$random, $random};
				
				vd_new.tag 					= $random;
				vd_new.data 				= {$random, $random};
				
			#20 write_back_vector.bit_mode 	= ENABLED_32BIT_MODE;
				write_back_vector.vm 		= '1;
				write_back_vector.vma 		= '1;
				write_back_vector.vta 		= '1;
			
				v0.tag						= $random;
				v0.data						= {$random, $random};
				
				vd_old.tag 					= $random;
				vd_old.data 				= {$random, $random};
				
				vd_new.tag 					= $random;
				vd_new.data 				= {$random, $random};
				
			#20 write_back_vector.bit_mode 	= ENABLED_16BIT_MODE;
				write_back_vector.vm 		= '1;
				write_back_vector.vma 		= '1;
				write_back_vector.vta 		= '1;
			
				v0.tag						= $random;
				v0.data						= {$random, $random};
				
				vd_old.tag 					= $random;
				vd_old.data 				= {$random, $random};
				
				vd_new.tag 					= $random;
				vd_new.data 				= {$random, $random};
				
			#20 write_back_vector.bit_mode 	= ENABLED_8BIT_MODE;
				write_back_vector.vm 		= '1;
				write_back_vector.vma 		= '1;
				write_back_vector.vta 		= '1;
			
				v0.tag						= $random;
				v0.data						= {$random, $random};
				
				vd_old.tag 					= $random;
				vd_old.data 				= {$random, $random};
				
				vd_new.tag 					= $random;
				vd_new.data 				= {$random, $random};
				
			#20 ;
			#20 $stop;
		end
	
	write_back write_back (.*);

endmodule 