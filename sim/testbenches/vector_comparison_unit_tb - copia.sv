`timescale 1 ns / 1 ns
`include "C:/Users/jdani/Documents/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_comparison_unit_tb
	
import 	dragonfang_pkg::*,
		execution_vectors_pkg::*;

();

	execution_vector_t 	execution_vector;
	
	logic [63:0] 		vs2;
	logic [63:0] 		vs1;
	logic [7:0] 		vd;
	
	string 				current_instruction;
	
	initial
		begin
			execution_vector 	= '0;
			vs2 				= '0;
			vs1					= '0;

			current_instruction = "NULL";
		end

	always
		begin
			// vmseq.v* @ 64
			#20 current_instruction 	= "vmseq.v* @ 64";
				execution_vector 		= vmseq_64;
				vs2 					= {$urandom, $urandom};
				vs1 					= {$urandom, $urandom};
			
			// vmseq.v* @ 32
			#20 current_instruction 	= "vmseq.v* @ 32";
				execution_vector 		= vmseq_32;
				vs2 					= {$urandom, $urandom};
				vs1 					= {$urandom, $urandom};
				
			// vmseq.v* @ 16
			#20 current_instruction 	= "vmseq.v* @ 16";
				execution_vector 		= vmseq_16;
				vs2 					= {$urandom, $urandom};
				vs1 					= {$urandom, $urandom};

			// vmseq.v* @ 8
			#20 current_instruction		= "vmseq.v* @ 8";
				execution_vector 		= vmseq_8;
				vs2 					= {$urandom, $urandom};
				vs1 					= {$urandom, $urandom};
				
			// vmsne.v* @ 64
			#20 current_instruction = "vmsne.v* @ 64";
				execution_vector 	= vmsne_64;
				vs2 				= {$urandom(5), $urandom(5)};
				vs1 				= {$urandom(5), $urandom(5)};
				
			// vmsne.v* @ 32
			#20 current_instruction = "vmsne.v* @ 32";
				execution_vector 	= vmsne_32;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsne.v* @ 16
			#20 current_instruction = "vmsne.v* @ 16";
				execution_vector 	= vmsne_16;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsne.v* @ 8
			#20 current_instruction	= "vmsne.v* @ 8";
				execution_vector 	= vmsne_8;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsltu.v* @ 64
			#20 current_instruction = "vmsltu.v* @ 64";
				execution_vector 	= vmsltu_64;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsltu.v* @ 32
			#20 current_instruction = "vmsltu.v* @ 32";
				execution_vector 	= vmsltu_32;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsltu.v* @ 16
			#20 current_instruction = "vmsltu.v* @ 16";
				execution_vector 	= vmsltu_16;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsltu.v* @ 8
			#20 current_instruction	= "vmsltu.v* @ 8";
				execution_vector 	= vmsltu_8;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
			
			// vmslt.v* @ 64
			#20 current_instruction = "vmslt.v* @ 64";
				execution_vector 	= vmslt_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmslt.v* @ 32
			#20 current_instruction = "vmslt.v* @ 32";
				execution_vector 	= vmslt_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmslt.v* @ 16
			#20 current_instruction = "vmslt.v* @ 16";
				execution_vector 	= vmslt_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmslt.v* @ 8
			#20 current_instruction	= "vmslt.v* @ 8";
				execution_vector 	= vmslt_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmsleu.v* @ 64
			#20 current_instruction = "vmsleu.v* @ 64";
				execution_vector 	= vmsleu_64;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsleu.v* @ 32
			#20 current_instruction = "vmsleu.v* @ 32";
				execution_vector 	= vmsleu_32;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};
			
			// vmsleu.v* @ 16
			#20 current_instruction = "vmsleu.v* @ 16";
				execution_vector 	= vmsleu_16;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsleu.v* @ 8
			#20 current_instruction	= "vmsleu.v* @ 8";
				execution_vector 	= vmsleu_8;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsle.v* @ 64
			#20 current_instruction = "vmsle.v* @ 64";
				execution_vector 	= vmsle_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmsle.v* @ 32
			#20 current_instruction = "vmsle.v* @ 32";
				execution_vector 	= vmsle_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmsle.v* @ 16
			#20 current_instruction = "vmsle.v* @ 16";
				execution_vector 	= vmsle_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmsle.v* @ 8
			#20 current_instruction	= "vmsle.v* @ 8";
				execution_vector 	= vmsle_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
	
			// vmsgtu.v* @ 64
			#20 current_instruction = "vmsgtu.v* @ 64";
				execution_vector 	= vmsgtu_64;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsgtu.v* @ 32
			#20 current_instruction = "vmsgtu.v* @ 32";
				execution_vector 	= vmsgtu_32;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsgtu.v* @ 16
			#20 current_instruction = "vmsgtu.v* @ 16";
				execution_vector 	= vmsgtu_16;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsgtu.v* @ 8
			#20 current_instruction	= "vmsgtu.v* @ 8";
				execution_vector 	= vmsgtu_8;
				vs2 				= {$urandom, $urandom};
				vs1 				= {$urandom, $urandom};

			// vmsgt.v* @ 64
			#20 current_instruction = "vmsgt.v* @ 64";
				execution_vector 	= vmsgt_64;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmsgt.v* @ 32
			#20 current_instruction = "vmsgt.v* @ 32";
				execution_vector 	= vmsgt_32;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmsgt.v* @ 16
			#20 current_instruction = "vmsgt.v* @ 16";
				execution_vector 	= vmsgt_16;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};

			// vmsgt.v* @ 8
			#20 current_instruction	= "vmsgt.v* @ 8";
				execution_vector 	= vmsgt_8;
				vs2 				= {$random, $random};
				vs1 				= {$random, $random};
				
			#20 ;
			
			#20 $stop;
		end
		
	vector_comparison_unit vector_comparison_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		.vs1 				(vs1),
		
		.vd 				(vd)
	);

endmodule 