import uvm_pkg::*;
`include "uvm_macros.svh"
`include "AND_Interface.sv"
`include "AND_DUT.sv"
`include "And_Seq_Item.sv"
`include "And_Seq.sv"
`include "And_Secr.sv"
`include "AND_Driver.sv"
`include "AND_MON1.sv"
`include "AND_MON2.sv"
`include "AND_Agent1.sv"
`include "AND_agent2.sv"
`include "AND_SB.sv"
`include "AND_ENV.sv"
`include "AND_Test.sv"

module and_top();

and_if intf();
and_DUT V_code(intf);

initial
begin
  uvm_config_db #(virtual and_if)::set(uvm_root::get(),"*","intf",intf);
run_test("and_test");
end
endmodule