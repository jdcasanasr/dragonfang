`timescale 1 ns / 1 ns
`include "E:/Thesis/dragonfang_v3/src/packages/execution_vectors_pkg.sv"

module vector_conversion_unit_tb

import 	dragonfang_pkg 					:: *,
		dragonfang_floating_point_pkg 	:: *,
		riscv_v_pkg 					:: *,
		execution_vectors_pkg 			:: *;

();

	execution_vector_t 	execution_vector;
	logic [VLEN - 1:0] 	vs2;
	logic [VLEN - 1:0] 	vd;
	string 				instruction;

	initial
		begin
			instruction 		= "NULL";
		
			execution_vector 	= '0;
			vs2 				= '0;
		end
	
	always
		begin
			#20 instruction 		= "vfcvt.xu.f.v";
				execution_vector 	= vfcvt_xu_f_v;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfcvt.x.f.v";
				execution_vector 	= vfcvt_x_f_v;
				vs2 				= {$random, $random};
		
			#20 instruction 		= "vfcvt.f.xu.v";
				execution_vector 	= vfcvt_f_xu_v;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfcvt.f.x.v";
				execution_vector 	= vfcvt_f_x_v;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfwcvt.xu.f.v";
				execution_vector 	= vfwcvt_xu_f_v;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfwcvt.x.f.v";
				execution_vector 	= vfwcvt_x_f_v;
				vs2 				= {$random, $random};
		
			#20 instruction 		= "vfwcvt.f.xu.v";
				execution_vector 	= vfwcvt_f_xu_v;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfwcvt.f.x.v";
				execution_vector 	= vfwcvt_f_x_v;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfwcvt.f.f.v";
				execution_vector 	= vfwcvt_f_f_v;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfncvt.xu.f.w";
				execution_vector 	= vfncvt_xu_f_w;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfncvt.x.f.w";
				execution_vector 	= vfncvt_x_f_w;
				vs2 				= {$random, $random};
		
			#20 instruction 		= "vfncvt.f.xu.w";
				execution_vector 	= vfncvt_f_xu_w;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfncvt.f.x.w";
				execution_vector 	= vfncvt_f_x_w;
				vs2 				= {$random, $random};
			
			#20 instruction 		= "vfncvt.f.f.w";
				execution_vector 	= vfncvt_f_f_w;
				vs2 				= {$random, $random};
			
			#20 ;
			#20 $stop;
		end
		
	vector_conversion_unit vector_conversion_unit
	(
		.execution_vector 	(execution_vector),
		
		.vs2 				(vs2),
		
		.vd 				(vd),
		.vd_high 			()
	);
	
endmodule 