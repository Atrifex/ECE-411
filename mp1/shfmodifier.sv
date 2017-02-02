import lc3b_types::*;

module shfmodifier #(parameter width = 4)
(
	input A,D, SR_15,
	input [width-1:0] in,
	output lc3b_word out
);

always_comb
begin
	if(D == 1'b0) begin
		out = {12'h000,in};
	end else begin
		if(A == 1'b0) begin
			out = {11'h000,in,1'b0};
		end else begin
			out = {11'h000,in,SR_15};			
		end		
	end
end

endmodule : adj
