`ifndef DRAGONFANG_PKG_COMPILED
	`define DRAGONFANG_PKG_COMPILED
		package dragonfang_pkg;
			import riscv_v_pkg :: *;
		
			parameter NUMBER_PHYSICAL_REGISTERS = 32;
			parameter NUMBER_FUNCTIONAL_UNITS 	= 21;
			parameter TAG_LENGTH				= $clog2(NUMBER_PHYSICAL_REGISTERS);
			parameter DATA_LENGTH				= VLEN;
		
			
			typedef enum logic [1:0] 	{ENABLED_64BIT_MODE, ENABLED_32BIT_MODE, ENABLED_16BIT_MODE, ENABLED_8BIT_MODE} 																					bit_mode_t;
			typedef enum logic [1:0] 	{ENABLED_UNSIGNED_UNSIGNED_MODE, ENABLED_UNSIGNED_SIGNED_MODE, ENABLED_SIGNED_UNSIGNED_MODE, ENABLED_SIGNED_SIGNED_MODE} 											sign_mode_t;
			typedef enum logic [1:0] 	{DISABLED_OVERWRITE_MODE = '0, ENABLED_OVERWRITE_FIRST_OPERAND_MODE, ENABLED_OVERWRITE_SECOND_OPERAND_MODE, ENABLED_OVERWRITE_DESTINATION_MODE} 					overwrite_mode_t;
			typedef enum logic [2:0] 	{DISABLED_COMPARISON_MODE = '0, ENABLED_EQUAL_MODE, ENABLED_NOT_EQUAL_MODE,ENABLED_LESS_THAN_MODE, ENABLED_LESS_THAN_OR_EQUAL_MODE, ENABLED_GREATER_THAN_MODE, ENABLED_GREATER_THAN_OR_EQUAL_MODE}	 	comparison_mode_t;
			typedef enum logic 			{DISABLED_MINIMUM_MODE = '0, ENABLED_MINIMUM_MODE} 																													minimum_mode_t;
			typedef enum logic 			{DISABLED_MAXIMUM_MODE = '0, ENABLED_MAXIMUM_MODE} 																													maximum_mode_t;
			typedef enum logic 			{DISABLED_LOW_HALF_MODE = '0, ENABLED_LOW_HALF_MODE} 																												low_half_mode_t;
			typedef enum logic 			{DISABLED_HIGH_HALF_MODE = '0, ENABLED_HIGH_HALF_MODE} 																												high_half_mode_t;
			typedef enum logic			{DISABLED_REMAINDER_MODE = '0, ENABLED_REMAINDER_MODE} 																												remainder_mode_t;
			typedef enum logic 			{DISABLED_WIDENING_MODE = '0, ENABLED_WIDENING_MODE} 																												widening_mode_t;
			typedef enum logic 			{DISABLED_NARROWING_MODE = '0, ENABLED_NARROWING_MODE} 																												narrowing_mode_t;
			typedef enum logic 			{DISABLED_SUBTRACTION_MODE = '0, ENABLED_SUBTRACTION_MODE} 																											subtraction_mode_t;
			typedef enum logic			{DISABLED_REVERSE_SUBTRACTION_MODE, ENABLED_REVERSE_SUBTRACTION_MODE} 																								reverse_subtraction_mode_t;
			typedef enum logic			{DISABLED_CARRY_MODE = '0, ENABLED_CARRY_MODE} 																														carry_mode_t;
			typedef enum logic 			{DISABLED_BORROW_MODE = '0, ENABLED_BORROW_MODE} 																													borrow_mode_t;
			typedef enum logic			{DISABLED_MASK_MODE = '0, ENABLED_MASK_MODE}																								 						mask_mode_t;
			typedef enum logic [1:0]	{DISABLED_LOGIC_MODE = '0, ENABLED_AND_MODE, ENABLED_OR_MODE, ENABLED_XOR_MODE}																						logic_mode_t;
			typedef enum logic [1:0] 	{DISABLED_SHIFT_MODE = '0, ENABLED_SHIFT_LEFT_LOGICAL_MODE, ENABLED_SHIFT_RIGHT_LOGICAL_MODE, ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE}									shift_mode_t;
			typedef enum logic [1:0]	{DISABLED_EXTENSION_MODE = '0, ENABLED_SIGN_EXTENSION_MODE, ENABLED_ZERO_EXTENSION_MODE} 																			extension_mode_t;
			typedef enum logic [1:0]	{DISABLED_FRACTION_MODE, ENABLED_HALF_MODE, ENABLED_QUARTER_MODE, ENABLED_EIGHTH_MODE}																				fraction_mode_t;
			typedef enum logic 			{DISABLED_REVERSE_MODE = '0, ENABLED_REVERSE_MODE}																													reverse_mode_t;
			typedef enum logic 			{DISABLED_NEGATE_MODE = '0, ENABLED_NEGATE_MODE}																													negate_mode_t;
			typedef enum logic 			{DISABLED_RECIPROCAL_MODE = '0, ENABLED_RECIPROCAL_MODE}																											reciprocal_mode_t;
			typedef enum logic [1:0]	{DISABLED_SIGN_INJECTION_MODE = '0, ENABLED_VS1_SIGN_INJECTION_MODE, ENABLED_NEGATED_VS1_SIGN_INJECTION_MODE, ENABLED_XOR_SIGN_INJECTION_MODE}						sign_injection_t;
			
			typedef enum logic [3:0] 		{	DISABLED_CONVERSION_MODE, 				ENABLED_SHORTREAL_TO_UNSIGNED_INT,
												ENABLED_SHORTREAL_TO_SIGNED_INT, 		ENABLED_UNSIGNED_INT_TO_SHORTREAL,
												ENABLED_SIGNED_INT_TO_SHORTREAL,		ENABLED_SHORTREAL_TO_UNSIGNED_LONGINT,
												ENABLED_SHORTREAL_TO_SIGNED_LONGINT,	ENABLED_UNSIGNED_INT_TO_REAL,
												ENABLED_SIGNED_INT_TO_REAL, 			ENABLED_SHORTREAL_TO_REAL,
												ENABLED_REAL_TO_UNSIGNED_INT,  			ENABLED_REAL_TO_SIGNED_INT,
												ENABLED_UNSIGNED_LONGINT_TO_SHORTREAL, 	ENABLED_SIGNED_LONGINT_TO_SHORTREAL,
												ENABLED_REAL_TO_SHORTREAL 														} conversion_mode_t;
			
			
			typedef struct packed
			{
				bit_mode_t 			bit_mode;
				sign_mode_t 		sign_mode;
				comparison_mode_t 	comparison_mode;
				minimum_mode_t		minimum_mode;
				maximum_mode_t		maximum_mode;
				low_half_mode_t 	low_half_mode;
				high_half_mode_t 	high_half_mode;
				remainder_mode_t 	remainder_mode;
				widening_mode_t 	widening_mode;
				narrowing_mode_t 	narrowing_mode;
				subtraction_mode_t 	subtraction_mode;
				reverse_subtraction_mode_t reverse_subtraction_mode;
				carry_mode_t		carry_mode;
				borrow_mode_t		borrow_mode;
				mask_mode_t			mask_mode;
				logic_mode_t		logic_mode;
				shift_mode_t		shift_mode;
				overwrite_mode_t 	overwrite_mode;
				extension_mode_t	extension_mode;
				fraction_mode_t		fraction_mode;
				reverse_mode_t		reverse_mode;
				negate_mode_t		negate_mode;
				reciprocal_mode_t 	reciprocal_mode;
				sign_injection_t 	sign_injection_mode;
				conversion_mode_t 	conversion_mode;
				
			} execution_vector_t;
			
			typedef struct packed
			{
				logic [TAG_LENGTH - 1:0] 	tag;
				logic [DATA_LENGTH - 1:0] 	data;
			
			} data_packet_t;
			
			typedef struct packed
			{
				data_packet_t v0;
				data_packet_t vs2;
				data_packet_t vs1;
				data_packet_t vd;
			
			} operand_packet_t;
			
			typedef struct packed
			{
				logic [$clog2(NUMBER_PHYSICAL_REGISTERS) - 1:0] v0;
				logic [$clog2(NUMBER_PHYSICAL_REGISTERS) - 1:0] vs2;
				logic [$clog2(NUMBER_PHYSICAL_REGISTERS) - 1:0] vs1;
				logic [$clog2(NUMBER_PHYSICAL_REGISTERS) - 1:0] vd;
				
			} operand_tag_packet_t;
			
			
			
			
			typedef struct packed
			{
				logic [$clog2(NUMBER_FUNCTIONAL_UNITS) - 1:0] 	functional_unit_tag; 					// Decode
				
				execution_vector_t 								execution_vector;		// Decode.
				
				operand_tag_packet_t 							operand_tag_packet;
				
				logic [VLEN - 1:0] 								scalar_immediate_operand;
			
			} register_read_packet_t;
			
			
			typedef struct packed
			{
				logic [$clog2(NUMBER_FUNCTIONAL_UNITS) - 1:0] 	functional_unit_tag; 	// Functional Unit Tag 	// Decode.

				execution_vector_t 								execution_vector;				// Decode.
				
				operand_packet_t 								operand_set;					// Register Read.
			
			} execution_packet_t;
			
			
			
			// Register Read structures.
			typedef struct packed
			{
				logic read_request;
				logic write_back_request;
			
			} register_read_vector_t;
			
			// Write Back structures.
			typedef struct packed
			{
				bit_mode_t 	bit_mode;
			
				logic 		vm;
				logic 		vma;
				logic 		vta;
			
			} write_back_vector_t;
			
		endpackage
`endif