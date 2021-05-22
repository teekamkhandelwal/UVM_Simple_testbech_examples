interface mux_if();

logic [3:0] in;
logic [1:0] sel;
logic out;

modport DUT(input in, input sel, output out);
endinterface
