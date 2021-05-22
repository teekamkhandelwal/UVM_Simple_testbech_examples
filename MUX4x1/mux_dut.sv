module mux_DUT(mux_if.DUT intf);
	assign intf.out = intf.in[intf.sel[1] * 2 + intf.sel[0]];
endmodule
