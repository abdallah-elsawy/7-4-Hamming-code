module decoder(data_in , data_out);

input [6:0] data_in;
output [3:0] data_out;

wire test1;
wire test2;
wire test3;

reg [6:0] tester;

assign test1 = data_in[0] ^ data_in[2] ^ data_in[4] ^ data_in[6];
assign test2 = data_in[1] ^ data_in[2] ^ data_in[5] ^ data_in[6];
assign test3 = ^ data_in[6:3];


always @(*) begin

case({test3, test2, test1})
3'b011: tester = data_in ^ 7'b0000100;
3'b101: tester = data_in ^ 7'b0010000;
3'b110: tester = data_in ^ 7'b0100000;
3'b111: tester = data_in ^ 7'b1000000;
default tester = data_in;
endcase
end
assign data_out = {tester[6:4],tester[2]};
endmodule
