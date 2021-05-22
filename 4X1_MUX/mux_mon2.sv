
class mon2 extends uvm_monitor;
`uvm_component_utils(mon2)
mux_seq_item pkt;

uvm_analysis_port #(mux_seq_item) MON22SB;

virtual m_intf intf;

function new(string name="mon2",uvm_component parent);
super.new(name,parent);
MON22SB=new("MON22SB",this);
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

pkt.out=intf.out;
`uvm_info("mon22sb transaction",$sformatf("out=%b",pkt.out),UVM_NONE);
 MON22SB.write(pkt);
end

endtask

endclass
