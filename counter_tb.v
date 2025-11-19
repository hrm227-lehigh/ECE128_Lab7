module counter_tb;
reg clk;
wire done;
wire [11:0] bin_cnt;

counter uut(.clk(clk), .done(done), .bin_cnt(bin_cnt));

always begin
    clk = 1'b1;
    #1;
    clk = 1'b0;
    #1;
end

initial begin
	#1000000000 $stop;
end
endmodule