module RAM64x8 (addy, WR, clk, CS, Di,Do);
	
	input [5:0] addy;
	input WR, clk, CS;
	input [7:0] Di;
	output reg[7:0]Do;

	
	reg [7:0] mem_array[5:0];
	reg [7:0] mem_out;
	
	always@(posedge clk)begin
		if (CS && WR)
			mem_array[addy]=Di;
		end 
	always@(posedge clk) begin 
		mem_out=mem_array[addy];
		Do <=CS ? mem_out : 8'b0;
	end 
	
	
endmodule 