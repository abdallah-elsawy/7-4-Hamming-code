module encoder(data_in,data_out);
input [3:0] data_in;
output [6:0] data_out;

wire p1;
wire p2;
wire p3;

assign p1 = (data_in[0] ^ data_in[1] ^ data_in[3]);
assign p2 = (data_in[0] ^ data_in[2] ^ data_in[3]);
assign p3 = (data_in[1] ^ data_in[2] ^ data_in[3]);
assign data_out = {data_in[3],data_in[2],data_in[1],p3,data_in[0],p2,p1};

endmodule

