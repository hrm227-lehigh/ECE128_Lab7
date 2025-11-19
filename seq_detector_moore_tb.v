module seq_detector_moore_tb;
reg p1, clk, rst;
wire y;

seq_detector_moore uut(.p1(p1), .clk(clk), .rst(rst), .y(y));
initial begin
clk = 1'b0;
rst = 1'b1;
p1 = 1'b0;
#15 rst = 1'b0;
end

always #5 clk = ~clk;

initial begin
	#10 p1 = 1; #10 p1 = 1;#10 p1 = 0;#10 p1 = 0;
	#10 p1 = 1; #10 p1 = 0;#10 p1 = 0;#10 p1 = 1;
	#10 p1 = 1; #10 p1 = 0;#10 p1 = 0;#10 p1 = 0;
	#10 p1 = 1; #10 p1 = 1;#10 p1 = 0;#10 p1 = 0;
	#10 $stop;

end

endmodule