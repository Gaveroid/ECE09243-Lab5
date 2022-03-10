module Decoder(select, enable, x);

	input [1:0] select;
	input enable;
	
	output reg [3:0] x;
	
	always @(select)
	begin
		if (enable==1)
			case (select)
				5'd0: x <= 4'b0001;
				5'd1: x <= 4'b0010;
				5'd2: x <= 4'b0100;
				5'd3: x <= 4'b1000;
			endcase
			else if (enable==0) x <= 4'b0000;
	end
	
endmodule