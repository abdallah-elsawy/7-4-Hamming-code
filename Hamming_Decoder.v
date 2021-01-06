module Hamming_Decoder(
input clk1,
input clk2,
input s_in,
input reset,
output s_out
);

//input register
wire [6:0] parallel_in;
ShiftRegister #(.WIDTH(7)) 
reg_in(
.clk(clk1),
.reset(0),
.write(0),
.shift(1),
.serial_in(s_in),
.data_in(0),
.data_out(parallel_in)
);

//decoder
wire [3:0] parallel_out;

decoder dec(
.data_in(parallel_in),
.data_out(parallel_out)
);

//counter
wire countfull;

counter_4bit counter (
.clk(clk2),
.en(1),
.reset(reset),
.full(countfull)
);

//output register
ShiftRegister #(.WIDTH(4)) 
reg_out (
.clk(clk2),
.reset(0),
.write(countfull),
.shift(1),
.data_in(parallel_out),
.serial_out(s_out)
);

endmodule





