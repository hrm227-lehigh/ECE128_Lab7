module seq_detector_mealy(
input clk, rst, p1,
output reg y
);

parameter s0 = 2'b0,s1 = 2'b1,s2 = 2'b10,s3 = 2'b11;

reg [1:0] ps,ns;

//state initialization
always@(posedge clk or posedge rst)
begin
	if(rst)
		ps <= s0;
	else
		ps <= ns;
end

//state transition
always@(ps or p1)
begin
	case(ps)
		s0:
		begin
			y=1'b0;
			if(p1)
				ns <= s1;
			else
				ns <=s0;
		end
		
		s1:
		begin
			if(p1)
				ns <= s2;
			else
				ns <=s0;
		end
		s2:
		begin
			if(!p1)
				ns <= s3;
			else
				ns <=s2;
		end
		s3:
		begin
			if(p1)begin
				ns <= s0;
				
			end
			else
				ns <=s0;
		end
	
	endcase

end

//output
always@(ps or p1)//MEALY
//always@(ps)    //MOORE
begin
	case(ps)
		s0: y = 1'b0;
		s1: y = 1'b0;
		s2: y = 1'b0;
		s3:
		begin
			if(p1)
				y=1'b1;
		end
	endcase

end

endmodule