import uvm_pkg::*;
`include "uvm_macros.svh"
`include "mux_interface.sv"
`include "mux_dut.sv"
`include "mux_seq_item.sv"
`include "mux_seq.sv"
`include "mux_secr.sv"
`include "mux_driver.sv"
`include "mux_mon1.sv"
`include "mux_mon2.sv"
`include "mux_agent1.sv"
`include "mux_agent2.sv"
`include "mux_sb.sv"
`include "mux_env.sv"
`include "mux_test.sv"

module mux_top();

mux_if intf();
mux_DUT V_code(intf);

initial
begin
  uvm_config_db #(virtual mux_if)::set(uvm_root::get(),"*","intf",intf);
run_test("mux_test");
end
endmodule
