import uvm_pkg::*;
`include "uvm_macros.svh"
`include "mux_intf.sv"
`include "mux_dut.sv"
`include "mux_seq_item.sv"
`include "mux_seq.sv"
`include "mux_seqr.sv"
`include "mux_drv.sv"
`include "mux_mon1.sv"
`include "mux_mon2.sv"
`include "mux_agent1.sv"
`include "mux_agent2.sv"
`include "mux_sb.sv"
`include "mux_env.sv"
`include "mux_test.sv"

module top();

m_intf intf();
mux1 V_code(intf);

initial
begin
  uvm_config_db #(virtual m_intf)::set(uvm_root::get(),"*","intf",intf);
run_test("test");
end
endmodule
