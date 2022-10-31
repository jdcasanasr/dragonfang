// Transform a (signed/unsigned) integer into a float_t floating-point number.
function float_t integer_to_float (logic [31:0] rs2);

	float_t vd;
	wire [4:0] leading_zeroes;
	logic [4:0] first_zero_index  		= rs2.find_first_index(index) with (index == 1'b0);
	
	// Initialize float_t fields.
	vd.sign 	= rs2[31];
	vd.exponent = '0;
	vd.mantissa = '0;
	
	// If the sign is negative (2's complements) find the first non-one digit to
	// form our mantissa (The rest of the ones are the sign).
	if (rs2[31])
		begin
			//first_zero_index = find_first_zero (rs2);
			
			vd.exponent = first_zero_index + 8'd159;
			vd.mantissa = rs2[first_zero_index:0];
			
			return vd;
		end

	// Our number is either positive or unsigned. Take
	else
		begin
			//leading_zeroes = count_leading_zeroes (rs2);
		
			vd.exponent = 8'd160 - leading_zeroes;
			vd.mantissa = rs2[(leading_zeroes - 1):0];
			
			return vd;
		end

	leading_zeroes_counter # (.INPUT_WIDTH(32)) leading_zeroes_counter_0
	(
		.input_vector (rs2),

		.count_vector (leading_zeroes)
	);
		
endfunction 