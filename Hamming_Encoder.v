module Hamming_Encoder(
input clk1,
input clk2,
input reset,
input s_in,
output s_out
);


//register input
wire [3:0] parallel_in;

ShiftRegister #(.WIDTH(4)) 
reg_in (
.clk(clk1),
.reset(0),
.write(0),
.shift(1),
.serial_in(s_in),
.data_in(0),
.data_out(parallel_in)
);

//encoder
wire [6:0] parallel_out;

encoder enc (
.data_in(parallel_in),
.data_out(parallel_out)
);

//counter_4bit
wire countfull;

counter_4bit counter(
.clk(clk1),
.en(1),
.reset(reset),
.full(countfull)
);

//output register

ShiftRegister #(.WIDTH(7))

reg_out (
.clk(clk2),
.reset(0),
.write(countfull),
.shift(1),
.data_in(parallel_out),
.serial_out(s_out)
);


endmodule



`timescale 1ns / 1ps
module Hamming_Encoder_tb ;
reg reset;
reg clk;
reg  s_in;
wire  s_out;
    
hamming_encoder uut(.reset(reset),.clk1(clk1),.clk2(clk2),.s_in(s_in),.s_out(s_out));

     parameter CLK_PERIOD=20;
	
always begin
		clk=~clk;
	
		#(CLK_PERIOD/2);
	end
		
				
		
		initial begin
		
		reset = 0;
		
		clk= 0;

		s_in = 0;

		
		@(posedge clk1,clk2);
		
		#1;
		
		reset=1;
		

		
		#(CLK_PERIOD);
		
        s_in = 4'b1011;
     #(CLK_PERIOD);
        s_in = 4'b1011;
     #(CLK_PERIOD);
        s_in = 4'b1111;
     #(CLK_PERIOD);
        s_in = 4'b1001;
       #(CLK_PERIOD);
		

    end
endmodule






