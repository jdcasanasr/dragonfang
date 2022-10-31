module vector_register_file
#(
	parameter NUMBER_REGISTERS 	= 32,
	parameter REGISTER_LENGTH 	= 64
)
(
	input 	logic clock,
	input 	logic reset_n,
	input 	logic read_enable,
	input 	logic write_enable,
	
	input 	logic [$clog2(NUMBER_REGISTERS) - 1:0] 	read_address_0,
	input 	logic [$clog2(NUMBER_REGISTERS) - 1:0] 	read_address_1,
	input 	logic [$clog2(NUMBER_REGISTERS) - 1:0] 	read_address_2,
	input 	logic [$clog2(NUMBER_REGISTERS) - 1:0] 	read_address_3,
	
	input 	logic [$clog2(NUMBER_REGISTERS) - 1:0] 	write_address,
	input 	logic [REGISTER_LENGTH - 1:0] 			write_port,
	
	output 	logic [REGISTER_LENGTH - 1:0] 			read_port_0,
	output 	logic [REGISTER_LENGTH - 1:0] 			read_port_1,
	output 	logic [REGISTER_LENGTH - 1:0] 			read_port_2,
	output 	logic [REGISTER_LENGTH - 1:0] 			read_port_3
);

	logic [REGISTER_LENGTH - 1:0] register_file [NUMBER_REGISTERS - 1:0];
	
	// Manage register write requests.
	always_ff @ (posedge clock, negedge reset_n)
		if (!reset_n)
			for (int i = 0; i < NUMBER_REGISTERS; i++)
				register_file[i] = '0;
				
		else if (write_enable)
			register_file[write_address] = write_port;
			
	// Manage register read requests.
	always_comb
		if (read_enable)
			begin
				read_port_0 = register_file[read_address_0];
				read_port_1 = register_file[read_address_1];
				read_port_2 = register_file[read_address_2];
				read_port_3 = register_file[read_address_3];
			end
			
		else
			begin
				read_port_0 = '0;
				read_port_1 = '0;
				read_port_2 = '0;
				read_port_3 = '0;
			end

endmodule 