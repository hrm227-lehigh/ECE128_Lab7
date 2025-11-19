module seq_detector_mealy_tb;
reg clk, rst, p1;
wire y;

seq_detector_mealy uut(.clk(clk), .rst(rst), .p1(p1), .y(y));

initial begin
clk = 1'b0;
rst = 1'b1;
p1 = 1'b0;
#15 rst = 1'b0;
end

always #5 clk = ~clk;

initial begin
	#10 p1 = 1; #10 p1 = 1;#10 p1 = 0;#10 p1 = 1;
	#10 p1 = 1; #10 p1 = 0;#10 p1 = 0;#10 p1 = 1;
	#10 p1 = 1; #10 p1 = 0;#10 p1 = 1;#10 p1 = 0;
	#10 p1 = 1; #10 p1 = 1;#10 p1 = 0;#10 p1 = 1;
	#10 $stop;

end
endmodule