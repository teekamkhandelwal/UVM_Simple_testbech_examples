module mux1(m_intf.m_dut intf);
always@(intf.in,intf.sel) begin
case(intf.sel)
0:intf.out=intf.in[0];
1:intf.out=intf.in[1];
2:intf.out=intf.in[2];
3:intf.out=intf.in[2];
default:intf.out=0;
endcase
end
endmodule
