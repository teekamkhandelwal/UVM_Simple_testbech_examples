interface m_intf;
logic [3:0] in;
logic [1:0] sel;
logic out;

modport m_dut(input in,input sel,output out);

endinterface
