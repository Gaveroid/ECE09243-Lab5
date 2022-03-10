module RAM (addy, WR, clk, Di, Do);
	
	input [7:0] addy;
	input WR, clk;
	input [31:0] Di;
	output [31:0] Do;
	wire [3:0] x;
	
	Decoder boop (addy[7:6], 1'b1, x);
	
	wire [31:0] dosig0,dosig1,dosig2,dosig3;
	
	RAM64x8 ram1x1 (addy[5:0], WR, clk, x[0], Di[31:24], dosig0[31:24]);
	RAM64x8 ram1x2 (addy[5:0], WR, clk, x[0], Di[23:16], dosig0[23:16]);
	RAM64x8 ram1x3 (addy[5:0], WR, clk, x[0], Di[15:8], dosig0[15:8]);
	RAM64x8 ram1x4 (addy[5:0], WR, clk, x[0], Di[7:0], dosig0[7:0]);
	
	RAM64x8 ram2x1 (addy[5:0], WR, clk, x[1], Di[31:24], dosig1[31:24]);
	RAM64x8 ram2x2 (addy[5:0], WR, clk, x[1], Di[23:16], dosig1[23:16]);
	RAM64x8 ram2x3 (addy[5:0], WR, clk, x[1], Di[15:8], dosig1[15:8]);
	RAM64x8 ram2x4 (addy[5:0], WR, clk, x[1], Di[7:0], dosig1[7:0]);
	
	RAM64x8 ram3x1 (addy[5:0], WR, clk, x[2], Di[31:24], dosig2[31:24]);
	RAM64x8 ram3x2 (addy[5:0], WR, clk, x[2], Di[23:16], dosig2[23:16]);
	RAM64x8 ram3x3 (addy[5:0], WR, clk, x[2], Di[15:8], dosig2[15:8]);
	RAM64x8 ram3x4 (addy[5:0], WR, clk, x[2], Di[7:0], dosig2[7:0]);
	
	RAM64x8 ram4x1 (addy[5:0], WR, clk, x[3], Di[31:24], dosig3[31:24]);
	RAM64x8 ram4x2 (addy[5:0], WR, clk, x[3], Di[23:16], dosig3[23:16]);
	RAM64x8 ram4x3 (addy[5:0], WR, clk, x[3], Di[15:8], dosig3[15:8]);
	RAM64x8 ram4x4 (addy[5:0], WR, clk, x[3], Di[7:0], dosig3[7:0]);
	
	assign Do=x[0]? dosig0:32'bZ;
	assign Do=x[1]? dosig1:32'bZ;
	assign Do=x[2]? dosig2:32'bZ;
	assign Do=x[3]? dosig3:32'bZ;
endmodule 