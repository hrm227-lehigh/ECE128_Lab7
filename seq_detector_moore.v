module seq_detector_moore(
input p1, clk, rst,
output reg y
);

parameter s0 = 0,s1 = 2'b01,s2 = 2,s3 = 3;

reg [1:0] ps,ns;

//state initialization
always@(posedge clk or posedge rst)
begin
	if(rst)
		ps <= s0;
	else
		ps <= ns ;
end


//state translation
always@(ps or p1)
begin
	case(ps)
		s0:
		begin
			y=0;
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
			if(p1)
				ns <= s0;
			else
				ns <=s0;
		end
	
	endcase

end



//output
//always@(ps or p1)//MEALY
always@(ps)        //MOORE
begin
	case(ps)
		s0: y = 0;
		s1: y = 0;
		s2: y = 0;
		s3: y = 1;
	endcase

end

endmodule