// 8-bit, Kogge-Stone Carry Network

module carry_8
(
	input 	logic [7:0] source_element_0,
	input 	logic [7:0] source_element_1,
	input 	logic 		input_carry,
	
	output 	logic [7:0]	bitwise_carry,
	output 	logic 		output_carry
);
	
	logic [7:0] g;
	logic [7:0] p;
	
	logic g_00_01, p_00_01;
	logic g_00_21, p_00_21;
	logic g_10_11, p_10_11;
	logic g_10_31, p_10_31;
	logic g_20_21, p_20_21;
	logic g_20_41, p_20_41;
	logic g_30_31, p_30_31;
	logic g_30_51, p_30_51;
	logic g_40_41, p_40_41;
	logic g_40_61, p_40_61;
	logic g_50_51, p_50_51;
	logic g_50_71, p_50_71;
	logic g_60_61, p_60_61;
	logic g_60_81, p_60_81;
	logic g_70_71, p_70_71;
	logic g_80_81, p_80_81;
	logic g_01_02, p_01_02;
	logic g_01_42, p_01_42;
	logic g_41_42, p_41_42;
	logic g_11_52, p_11_52;
	logic g_51_52, p_51_52;
	logic g_21_62, p_21_62;
	logic g_61_62, p_61_62;
	logic g_31_72, p_31_72;
	logic g_71_72, p_71_72;
	logic g_41_82, p_41_82;
	logic g_81_82, p_81_82;
	logic g_02_83, p_02_83;
	logic g_82_83, p_82_83;
	
	generate
		genvar i;
		
		for (i = 0; i < 8; i = i + 1)
			begin : generate_gp_signals
				assign g[i] = source_element_0[i] & source_element_1[i];
				assign p[i] = source_element_0[i] ^ source_element_1[i];
			end
	
	endgenerate
	
	// Level 0
	white_cell white_cell_00
	(
		.g_current 			(input_carry),
		.p_current 			(1'b0),
	
		.g_combined_current (g_00_01),
		.p_combined_current (p_00_01),
		.g_combined_next 	(g_00_21),
		.p_combined_next 	(p_00_21)
	);
	
	black_cell black_cell_10
	(
		.g_previous			(input_carry),
		.p_previous			(1'b0),
		.g_current 			(g[0]),
		.p_current 			(p[0]),
	
		.g_combined_current (g_10_11),
		.p_combined_current (p_10_11),
		.g_combined_next 	(g_10_31),
		.p_combined_next 	(p_10_31)
	);
	
	black_cell black_cell_20
	(
		.g_previous			(g[0]),
		.p_previous			(p[0]),
		.g_current 			(g[1]),
		.p_current 			(p[1]),
	
		.g_combined_current (g_20_21),
		.p_combined_current (p_20_21),
		.g_combined_next 	(g_20_41),
		.p_combined_next 	(p_20_41)
	);
	
	black_cell black_cell_30
	(
		.g_previous			(g[1]),
		.p_previous			(p[1]),
		.g_current 			(g[2]),
		.p_current 			(p[2]),
	
		.g_combined_current (g_30_31),
		.p_combined_current (p_30_31),
		.g_combined_next 	(g_30_51),
		.p_combined_next 	(p_30_51)
	);
	
	black_cell black_cell_40
	(
		.g_previous			(g[2]),
		.p_previous			(p[2]),
		.g_current 			(g[3]),
		.p_current 			(p[3]),
	
		.g_combined_current (g_40_41),
		.p_combined_current (p_40_41),
		.g_combined_next 	(g_40_61),
		.p_combined_next 	(p_40_61)
	);
	
	black_cell black_cell_50
	(
		.g_previous			(g[3]),
		.p_previous			(p[3]),
		.g_current 			(g[4]),
		.p_current 			(p[4]),
	
		.g_combined_current (g_50_51),
		.p_combined_current (p_50_51),
		.g_combined_next 	(g_50_71),
		.p_combined_next 	(p_50_71)
	);
	
	black_cell black_cell_60
	(
		.g_previous			(g[4]),
		.p_previous			(p[4]),
		.g_current 			(g[5]),
		.p_current 			(p[5]),
	
		.g_combined_current (g_60_61),
		.p_combined_current (p_60_61),
		.g_combined_next 	(g_60_81),
		.p_combined_next 	(p_60_81)
	);
	
	black_cell black_cell_70
	(
		.g_previous			(g[5]),
		.p_previous			(p[5]),
		.g_current 			(g[6]),
		.p_current 			(p[6]),
	
		.g_combined_current (g_70_71),
		.p_combined_current (p_70_71),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	black_cell black_cell_80
	(
		.g_previous			(g[6]),
		.p_previous			(p[6]),
		.g_current 			(g[7]),
		.p_current 			(p[7]),
	
		.g_combined_current (g_80_81),
		.p_combined_current (p_80_81),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	// Level 1
	white_cell white_cell_01
	(
		.g_current 			(g_00_01),
		.p_current 			(p_00_01),
	
		.g_combined_current (g_01_02),
		.p_combined_current (p_01_02),
		.g_combined_next 	(g_01_42),
		.p_combined_next 	(p_01_42)
	);
	
	white_cell white_cell_11
	(
		.g_current 			(g_10_11),
		.p_current 			(p_10_11),
	
		.g_combined_current (bitwise_carry[1]),
		.p_combined_current (),
		.g_combined_next 	(g_11_52),
		.p_combined_next 	(p_11_52)
	);
	
	black_cell black_cell_21
	(
		.g_previous			(g_00_21),
		.p_previous			(p_00_21),
		.g_current 			(g_20_21),
		.p_current 			(p_20_21),
	
		.g_combined_current (bitwise_carry[2]),
		.p_combined_current (),
		.g_combined_next 	(g_21_62),
		.p_combined_next 	(p_21_62)
	);
	
	black_cell black_cell_31
	(
		.g_previous			(g_10_31),
		.p_previous			(p_10_31),
		.g_current 			(g_30_31),
		.p_current 			(p_30_31),
	
		.g_combined_current (bitwise_carry[3]),
		.p_combined_current (),
		.g_combined_next 	(g_31_72),
		.p_combined_next 	(p_31_72)
	);
	
	black_cell black_cell_41
	(
		.g_previous			(g_20_41),
		.p_previous			(p_20_41),
		.g_current 			(g_40_41),
		.p_current 			(p_40_41),
	
		.g_combined_current (g_41_42),
		.p_combined_current (p_41_42),
		.g_combined_next 	(g_41_82),
		.p_combined_next 	(p_41_82)
	);
	
	black_cell black_cell_51
	(
		.g_previous			(g_30_51),
		.p_previous			(p_30_51),
		.g_current 			(g_50_51),
		.p_current 			(p_50_51),
	
		.g_combined_current (g_51_52),
		.p_combined_current (p_51_52),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	black_cell black_cell_61
	(
		.g_previous			(g_40_61),
		.p_previous			(p_40_61),
		.g_current 			(g_60_61),
		.p_current 			(p_60_61),
	
		.g_combined_current (g_61_62),
		.p_combined_current (p_61_62),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	black_cell black_cell_71
	(
		.g_previous			(g_50_71),
		.p_previous			(p_50_71),
		.g_current 			(g_70_71),
		.p_current 			(p_70_71),
	
		.g_combined_current (g_71_72),
		.p_combined_current (p_71_72),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	black_cell black_cell_81
	(
		.g_previous			(g_60_81),
		.p_previous			(p_60_81),
		.g_current 			(g_80_81),
		.p_current 			(p_80_81),
	
		.g_combined_current (g_81_82),
		.p_combined_current (p_81_82),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	// Level 2
	white_cell white_cell_02
	(
		.g_current 			(g_01_02),
		.p_current 			(p_01_02),
	
		.g_combined_current (bitwise_carry[0]),
		.p_combined_current (),
		.g_combined_next 	(g_02_83),
		.p_combined_next 	(p_02_83)
	);
	
	black_cell black_cell_42
	(
		.g_previous			(g_01_42),
		.p_previous			(p_01_42),
		.g_current 			(g_41_42),
		.p_current 			(p_41_42),
	
		.g_combined_current (bitwise_carry[4]),
		.p_combined_current (),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	black_cell black_cell_52
	(
		.g_previous			(g_11_52),
		.p_previous			(p_11_52),
		.g_current 			(g_51_52),
		.p_current 			(p_51_52),
	
		.g_combined_current (bitwise_carry[5]),
		.p_combined_current (),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	black_cell black_cell_62
	(
		.g_previous			(g_21_62),
		.p_previous			(p_21_62),
		.g_current 			(g_61_62),
		.p_current 			(p_61_62),
	
		.g_combined_current (bitwise_carry[6]),
		.p_combined_current (),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	black_cell black_cell_72
	(
		.g_previous			(g_31_72),
		.p_previous			(p_31_72),
		.g_current 			(g_71_72),
		.p_current 			(p_71_72),
	
		.g_combined_current (bitwise_carry[7]),
		.p_combined_current (),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	black_cell black_cell_82
	(
		.g_previous			(g_41_82),
		.p_previous			(p_41_82),
		.g_current 			(g_81_82),
		.p_current 			(p_81_82),
	
		.g_combined_current (g_82_83),
		.p_combined_current (p_82_83),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
	
	// Level 3
	black_cell black_cell_83
	(
		.g_previous			(g_02_83),
		.p_previous			(p_02_83),
		.g_current 			(g_82_83),
		.p_current 			(p_82_83),
	
		.g_combined_current (output_carry),
		.p_combined_current (),
		.g_combined_next 	(),
		.p_combined_next 	()
	);
	
endmodule 