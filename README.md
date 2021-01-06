# -7-4-Hamming-code
Design (7, 4) Hamming code encoder and decoder.
• Hamming code adds 3 parity bits to each 4-bit word of data.
• The input should be a serial bit stream, the output is a serial bit stream at
higher rate.
• The input data rate is 4 Mbit/s, the output data rate should be 7 Mbit/s.
• Design the encoder and decoder using Verilog HDL.
• Write a testbench that gets binary data stream as input, feeds the input to
the encoder, then feeds the encoder output to the decoder, then checks
that the encoder input and decoder output are identical.
The (7,4) Hamming code encodes 4-bits message using only 3-parity bits for a total of 7-bits, each of the 3-parity bits are parity for 3 of the 4-data bits, and no 2-parity bits are for the same 3-data bits. All of the parity bits are even parity   The total 7-bits are arranged using a special layout plan that is determined by creating a 4×7 generator matrix [G] which was implemented by R.W Hamming using these equations -comes from parity bit definitions- and some mathematics   
Before we Continue to illustrate the (7,4) Hamming code decoder circuit, we’ll add two sequential logical circuits to match the design requirements: 
1.	To make the input data be a serial bit stream, we will use a (SIPO) Shift register before the (7,4) hamming code encoder circuit. 
2.	To make input-data rate be 4 Mbit/s, we’ll use a 4-bits counter with the same clock (40 MHZ) that fed to the (SIPO) shift register. 
To match the design requirements, we’ll add two sequential logical circuits such as we did for the encoder, but now for the (7,4) hamming code decoder: -
1.	To make the output data be a serial bit stream, we will use a (PISO) Shift register aftre the (7,4) hamming code Decoder circuit.
To match the design requirements, we’ll add two sequential logical circuits such as we did for the encoder, but now for the (7,4) hamming code decoder: -
1.	To make the output data be a serial bit stream, we will use a (PISO) Shift register aftre the (7,4) hamming code Decoder circuit.
