module top(
input clk,
output [3:0] seg_an,
output [6:0] seg_cat
);

wire [11:0] bin_cnt;
wire cnt_done;
counter C1(.clk(clk), .done(cnt_done), .bin_cnt(bin_cnt));


wire [15:0] bcd_val;
wire bcd_rdy;
BintoBCD B1(.clk(clk), .en(cnt_done), .bin_in(bin_cnt), .bcd_out(bcd_val), .rdy(bcd_rdy));

multiseg_driver M1(.clk(clk), .bcd_in(bcd_val), .seg_an(seg_an), .seg_cat(seg_cat));


endmodule