`ifndef EXECUTION_VECTORS_PKG_COMPILED
	`define EXECUTION_VECTORS_PKG_COMPILED
		package execution_vectors_pkg;
			import dragonfang_pkg::*;
			
			// vadd.v* (Vector addition).
			execution_vector_t vadd_64 	= '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE};
											
			execution_vector_t vadd_32 	= '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE};
											
			execution_vector_t vadd_16 	= '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE};
											
			execution_vector_t vadd_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE};
			
			// vsub.v* (Vector subtraction).
			execution_vector_t vsub_64 	= '{default 			: '0,
											bit_mode 			: ENABLED_64BIT_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vsub_32 	= '{default 			: '0,
											bit_mode 			: ENABLED_32BIT_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vsub_16 	= '{default 			: '0,
											bit_mode 			: ENABLED_16BIT_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vsub_8 	= '{default 			: '0,
											bit_mode 			: ENABLED_8BIT_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			// vrsub.v* (Vector reverse subtraction [source operands are swapped]).
			execution_vector_t vrsub_64 = '{default 					: '0,
											bit_mode 					: ENABLED_64BIT_MODE,
											reverse_subtraction_mode 	: ENABLED_REVERSE_SUBTRACTION_MODE};
											
			execution_vector_t vrsub_32 = '{default 					: '0,
											bit_mode 					: ENABLED_32BIT_MODE,
											reverse_subtraction_mode 	: ENABLED_REVERSE_SUBTRACTION_MODE};
											
			execution_vector_t vrsub_16 = '{default 					: '0,
											bit_mode 					: ENABLED_16BIT_MODE,
											reverse_subtraction_mode 	: ENABLED_REVERSE_SUBTRACTION_MODE};
											
			execution_vector_t vrsub_8 	= '{default 					: '0,
											bit_mode 					: ENABLED_8BIT_MODE,
											reverse_subtraction_mode 	: ENABLED_REVERSE_SUBTRACTION_MODE};
											
			// vadc.v*m (Vector add-with-carry).
			execution_vector_t vadc_64 	= '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											carry_mode		: ENABLED_CARRY_MODE};
											
			execution_vector_t vadc_32 	= '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											carry_mode		: ENABLED_CARRY_MODE};
											
			execution_vector_t vadc_16 	= '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											carry_mode		: ENABLED_CARRY_MODE};
											
			execution_vector_t vadc_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											carry_mode		: ENABLED_CARRY_MODE};
											
			// vsbc.v*m (Vector subtract-with-borrow).
			execution_vector_t vsbc_64 	= '{default 			: '0,
											bit_mode 			: ENABLED_64BIT_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
											carry_mode			: ENABLED_CARRY_MODE};
											
			execution_vector_t vsbc_32 	= '{default 			: '0,
											bit_mode 			: ENABLED_32BIT_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
											carry_mode			: ENABLED_CARRY_MODE};
											
			execution_vector_t vsbc_16 	= '{default 			: '0,
											bit_mode 			: ENABLED_16BIT_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
											carry_mode			: ENABLED_CARRY_MODE};
											
			execution_vector_t vsbc_8 	= '{default 			: '0,
											bit_mode 			: ENABLED_8BIT_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
											carry_mode			: ENABLED_CARRY_MODE};
			
			// vmadc.v*m (Compute carry with carry input).
			execution_vector_t vmadc_m64 	= '{default 	: '0,
												bit_mode 	: ENABLED_64BIT_MODE,
												carry_mode	: ENABLED_CARRY_MODE,
												mask_mode	: ENABLED_MASK_MODE};
											
			execution_vector_t vmadc_m32 	= '{default 	: '0,
												bit_mode 	: ENABLED_32BIT_MODE,
												carry_mode	: ENABLED_CARRY_MODE,
												mask_mode	: ENABLED_MASK_MODE};
											
			execution_vector_t vmadc_m16 	= '{default 	: '0,
												bit_mode 	: ENABLED_16BIT_MODE,
												carry_mode	: ENABLED_CARRY_MODE,
												mask_mode	: ENABLED_MASK_MODE};
											
			execution_vector_t vmadc_m8 	= '{default 	: '0,
												bit_mode 	: ENABLED_8BIT_MODE,
												carry_mode	: ENABLED_CARRY_MODE,
												mask_mode	: ENABLED_MASK_MODE};
			
			// vmadc.v* (Compute carry without carry input).
			execution_vector_t vmadc_64 	= '{default 	: '0,
												bit_mode 	: ENABLED_64BIT_MODE,
												mask_mode	: ENABLED_MASK_MODE};
											
			execution_vector_t vmadc_32 	= '{default 	: '0,
												bit_mode 	: ENABLED_32BIT_MODE,
												mask_mode	: ENABLED_MASK_MODE};
											
			execution_vector_t vmadc_16 	= '{default 	: '0,
												bit_mode 	: ENABLED_16BIT_MODE,
												mask_mode	: ENABLED_MASK_MODE};
											
			execution_vector_t vmadc_8 		= '{default 	: '0,
												bit_mode 	: ENABLED_8BIT_MODE,
												mask_mode	: ENABLED_MASK_MODE};
			
			// vmsbc.v*m (Compute borrow with borrow input).
			execution_vector_t vmsbc_m64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												carry_mode			: ENABLED_CARRY_MODE,
												borrow_mode			: ENABLED_BORROW_MODE,
												mask_mode			: ENABLED_MASK_MODE};
											
			execution_vector_t vmsbc_m32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												carry_mode			: ENABLED_CARRY_MODE,
												borrow_mode			: ENABLED_BORROW_MODE,
												mask_mode			: ENABLED_MASK_MODE};
											
			execution_vector_t vmsbc_m16 	= '{default 			: '0,
												bit_mode 			: ENABLED_16BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												carry_mode			: ENABLED_CARRY_MODE,
												borrow_mode			: ENABLED_BORROW_MODE,
												mask_mode			: ENABLED_MASK_MODE};
											
			execution_vector_t vmsbc_m8 	= '{default 			: '0,
												bit_mode 			: ENABLED_8BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												carry_mode			: ENABLED_CARRY_MODE,
												borrow_mode			: ENABLED_BORROW_MODE,
												mask_mode			: ENABLED_MASK_MODE};
			
			// vmsbc.v* (Compute borrow without borrow input).
			execution_vector_t vmsbc_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												borrow_mode			: ENABLED_BORROW_MODE,
												mask_mode			: ENABLED_MASK_MODE};
											
			execution_vector_t vmsbc_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												borrow_mode			: ENABLED_BORROW_MODE,
												mask_mode			: ENABLED_MASK_MODE};
											
			execution_vector_t vmsbc_16 	= '{default 			: '0,
												bit_mode 			: ENABLED_16BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												borrow_mode			: ENABLED_BORROW_MODE,
												mask_mode			: ENABLED_MASK_MODE};
											
			execution_vector_t vmsbc_8 	= '{default 			: '0,
												bit_mode 			: ENABLED_8BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												borrow_mode			: ENABLED_BORROW_MODE,
												mask_mode			: ENABLED_MASK_MODE};
			
			// vwadd.v* (Vector widening addition).
			execution_vector_t vwadd_64 	= '{default 		: '0,
												bit_mode 		: ENABLED_64BIT_MODE,
												sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
												widening_mode	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwadd_32 	= '{default 		: '0,
												bit_mode 		: ENABLED_32BIT_MODE,
												sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
												widening_mode	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwadd_16 	= '{default 		: '0,
												bit_mode 		: ENABLED_16BIT_MODE,
												sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
												widening_mode	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwadd_8 		= '{default 		: '0,
												bit_mode 		: ENABLED_8BIT_MODE,
												sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
												widening_mode	: ENABLED_WIDENING_MODE};
												
			// vwaddu.v* (Vector widening, unsigned addition).
			execution_vector_t vwaddu_64 	= '{default 		: '0,
												bit_mode 		: ENABLED_64BIT_MODE,
												sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
												widening_mode	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwaddu_32 	= '{default 		: '0,
												bit_mode 		: ENABLED_32BIT_MODE,
												sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
												widening_mode	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwaddu_16 	= '{default 		: '0,
												bit_mode 		: ENABLED_16BIT_MODE,
												sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
												widening_mode	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwaddu_8 		= '{default 	: '0,
												bit_mode 		: ENABLED_8BIT_MODE,
												sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
												widening_mode	: ENABLED_WIDENING_MODE};
												
												
			// vwsub.v* (Vector widening addition).
			execution_vector_t vwsub_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												sign_mode			: ENABLED_SIGNED_SIGNED_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												widening_mode		: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwsub_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												sign_mode			: ENABLED_SIGNED_SIGNED_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												widening_mode		: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwsub_16 	= '{default 			: '0,
												bit_mode 			: ENABLED_16BIT_MODE,
												sign_mode			: ENABLED_SIGNED_SIGNED_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												widening_mode		: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwsub_8 		= '{default 			: '0,
												bit_mode 			: ENABLED_8BIT_MODE,
												sign_mode			: ENABLED_SIGNED_SIGNED_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												widening_mode		: ENABLED_WIDENING_MODE};
												
			// vwaddu.v* (Vector widening, unsigned addition).
			execution_vector_t vwsubu_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												sign_mode			: ENABLED_UNSIGNED_UNSIGNED_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												widening_mode		: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwsubu_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												sign_mode			: ENABLED_UNSIGNED_UNSIGNED_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												widening_mode		: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwsubu_16 	= '{default 			: '0,
												bit_mode 			: ENABLED_16BIT_MODE,
												sign_mode			: ENABLED_UNSIGNED_UNSIGNED_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												widening_mode		: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwsubu_8 		= '{default 		: '0,
												bit_mode 			: ENABLED_8BIT_MODE,
												sign_mode			: ENABLED_UNSIGNED_UNSIGNED_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												widening_mode		: ENABLED_WIDENING_MODE};
			
			// vmseq.v*
			execution_vector_t vmseq_64			= '{default 		: '0,
													bit_mode 		: ENABLED_64BIT_MODE,
													comparison_mode : ENABLED_EQUAL_MODE};
			
			execution_vector_t vmseq_32			= '{default 		: '0,
													bit_mode 		: ENABLED_32BIT_MODE,
													comparison_mode : ENABLED_EQUAL_MODE};
			
			execution_vector_t vmseq_16			= '{default 		: '0,
													bit_mode 		: ENABLED_16BIT_MODE,
													comparison_mode : ENABLED_EQUAL_MODE};
			
			
			execution_vector_t vmseq_8			= '{default 		: '0,
													bit_mode 		: ENABLED_8BIT_MODE,
													comparison_mode : ENABLED_EQUAL_MODE};
													
			
			
			// vmsne.v*
			execution_vector_t vmsne_64			= '{default 		: '0,
													bit_mode 		: ENABLED_64BIT_MODE,
													comparison_mode : ENABLED_NOT_EQUAL_MODE};
			
			execution_vector_t vmsne_32			= '{default 		: '0,
													bit_mode 		: ENABLED_32BIT_MODE,
													comparison_mode : ENABLED_NOT_EQUAL_MODE};
			
			execution_vector_t vmsne_16			= '{default 		: '0,
													bit_mode 		: ENABLED_16BIT_MODE,
													comparison_mode : ENABLED_NOT_EQUAL_MODE};
			
			
			execution_vector_t vmsne_8			= '{default 		: '0,
													bit_mode 		: ENABLED_8BIT_MODE,
													comparison_mode : ENABLED_NOT_EQUAL_MODE};
													
			// vmsltu.v*
			execution_vector_t vmsltu_64			= '{default 		: '0,
														bit_mode 		: ENABLED_64BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_LESS_THAN_MODE};
			
			execution_vector_t vmsltu_32			= '{default 		: '0,
														bit_mode 		: ENABLED_32BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_LESS_THAN_MODE};
			
			execution_vector_t vmsltu_16			= '{default 		: '0,
														bit_mode 		: ENABLED_16BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_LESS_THAN_MODE};
			
			
			execution_vector_t vmsltu_8				= '{default 		: '0,
														bit_mode 		: ENABLED_8BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_LESS_THAN_MODE};

			
			
			// vmslt.v*
			execution_vector_t vmslt_64			= '{default 		: '0,
													bit_mode 		: ENABLED_64BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_LESS_THAN_MODE};
			
			execution_vector_t vmslt_32			= '{default 		: '0,
													bit_mode 		: ENABLED_32BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_LESS_THAN_MODE};
			
			execution_vector_t vmslt_16			= '{default 		: '0,
													bit_mode 		: ENABLED_16BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_LESS_THAN_MODE};
			
			
			execution_vector_t vmslt_8			= '{default 		: '0,
													bit_mode 		: ENABLED_8BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_LESS_THAN_MODE};
			
			// vmsleu.v*
			execution_vector_t vmsleu_64			= '{default 		: '0,
														bit_mode 		: ENABLED_64BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			execution_vector_t vmsleu_32			= '{default 		: '0,
														bit_mode 		: ENABLED_32BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			execution_vector_t vmsleu_16			= '{default 		: '0,
														bit_mode 		: ENABLED_16BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			
			execution_vector_t vmsleu_8				= '{default 		: '0,
														bit_mode 		: ENABLED_8BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			
			// vmsle.v*
			execution_vector_t vmsle_64			= '{default 		: '0,
													bit_mode 		: ENABLED_64BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			execution_vector_t vmsle_32			= '{default 		: '0,
													bit_mode 		: ENABLED_32BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			execution_vector_t vmsle_16			= '{default 		: '0,
													bit_mode 		: ENABLED_16BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			
			execution_vector_t vmsle_8			= '{default 		: '0,
													bit_mode 		: ENABLED_8BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			// vmsgtu.v*
			execution_vector_t vmsgtu_64			= '{default 		: '0,
														bit_mode 		: ENABLED_64BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_GREATER_THAN_MODE};
			
			execution_vector_t vmsgtu_32			= '{default 		: '0,
														bit_mode 		: ENABLED_32BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_GREATER_THAN_MODE};
			
			execution_vector_t vmsgtu_16			= '{default 		: '0,
														bit_mode 		: ENABLED_16BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_GREATER_THAN_MODE};
			
			
			execution_vector_t vmsgtu_8				= '{default 		: '0,
														bit_mode 		: ENABLED_8BIT_MODE,
														sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
														comparison_mode : ENABLED_GREATER_THAN_MODE};
														
			// vmsgt.v*
			execution_vector_t vmsgt_64			= '{default 		: '0,
													bit_mode 		: ENABLED_64BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_GREATER_THAN_MODE};
			
			execution_vector_t vmsgt_32			= '{default 		: '0,
													bit_mode 		: ENABLED_32BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_GREATER_THAN_MODE};
			
			execution_vector_t vmsgt_16			= '{default 			: '0,
													bit_mode 		: ENABLED_16BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_GREATER_THAN_MODE};
			
			
			execution_vector_t vmsgt_8			= '{default 		: '0,
													bit_mode 		: ENABLED_8BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													comparison_mode : ENABLED_GREATER_THAN_MODE};
			
			// vand.v* (Bitwise AND).
			execution_vector_t vand_all			= '{default 	: '0,
													logic_mode	: ENABLED_AND_MODE};
													
			// vand.v* (Bitwise OR).
			execution_vector_t vor_all			= '{default 	: '0,
													logic_mode	: ENABLED_OR_MODE};
			
			// vand.v* (Bitwise XOR).
			execution_vector_t vxor_all			= '{default 	: '0,
													logic_mode	: ENABLED_XOR_MODE};
			
			// vsll.v*
			execution_vector_t vsll_64			= '{default 	: '0,
													bit_mode	: ENABLED_64BIT_MODE,
													shift_mode	: ENABLED_SHIFT_LEFT_LOGICAL_MODE};
													
			execution_vector_t vsll_32			= '{default 	: '0,
													bit_mode	: ENABLED_32BIT_MODE,
													shift_mode	: ENABLED_SHIFT_LEFT_LOGICAL_MODE};
													
			execution_vector_t vsll_16			= '{default 	: '0,
													bit_mode	: ENABLED_16BIT_MODE,
													shift_mode	: ENABLED_SHIFT_LEFT_LOGICAL_MODE};
													
			execution_vector_t vsll_8			= '{default 	: '0,
													bit_mode	: ENABLED_8BIT_MODE,
													shift_mode	: ENABLED_SHIFT_LEFT_LOGICAL_MODE};
													
			// vsrl.v*
			execution_vector_t vsrl_64			= '{default 	: '0,
													bit_mode	: ENABLED_64BIT_MODE,
													shift_mode	: ENABLED_SHIFT_RIGHT_LOGICAL_MODE};
													
			execution_vector_t vsrl_32			= '{default 	: '0,
													bit_mode	: ENABLED_32BIT_MODE,
													shift_mode	: ENABLED_SHIFT_RIGHT_LOGICAL_MODE};
													
			execution_vector_t vsrl_16			= '{default 	: '0,
													bit_mode	: ENABLED_16BIT_MODE,
													shift_mode	: ENABLED_SHIFT_RIGHT_LOGICAL_MODE};
													
			execution_vector_t vsrl_8			= '{default 	: '0,
													bit_mode	: ENABLED_8BIT_MODE,
													shift_mode	: ENABLED_SHIFT_RIGHT_LOGICAL_MODE};
													
			// vsra.v*
			execution_vector_t vsra_64			= '{default 	: '0,
													bit_mode	: ENABLED_64BIT_MODE,
													shift_mode	: ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE};
													
			execution_vector_t vsra_32			= '{default 	: '0,
													bit_mode	: ENABLED_32BIT_MODE,
													shift_mode	: ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE};
													
			execution_vector_t vsra_16			= '{default 	: '0,
													bit_mode	: ENABLED_16BIT_MODE,
													shift_mode	: ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE};
													
			execution_vector_t vsra_8			= '{default 	: '0,
													bit_mode	: ENABLED_8BIT_MODE,
													shift_mode	: ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE};
													
			// vnsrl.w*
			execution_vector_t vnsrl_w64		= '{default 		: '0,
													bit_mode		: ENABLED_64BIT_MODE,
													narrowing_mode 	: ENABLED_NARROWING_MODE,
													shift_mode		: ENABLED_SHIFT_RIGHT_LOGICAL_MODE};
													
			execution_vector_t vnsrl_w32		= '{default 		: '0,
													bit_mode		: ENABLED_32BIT_MODE,
													narrowing_mode 	: ENABLED_NARROWING_MODE,
													shift_mode		: ENABLED_SHIFT_RIGHT_LOGICAL_MODE};
													
			execution_vector_t vnsrl_w16		= '{default 		: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													narrowing_mode 	: ENABLED_NARROWING_MODE,
													shift_mode		: ENABLED_SHIFT_RIGHT_LOGICAL_MODE};
													
			execution_vector_t vnsrl_w8			= '{default 		: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													narrowing_mode 	: ENABLED_NARROWING_MODE,
													shift_mode		: ENABLED_SHIFT_RIGHT_LOGICAL_MODE};
													
			// vnsra.w*
			execution_vector_t vnsra_w64		= '{default 		: '0,
													bit_mode		: ENABLED_64BIT_MODE,
													narrowing_mode 	: ENABLED_NARROWING_MODE,
													shift_mode		: ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE};
													
			execution_vector_t vnsra_w32		= '{default 		: '0,
													bit_mode		: ENABLED_32BIT_MODE,
													narrowing_mode 	: ENABLED_NARROWING_MODE,
													shift_mode		: ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE};
													
			execution_vector_t vnsra_w16		= '{default 		: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													narrowing_mode 	: ENABLED_NARROWING_MODE,
													shift_mode		: ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE};
													
			execution_vector_t vnsra_w8			= '{default 		: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													narrowing_mode 	: ENABLED_NARROWING_MODE,
													shift_mode		: ENABLED_SHIFT_RIGHT_ARITHMETIC_MODE};
			
			// vmerge.v*m (Vector merge)
			execution_vector_t vmerge_64 		= '{default 	: '0,
													bit_mode 	: ENABLED_64BIT_MODE};
													
			execution_vector_t vmerge_32 		= '{default 	: '0,
													bit_mode 	: ENABLED_32BIT_MODE};
													
			execution_vector_t vmerge_16 		= '{default 	: '0,
													bit_mode 	: ENABLED_16BIT_MODE};
													
			execution_vector_t vmerge_8 		= '{default 	: '0,
													bit_mode 	: ENABLED_8BIT_MODE};
			
			// vmin.v* (Vector signed select minimum).
			execution_vector_t vmin_64			= '{default			: '0,
													bit_mode		: ENABLED_64BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													minimum_mode 	: ENABLED_MINIMUM_MODE};
													
			execution_vector_t vmin_32			= '{default			: '0,
													bit_mode		: ENABLED_32BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													minimum_mode 	: ENABLED_MINIMUM_MODE};
													
			execution_vector_t vmin_16			= '{default			: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													minimum_mode 	: ENABLED_MINIMUM_MODE};
													
			execution_vector_t vmin_8			= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													minimum_mode 	: ENABLED_MINIMUM_MODE};
													
			// vminu.v* (Vector signed select minimum).
			execution_vector_t vminu_64			= '{default			: '0,
													bit_mode		: ENABLED_64BIT_MODE,
													sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
													minimum_mode 	: ENABLED_MINIMUM_MODE};
													
			execution_vector_t vminu_32			= '{default			: '0,
													bit_mode		: ENABLED_32BIT_MODE,
													sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
													minimum_mode 	: ENABLED_MINIMUM_MODE};
													
			execution_vector_t vminu_16			= '{default			: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
													minimum_mode 	: ENABLED_MINIMUM_MODE};
													
			execution_vector_t vminu_8			= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
													minimum_mode 	: ENABLED_MINIMUM_MODE};
													
			// vmax.v* (Vector signed select maximum).
			execution_vector_t vmax_64			= '{default			: '0,
													bit_mode		: ENABLED_64BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													maximum_mode 	: ENABLED_MAXIMUM_MODE};
													
			execution_vector_t vmax_32			= '{default			: '0,
													bit_mode		: ENABLED_32BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													maximum_mode 	: ENABLED_MAXIMUM_MODE};
													
			execution_vector_t vmax_16			= '{default			: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													maximum_mode 	: ENABLED_MAXIMUM_MODE};
													
			execution_vector_t vmax_8			= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													sign_mode		: ENABLED_SIGNED_SIGNED_MODE,
													maximum_mode 	: ENABLED_MAXIMUM_MODE};
													
			// vmaxu.v* (Vector signed select maximum).
			execution_vector_t vmaxu_64			= '{default			: '0,
													bit_mode		: ENABLED_64BIT_MODE,
													sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
													maximum_mode 	: ENABLED_MAXIMUM_MODE};
													
			execution_vector_t vmaxu_32			= '{default			: '0,
													bit_mode		: ENABLED_32BIT_MODE,
													sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
													maximum_mode 	: ENABLED_MAXIMUM_MODE};
													
			execution_vector_t vmaxu_16			= '{default			: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
													maximum_mode 	: ENABLED_MAXIMUM_MODE};
													
			execution_vector_t vmaxu_8			= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													sign_mode		: ENABLED_UNSIGNED_UNSIGNED_MODE,
													maximum_mode 	: ENABLED_MAXIMUM_MODE};
			
			// vsext.vf2 (Vector sign extension from half operands).
			execution_vector_t vsext_vf2_32		= '{default			: '0,
													bit_mode		: ENABLED_32BIT_MODE,
													fraction_mode 	: ENABLED_HALF_MODE,
													extension_mode	: ENABLED_SIGN_EXTENSION_MODE};
			
			execution_vector_t vsext_vf2_16		= '{default			: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													fraction_mode 	: ENABLED_HALF_MODE,
													extension_mode	: ENABLED_SIGN_EXTENSION_MODE};
			
			execution_vector_t vsext_vf2_8		= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													fraction_mode 	: ENABLED_HALF_MODE,
													extension_mode	: ENABLED_SIGN_EXTENSION_MODE};
													
			// vsext.vf4 (Vector sign extension from quarter operands).
			execution_vector_t vsext_vf4_16		= '{default			: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													fraction_mode 	: ENABLED_QUARTER_MODE,
													extension_mode	: ENABLED_SIGN_EXTENSION_MODE};
			
			execution_vector_t vsext_vf4_8		= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													fraction_mode 	: ENABLED_QUARTER_MODE,
													extension_mode	: ENABLED_SIGN_EXTENSION_MODE};
													
			// vsext.vf8 (Vector sign extension from eighth operands).
			execution_vector_t vsext_vf8_8		= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													fraction_mode 	: ENABLED_EIGHTH_MODE,
													extension_mode	: ENABLED_SIGN_EXTENSION_MODE};
													
			// vzext.vf2 (Vector zero extension from half operands).
			execution_vector_t vzext_vf2_32		= '{default			: '0,
													bit_mode		: ENABLED_32BIT_MODE,
													fraction_mode 	: ENABLED_HALF_MODE,
													extension_mode	: ENABLED_ZERO_EXTENSION_MODE};
			
			execution_vector_t vzext_vf2_16		= '{default			: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													fraction_mode 	: ENABLED_HALF_MODE,
													extension_mode	: ENABLED_ZERO_EXTENSION_MODE};
			
			execution_vector_t vzext_vf2_8		= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													fraction_mode 	: ENABLED_HALF_MODE,
													extension_mode	: ENABLED_ZERO_EXTENSION_MODE};
													
			// vzext.vf4 (Vector zero extension from quarter operands).
			execution_vector_t vzext_vf4_16		= '{default			: '0,
													bit_mode		: ENABLED_16BIT_MODE,
													fraction_mode 	: ENABLED_QUARTER_MODE,
													extension_mode	: ENABLED_ZERO_EXTENSION_MODE};
			
			execution_vector_t vzext_vf4_8		= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													fraction_mode 	: ENABLED_QUARTER_MODE,
													extension_mode	: ENABLED_ZERO_EXTENSION_MODE};
													
			// vzext.vf8 (Vector zero extension from eighth operands).
			execution_vector_t vzext_vf8_8		= '{default			: '0,
													bit_mode		: ENABLED_8BIT_MODE,
													fraction_mode 	: ENABLED_EIGHTH_MODE,
													extension_mode	: ENABLED_ZERO_EXTENSION_MODE};
			
			// vmul.v* (Signed product, return low half).
			execution_vector_t vmul_64 	= '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											low_half_mode 	: ENABLED_LOW_HALF_MODE};
											
			execution_vector_t vmul_32 	= '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											low_half_mode 	: ENABLED_LOW_HALF_MODE};
											
			execution_vector_t vmul_16 	= '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											low_half_mode 	: ENABLED_LOW_HALF_MODE};
											
			execution_vector_t vmul_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											low_half_mode 	: ENABLED_LOW_HALF_MODE};

			// vmulh.v* (Signed product, return high half).
			execution_vector_t vmulh_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulh_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulh_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulh_8 = '{default 			: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};

			
			// vmulhu.v* (Unsigned product, return high half).
			execution_vector_t vmulhu_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulhu_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulhu_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulhu_8 = '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};

			// vmulhsu.v* (Signed-unsigned product, return high half).
			execution_vector_t vmulhsu_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulhsu_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulhsu_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};
											
			execution_vector_t vmulhsu_8 = '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
											high_half_mode 	: ENABLED_HIGH_HALF_MODE};

			
			// vwmul.v* (Signed, widening product).
			execution_vector_t vwmul_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};

			execution_vector_t vwmul_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmul_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
		
			execution_vector_t vwmul_8 = '{default 			: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
		
	
			// vwmulu.v* (Unsigned, widening product).
			execution_vector_t vwmulu_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};

			execution_vector_t vwmulu_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmulu_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmulu_8 = '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};

			// vwmulsu.v* (Signed-unsigned, widening product).
			execution_vector_t vwmulsu_64 ='{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmulsu_32 ='{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmulsu_16 ='{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmulsu_8 ='{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
											widening_mode 	: ENABLED_WIDENING_MODE};
			
											
			// vdivu.v* (Unsigned division).
			execution_vector_t vdivu_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE};
											
			execution_vector_t vdivu_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE};
											
			execution_vector_t vdivu_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE};
											
			execution_vector_t vdivu_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE};

			// vdiv.v* (Signed division).
			execution_vector_t vdiv_64 	= '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE};
											
			execution_vector_t vdiv_32 	= '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE};
											
			execution_vector_t vdiv_16 	= '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE};
											
			execution_vector_t vdiv_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE};
											
											
			// vremu.v* (Unsigned remainder).
			execution_vector_t vremu_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											remainder_mode 	: ENABLED_REMAINDER_MODE};

			execution_vector_t vremu_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											remainder_mode 	: ENABLED_REMAINDER_MODE};
											
			execution_vector_t vremu_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											remainder_mode 	: ENABLED_REMAINDER_MODE};
											
			execution_vector_t vremu_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											remainder_mode 	: ENABLED_REMAINDER_MODE};
			
			// vrem.v* (Signed remainder).
			execution_vector_t vrem_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											remainder_mode 	: ENABLED_REMAINDER_MODE};

			execution_vector_t vrem_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											remainder_mode 	: ENABLED_REMAINDER_MODE};
											
			execution_vector_t vrem_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											remainder_mode 	: ENABLED_REMAINDER_MODE};
											
			execution_vector_t vrem_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
											remainder_mode 	: ENABLED_REMAINDER_MODE};
								
			// vmacc.v* (Multiply-add, overwrite addend).
			execution_vector_t vmacc_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE};
											
			execution_vector_t vmacc_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE};
											
			execution_vector_t vmacc_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE};
											
			execution_vector_t vmacc_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE};
											
			// vmadd.v* (Multiply-add, overwrite multiplicand).
			execution_vector_t vmadd_64 = '{default 		: '0,
											bit_mode 		: ENABLED_64BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 	: ENABLED_OVERWRITE_DESTINATION_MODE};
											
			execution_vector_t vmadd_32 = '{default 		: '0,
											bit_mode 		: ENABLED_32BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 	: ENABLED_OVERWRITE_DESTINATION_MODE};
											
			execution_vector_t vmadd_16 = '{default 		: '0,
											bit_mode 		: ENABLED_16BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 	: ENABLED_OVERWRITE_DESTINATION_MODE};
											
			execution_vector_t vmadd_8 	= '{default 		: '0,
											bit_mode 		: ENABLED_8BIT_MODE,
											sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 	: ENABLED_OVERWRITE_DESTINATION_MODE};
			
			// vnmsac.v* (Multiply-sub, overwrite minuend).
			execution_vector_t vnmsac_64 = '{default 			: '0,
											bit_mode 			: ENABLED_64BIT_MODE,
											sign_mode 			: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 		: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vnmsac_32 = '{default 			: '0,
											bit_mode 			: ENABLED_32BIT_MODE,
											sign_mode 			: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 		: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vnmsac_16 = '{default 			: '0,
											bit_mode 			: ENABLED_16BIT_MODE,
											sign_mode 			: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 		: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vnmsac_8 = '{default 			: '0,
											bit_mode 			: ENABLED_8BIT_MODE,
											sign_mode 			: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 		: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			// vnmsub.v* (Multiply-sub, overwrite multiplicand).
			execution_vector_t vnmsub_64 = '{default 			: '0,
											bit_mode 			: ENABLED_64BIT_MODE,
											sign_mode 			: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 		: ENABLED_OVERWRITE_DESTINATION_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vnmsub_32 = '{default 			: '0,
											bit_mode 			: ENABLED_32BIT_MODE,
											sign_mode 			: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 		: ENABLED_OVERWRITE_DESTINATION_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vnmsub_16 = '{default 			: '0,
											bit_mode 			: ENABLED_16BIT_MODE,
											sign_mode 			: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 		: ENABLED_OVERWRITE_DESTINATION_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
											
			execution_vector_t vnmsub_8 = '{default 			: '0,
											bit_mode 			: ENABLED_8BIT_MODE,
											sign_mode 			: ENABLED_UNSIGNED_UNSIGNED_MODE,
											overwrite_mode 		: ENABLED_OVERWRITE_DESTINATION_MODE,
											subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
			
			// vwmaccu.v* (Widening, unsigned, multiply-add, overwrite addend).
			execution_vector_t vwmaccu_64 	= '{default 		: '0,
												bit_mode 		: ENABLED_64BIT_MODE,
												sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmaccu_32 	= '{default 		: '0,
												bit_mode 		: ENABLED_32BIT_MODE,
												sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
			execution_vector_t vwmaccu_16 	= '{default 		: '0,
												bit_mode 		: ENABLED_16BIT_MODE,
												sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
			execution_vector_t vwmaccu_8 	= '{default 		: '0,
												bit_mode 		: ENABLED_8BIT_MODE,
												sign_mode 		: ENABLED_UNSIGNED_UNSIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
											
			// vwmacc.v* (Widening, signed, multiply-add, overwrite addend).
			execution_vector_t vwmacc_64 	= '{default 		: '0,
												bit_mode 		: ENABLED_64BIT_MODE,
												sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmacc_32 	= '{default 		: '0,
												bit_mode 		: ENABLED_32BIT_MODE,
												sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
			execution_vector_t vwmacc_16 	= '{default 		: '0,
												bit_mode 		: ENABLED_16BIT_MODE,
												sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
			execution_vector_t vwmacc_8 	= '{default 		: '0,
												bit_mode 		: ENABLED_8BIT_MODE,
												sign_mode 		: ENABLED_SIGNED_SIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
			
			// vwmaccsu.v* (Widening, signed-unsigned, multiply-add, overwrite addend).
			execution_vector_t vwmaccsu_64 	= '{default 		: '0,
												bit_mode 		: ENABLED_64BIT_MODE,
												sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmaccsu_32 	= '{default 		: '0,
												bit_mode 		: ENABLED_32BIT_MODE,
												sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
											
			execution_vector_t vwmaccsu_16 	= '{default 		: '0,
												bit_mode 		: ENABLED_16BIT_MODE,
												sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
			execution_vector_t vwmaccsu_8 	= '{default 		: '0,
												bit_mode 		: ENABLED_8BIT_MODE,
												sign_mode 		: ENABLED_SIGNED_UNSIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
			
			// vwmaccus.v* (Widening, unsigned-signed, multiply-add, overwrite addend).
			execution_vector_t vwmaccus_64 	= '{default 		: '0,
												bit_mode 		: ENABLED_64BIT_MODE,
												sign_mode 		: ENABLED_UNSIGNED_SIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
												
			execution_vector_t vwmaccus_32 	= '{default 		: '0,
												bit_mode 		: ENABLED_32BIT_MODE,
												sign_mode 		: ENABLED_UNSIGNED_SIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
			execution_vector_t vwmaccus_16 	= '{default 		: '0,
												bit_mode 		: ENABLED_16BIT_MODE,
												sign_mode 		: ENABLED_UNSIGNED_SIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
			execution_vector_t vwmaccus_8 	= '{default 		: '0,
												bit_mode 		: ENABLED_8BIT_MODE,
												sign_mode 		: ENABLED_UNSIGNED_SIGNED_MODE,
												overwrite_mode 	: ENABLED_OVERWRITE_SECOND_OPERAND_MODE,
												widening_mode 	: ENABLED_WIDENING_MODE};
												
			// Floating-Point Instructions -------------------------------------------------------------
			
			// vfsqrt.v (Vector Floating-point Square-Root)
			execution_vector_t vfsqrt_64 	= '{default			: '0,
												bit_mode		: ENABLED_64BIT_MODE};
											
			execution_vector_t vfsqrt_32 	= '{default			: '0,
												bit_mode		: ENABLED_32BIT_MODE};
												
			// vfrsqrt7.v (Vector Floating-point Reciprocal Square-Root Estimation [7 bits])
			execution_vector_t vfrsqrt7_64 	= '{default			: '0,
												bit_mode		: ENABLED_64BIT_MODE,
												reciprocal_mode : ENABLED_RECIPROCAL_MODE};
											
			execution_vector_t vfrsqrt7_32 	= '{default			: '0,
												bit_mode		: ENABLED_32BIT_MODE,
												reciprocal_mode : ENABLED_RECIPROCAL_MODE};
												
			// vfsgnj.v* (Vector Floating-Point Sign-Injection)
			execution_vector_t vfsgnj_64	= '{default				: '0,
												bit_mode			: ENABLED_64BIT_MODE,
												sign_injection_mode : ENABLED_VS1_SIGN_INJECTION_MODE};
			
			execution_vector_t vfsgnj_32	= '{default				: '0,
												bit_mode			: ENABLED_32BIT_MODE,
												sign_injection_mode : ENABLED_VS1_SIGN_INJECTION_MODE};
			
			execution_vector_t vfsgnjn_64	= '{default				: '0,
												bit_mode			: ENABLED_64BIT_MODE,
												sign_injection_mode : ENABLED_NEGATED_VS1_SIGN_INJECTION_MODE};
			
			execution_vector_t vfsgnjn_32	= '{default				: '0,
												bit_mode			: ENABLED_32BIT_MODE,
												sign_injection_mode : ENABLED_NEGATED_VS1_SIGN_INJECTION_MODE};
												
			execution_vector_t vfsgnjx_64	= '{default				: '0,
												bit_mode			: ENABLED_64BIT_MODE,
												sign_injection_mode : ENABLED_XOR_SIGN_INJECTION_MODE};
			
			execution_vector_t vfsgnjx_32	= '{default				: '0,
												bit_mode			: ENABLED_32BIT_MODE,
												sign_injection_mode : ENABLED_XOR_SIGN_INJECTION_MODE};
												
			// vfmul.v* (Vector Floating-Point Multiply)
			execution_vector_t vfmul_64		= '{default				: '0,
												bit_mode 			:ENABLED_64BIT_MODE};
												
			execution_vector_t vfmul_32		= '{default				: '0,
												bit_mode 			:ENABLED_32BIT_MODE};
			
			// vfdiv.v* (Vector Floating-Point Divide)
			execution_vector_t vfdiv_64		= '{default				: '0,
												bit_mode 			:ENABLED_64BIT_MODE};
												
			execution_vector_t vfdiv_32		= '{default				: '0,
												bit_mode 			:ENABLED_32BIT_MODE};
			
			// vfrdiv.v* (Vector Floating-Point Reverse Divide)
			execution_vector_t vfrdiv_64	= '{default				: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												reverse_mode 		: ENABLED_REVERSE_MODE};
												
			execution_vector_t vfrdiv_32	= '{default				: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												reverse_mode 		: ENABLED_REVERSE_MODE};
									
			// vfmacc.v* (Vector Floating-Point Fused Multiply-Add, Overwrite Addend)
			execution_vector_t vfmacc_64	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE};
												
			execution_vector_t vfmacc_32	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE};
												
			// vfnmacc.v* (Vector Floating-Point Fused Negate Multiply-Sub, Overwrite Subtrahend)
			execution_vector_t vfnmacc_64	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												negate_mode 		: ENABLED_NEGATE_MODE};
												
			execution_vector_t vfnmacc_32	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE,
												negate_mode 		: ENABLED_NEGATE_MODE};
												
			// vfmsac.v* (Vector Floating-Point Fused Negate Multiply-Sub, Overwrite Subtrahend)
			execution_vector_t vfmsac_64	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
												
			execution_vector_t vfmsac_32	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												subtraction_mode 	: ENABLED_SUBTRACTION_MODE};
												
			// vfnmsac.v* (Vector Floating-Point Fused Multiply-Sub, Overwrite Minuend)
			execution_vector_t vfnmsac_64	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												negate_mode 		: ENABLED_NEGATE_MODE};
												
			execution_vector_t vfnmsac_32	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												negate_mode 		: ENABLED_NEGATE_MODE};
			
			// vfmadd.v* (Vector Floating-Point Multiply-Add, Overwrite Multiplicand)
			// vfnmadd.v* (Vector Floating-Point Negate Multiply-Add, Overwrite Multiplicand)
			// vfmsub.v* (Vector Floating-Point Multiply-Sub, Overwrite Multiplicand)
			// vfnmsub.v* (Vector Floating-Point Negate Multiply-Sub, Overwrite Multiplicand)
			
			// vfmin.v* (Vector Floating-Point Minimum)
			execution_vector_t vfmin_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												minimum_mode 		: ENABLED_MINIMUM_MODE};
												
			execution_vector_t vfmin_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												minimum_mode 		: ENABLED_MINIMUM_MODE};
												
			// vfmax.v* (Vector Floating-Point Minimum)
			execution_vector_t vfmax_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												maximum_mode 		: ENABLED_MAXIMUM_MODE};
												
			execution_vector_t vfmax_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												maximum_mode 		: ENABLED_MAXIMUM_MODE};
			
			// vfmerge.vfm (Vector Floating-Point Merge)
			execution_vector_t vfmerge_64 	= '{default				: '0,
												bit_mode 			: ENABLED_64BIT_MODE};
			
			execution_vector_t vfmerge_32 	= '{default				: '0,
												bit_mode 			: ENABLED_32BIT_MODE};
												
			// vmfeq.v* (Vector Floating-Point Compare Equal)
			execution_vector_t vmfeq_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												comparison_mode 	: ENABLED_EQUAL_MODE};
												
			execution_vector_t vmfeq_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												comparison_mode 	: ENABLED_EQUAL_MODE};									
			
			// vmfne.v* (Vector Floating-Point Not Compare Equal)			
			execution_vector_t vmfne_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												comparison_mode 	: ENABLED_NOT_EQUAL_MODE};
			
			execution_vector_t vmfne_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												comparison_mode 	: ENABLED_NOT_EQUAL_MODE};
			
			// vmflt.v* (Vector Floating-Point Less-Than)
			execution_vector_t vmflt_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												comparison_mode 	: ENABLED_LESS_THAN_MODE};
								
			execution_vector_t vmflt_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												comparison_mode 	: ENABLED_LESS_THAN_MODE};
			
			// vmfle.v* (Vector Floating-Point Less-Than-Or-Equal)
			execution_vector_t vmfle_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												comparison_mode 	: ENABLED_LESS_THAN_OR_EQUAL_MODE};
												
			execution_vector_t vmfle_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												comparison_mode 	: ENABLED_LESS_THAN_OR_EQUAL_MODE};
			
			// vmfgt.v* (Vector Floating-Point Greater-Than)
			execution_vector_t vmfgt_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												comparison_mode 	: ENABLED_GREATER_THAN_MODE};
			
			execution_vector_t vmfgt_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												comparison_mode 	: ENABLED_GREATER_THAN_MODE};
			
			// vmfge.v* (Vector Floating-Point Greater-Than-Or-Equal)
			execution_vector_t vmfge_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												comparison_mode 	: ENABLED_GREATER_THAN_OR_EQUAL_MODE};
			
			execution_vector_t vmfge_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												comparison_mode 	: ENABLED_GREATER_THAN_OR_EQUAL_MODE};
												
			// vfadd.v* (Vector Floating-Point Addition)
			execution_vector_t vfadd_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE};
												
			execution_vector_t vfadd_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE};
												
			// vfsub.v* (Vector Floating-Point Subtraction)
			execution_vector_t vfsub_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE};
												
			execution_vector_t vfsub_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE};
			
			// vfrsub.v* (Vector Floating-Point Reverse Subtraction)
			execution_vector_t vfrsub_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE,
												reverse_mode 		: ENABLED_REVERSE_MODE};
												
			execution_vector_t vfrsub_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE,
												reverse_mode 		: ENABLED_REVERSE_MODE};
			
			
			
			
			// vfcvt.xu.f.v (Convert Float to Unsigned Integer)
			execution_vector_t vfcvt_xu_f_v = '{default 			: '0,
												conversion_mode 	: ENABLED_SHORTREAL_TO_UNSIGNED_INT};
			
			// vfcvt.x.f.v (Convert Float to Signed Integer)			
			execution_vector_t vfcvt_x_f_v 	= '{default 			: '0,
												conversion_mode 	: ENABLED_SHORTREAL_TO_SIGNED_INT};
			
			// vfcvt.f.xu.v (Convert Unsigned Integer to Float)
			execution_vector_t vfcvt_f_xu_v = '{default 			: '0,
												conversion_mode 	: ENABLED_UNSIGNED_INT_TO_SHORTREAL};
			
			// vfcvt.f.x.v (Convert Signed Integer to Float)
			execution_vector_t vfcvt_f_x_v 	= '{default 			: '0,
												conversion_mode 	: ENABLED_SIGNED_INT_TO_SHORTREAL};
												
			// vfwcvt.xu.f.v (Convert Float to Double-Width Unsigned Integer)
			execution_vector_t vfwcvt_xu_f_v = '{default 			: '0,
												conversion_mode 	: ENABLED_SHORTREAL_TO_UNSIGNED_LONGINT};
			
			// vfwcvt.x.f.v (Convert Float to Double-Width Signed Integer)			
			execution_vector_t vfwcvt_x_f_v = '{default 			: '0,
												conversion_mode 	: ENABLED_SHORTREAL_TO_SIGNED_LONGINT};
												
			// vfwcvt.f.xu.v (Convert Unsigned Integer to Double-Width Float)
			execution_vector_t vfwcvt_f_xu_v = '{default 			: '0,
												conversion_mode 	: ENABLED_UNSIGNED_INT_TO_REAL};
			
			// vfwcvt.f.x.v (Convert Signed Integer to Double-Width Float)			
			execution_vector_t vfwcvt_f_x_v = '{default 			: '0,
												conversion_mode 	: ENABLED_SIGNED_INT_TO_REAL};
												
			// vfwcvt.f.f.v (Convert Float to Double-Width Float)			
			execution_vector_t vfwcvt_f_f_v = '{default 			: '0,
												conversion_mode 	: ENABLED_SHORTREAL_TO_REAL};
												
			// 
			
			// vfncvt.xu.f.w (Convert Double-Width Float to Unsigned Integer)
			execution_vector_t vfncvt_xu_f_w = '{default 			: '0,
												conversion_mode 	: ENABLED_REAL_TO_UNSIGNED_INT};
			
			// vfncvt.x.f.w (Convert Double-Width Float to Signed Integer)			
			execution_vector_t vfncvt_x_f_w = '{default 			: '0,
												conversion_mode 	: ENABLED_REAL_TO_SIGNED_INT};
			
			// vfncvt.f.xu.w (Convert Double-Width Unsigned Integer to Float)
			execution_vector_t vfncvt_f_xu_w = '{default 			: '0,
												conversion_mode 	: ENABLED_UNSIGNED_LONGINT_TO_SHORTREAL};
			
			// vfncvt.f.x.w (Convert Double-Width Signed Integer to Float)
			execution_vector_t vfncvt_f_x_w = '{default 			: '0,
												conversion_mode 	: ENABLED_SIGNED_LONGINT_TO_SHORTREAL};
												
			// vfncvt.f.f.w (Convert Double-Width Float to Float)
			execution_vector_t vfncvt_f_f_w = '{default 			: '0,
												conversion_mode 	: ENABLED_REAL_TO_SHORTREAL};
			//
			
			// vfclass.v (Vector Floating-Point Classify Unit)
			execution_vector_t vfclass_64 	= '{default 			: '0,
												bit_mode 			: ENABLED_64BIT_MODE};
												
			execution_vector_t vfclass_32 	= '{default 			: '0,
												bit_mode 			: ENABLED_32BIT_MODE};									
			// -----------------------------------------------------------------------------------------
		endpackage
`endif