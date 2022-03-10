module RAMtb (address, WR, clk, Din, Do);

	output reg [7:0] address;
	output reg WR, clk;
	output reg [31:0] Din;
	output wire[31:0] Do;
	
	RAM memory(address, WR, clk, Din, Do);
	
	initial begin
	WR <= 1;
	address <= 8'd0;
	Din <= $random;
	clk <= 0;
	#5
	clk <= 1;
	#5
	clk <= 0;
	#5
	address <= 8'd4;
	Din <= $random;
	clk <= 1;
	#5
	clk <= 0;
	#5
	WR <= 0;
	#5
	address <= 8'd0;
	clk <= 1;
	#5
	clk <= 0;
	#5
	address <= 8'd4;
	clk <= 1;
	#5
	clk <= 0;
	end

endmodule
