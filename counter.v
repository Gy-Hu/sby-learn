module counter(input clk, input rst, input load, input [3:0] val,  output reg [3:0] counter1, output reg [3:0] counter2);

always @(posedge clk) begin
	if (rst) begin
	  counter1 <= 0;
	end else begin
	  counter1 <= load ? val : counter2 + 1;
	end
end

wire w = counter1 - 1;

always @(posedge clk) begin
	if (rst) begin
	  counter2 <= 0;
	end else begin
	  counter2 <= load ? ~val : counter1 - 1 + w;
	end
end

assert property (w==0);


endmodule


