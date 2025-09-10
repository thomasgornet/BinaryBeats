/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  frameRAM
(
		input [17:0] read_address,
		input Clk,
		output logic [1:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
(* ram_style = "block" *) logic [1:0] mem [0:76800];

initial
begin
	 $readmemh("bf.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule
