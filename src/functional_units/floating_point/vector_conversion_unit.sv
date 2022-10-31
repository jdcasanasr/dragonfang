module vector_conversion_unit

import 	dragonfang_pkg :: *,
		dragonfang_floating_point_pkg :: *;

(
	input 	execution_vector_t 	execution_vector,
	
	input 	logic [63:0] 		vs2,
	
	output 	logic [63:0] 		vd,
	output 	logic [63:0]		vd_high
);
	
	float_t 	[1:0] 	vs2_shortreal;
	double_t 			vs2_real;
	
	float_t				vd_longint_to_shortreal;
	
	integer32_t [1:0] 	vs2_int;
	integer64_t 		vs2_longint;
	
	float_t 	[1:0] vd_shortreal;
	integer32_t [1:0] vd_int;
	
	integer64_t [1:0] vd_signed_longint;
	integer64_t [1:0] vd_unsigned_longint;
	
	integer32_t 		vd_real_to_int;
	
	// ---
	logic sign_mode;
	// ---
	
	assign sign_mode = (execution_vector.sign_mode == ENABLED_SIGNED_SIGNED_MODE ? 1'b1 : 1'b0);
	
	always_comb
		begin
			vs2_int[0]			= vs2[31:0];
			vs2_int[1]			= vs2[63:32];
			vs2_longint			= vs2;
		
			vs2_shortreal[0] 	= pack_to_float (vs2[31:0]);
			vs2_shortreal[1] 	= pack_to_float (vs2[63:32]);
			vs2_real 			= pack_to_double (vs2);
		end
			
	always_comb
		case (execution_vector.conversion_mode)
			ENABLED_SHORTREAL_TO_UNSIGNED_INT, ENABLED_SHORTREAL_TO_SIGNED_INT 			:
				begin
					vd 	= {vd_int[1], vd_int[0]};
					vd_high = '0;
				end
			
			
			ENABLED_UNSIGNED_INT_TO_SHORTREAL, ENABLED_SIGNED_INT_TO_SHORTREAL			:
				begin
					vd 	= {vd_shortreal[1], vd_shortreal[0]};
					vd_high = '0;
				end
			
			ENABLED_SHORTREAL_TO_UNSIGNED_LONGINT :
				begin
					vd 	= vd_unsigned_longint[0];
					vd_high = vd_unsigned_longint[1];
				end
			
			
			ENABLED_SHORTREAL_TO_SIGNED_LONGINT 	:
				begin
					vd 	= {{32{vd_int[0][31]}}, vd_int[0]};
					vd_high = {{32{vd_int[1][31]}}, vd_int[1]};
				end
			
			
			ENABLED_UNSIGNED_INT_TO_REAL, ENABLED_SIGNED_INT_TO_REAL 				:
				begin
					vd 	= float_to_double (vd_shortreal[0]);
					vd_high = float_to_double (vd_shortreal[1]);
				end
			
			ENABLED_SHORTREAL_TO_REAL 				:
				begin
					vd  = float_to_double (vs2_shortreal[0]); 
					vd_high = float_to_double (vs2_shortreal[1]);
				end
			
			ENABLED_REAL_TO_UNSIGNED_INT, ENABLED_REAL_TO_SIGNED_INT 				:
				begin
					vd 	= vd_real_to_int;
					vd_high = '0;
				end
				
			
			ENABLED_UNSIGNED_LONGINT_TO_SHORTREAL, ENABLED_SIGNED_LONGINT_TO_SHORTREAL 	:
				begin
					vd 	= vd_longint_to_shortreal;
					vd_high = '0;
				end
			
			ENABLED_REAL_TO_SHORTREAL 				:
				begin
					vd 	= {{32{1'b0}}, double_to_float (vs2_real)};
					vd_high = '0;
				end
			
			default 								:
				begin
					vd 	= '0;
					vd_high = '0;
				end
		endcase
	
	double_to_integer_converter real_to_int_converter_0
	(
		.input_double 		(vs2_real),
		.sign_mode 			(sign_mode),
	
		.converted_integer 	(vd_real_to_int)
	);
	
	longint_to_shortreal_converter longint_to_shortreal_0
	(
		.input_integer 		(vs2_longint),
		.sign_mode 			(sign_mode),
		
		.converted_float 	(vd_longint_to_shortreal)
	);
	
	integer_to_float_converter int_to_shortreal_converter_0
	(
		.input_integer 				(vs2_int[0]),
		.sign_mode 					(sign_mode),
		
		.converted_float			(vd_shortreal[0])
	);
	
	integer_to_float_converter int_to_shortreal_converter_1
	(
		.input_integer 				(vs2_int[1]),
		.sign_mode 					(sign_mode),
		
		.converted_float			(vd_shortreal[1])
	);
	
	float_to_integer_converter shortreal_to_integer_converter_0
	(
		.input_float 				(vs2_shortreal[0]),
		.sign_mode 					(sign_mode),
	
		.converted_integer 			(vd_int[0])
	);
	
	float_to_integer_converter shortreal_to_integer_converter_1
	(
		.input_float 				(vs2_shortreal[1]),
		.sign_mode 					(sign_mode),
	
		.converted_integer 			(vd_int[1])
	);
	
	bit_extender #(.INPUT_VECTOR_WIDTH(32), .OUTPUT_VECTOR_WIDTH(64), .BIT_TO_EXTEND(1'b0)) zero_extender_0
	(
		.input_vector 	(vd_int[0]),
		
		.output_vector 	(vd_unsigned_longint[0])
	);
	
	bit_extender #(.INPUT_VECTOR_WIDTH(32), .OUTPUT_VECTOR_WIDTH(64), .BIT_TO_EXTEND(1'b0)) zero_extender_1
	(
		.input_vector 	(vd_int[1]),
		
		.output_vector 	(vd_unsigned_longint[1])
	);
	
endmodule 