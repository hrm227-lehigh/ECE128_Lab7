module BintoBCD_tb;

reg clk;
reg en;
reg [11:0] bin_in;
wire [15:0] bcd_out;
wire rdy;

BintoBCD uut(.clk(clk), .en(en), 
.bin_in(bin_in), .bcd_out(bcd_out), .rdy(rdy));
always begin
    clk = 1'b1;
    #1;
    clk = 1'b0;
    #1;
end

initial begin

	bin_in = 12'd2048;     en = 1; #1 en = 0; wait (rdy == 1);
	#10 bin_in = 12'd3;    en = 1; #1 en = 0;  wait (rdy == 1);
	#10 bin_in = 12'd23;   en = 1; #1 en = 0;  wait (rdy == 1);
	#10 bin_in = 12'd812;  en = 1; #1 en = 0;  wait (rdy == 1);
	#10 bin_in = 12'd145;  en = 1; #1 en = 0;  wait (rdy == 1);
	#10 bin_in = 12'd89;   en = 1; #1 en = 0;  wait (rdy == 1);
	#10 bin_in = 12'd106;  en = 1; #1 en = 0;  wait (rdy == 1);
	#10 bin_in = 12'd1002; en = 1; #1 en = 0;  wait (rdy == 1);
	#10 $stop;
end

endmodule