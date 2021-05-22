

class driver extends uvm_driver #(mux_seq_item);
`uvm_component_utils(driver)

mux_seq_item pkt;//instantiatoion sequ_item
virtual m_intf intf;
//new constructor
function new(string name= "driver",uvm_component parent);
super.new(name,parent);
endfunction
//build phase 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
//configuration
uvm_config_db #(virtual m_intf)::get(this,"","intf",intf);
endfunction
//run task
task run_phase(uvm_phase phase);
pkt=mux_seq_item::type_id::create("pkt");
forever 
begin 
seq_item_port.get_next_item(pkt);
#5
intf.in=pkt.in;
intf.sel=pkt.sel;
`uvm_info("driver transaction",$sformatf("in=%b,sel=%b",intf.in,intf.sel),UVM_NONE);
seq_item_port.item_done();
end
endtask

endclass

