
class mon1 extends uvm_monitor;
`uvm_component_utils(mon1)
mux_seq_item pkt;

virtual m_intf intf;

uvm_analysis_port #(mux_seq_item) MON12SB;

function new(string name="mon1",uvm_component parent);
super.new(name,parent);
MON12SB=new("MON12SB",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);

uvm_config_db #(virtual m_intf)::get(this,"","intf",intf);
endfunction

task run_phase(uvm_phase phase);
pkt=mux_seq_item::type_id::create("pkt");
forever
begin

#5
pkt.in=intf.in;
pkt.sel=intf.sel;
`uvm_info("mon1 transaction",$sformatf("in=%b, sel=%b",pkt.in,pkt.sel),UVM_NONE);
end
endtask

endclass
