module counter
 #( parameter N = 2,
	parameter DOWN = 0)
 ( input clk,
 input rstn,
 input en,
 output reg [N-1:0] out);
 always @ (posedge clk) begin
 if (!rstn) begin
 out <= 0;
 end else begin
 if (en)
 if (DOWN)
 out <= out - 1;
 else
 out <= out + 1;
 else
 out <= out;
 end
 end
endmodule