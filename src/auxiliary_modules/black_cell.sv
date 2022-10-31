module black_cell
(
	input 	logic g_previous,
	input 	logic p_previous,
	input 	logic g_current,
	input 	logic p_current,
	
	output 	logic g_combined_current,
	output 	logic p_combined_current,
	output 	logic g_combined_next,
	output 	logic p_combined_next
);

	assign g_combined_current 	= g_current | (g_previous & p_current);
	assign p_combined_current 	= p_previous & p_current;
	assign g_combined_next 		= g_combined_current;
	assign p_combined_next 		= p_combined_current;

endmodule 