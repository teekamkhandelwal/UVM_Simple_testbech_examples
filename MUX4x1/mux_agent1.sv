class mux_agent1 extends uvm_agent;

`uvm_component_utils(mux_agent1)

mux_seqr seqr;
mux_driver drv;
mux_MON1 mon1;

function new (string name="mux_agent1", uvm_component parent);
super.new(name, parent);

endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seqr=mux_seqr::type_id::create("seqr", this);
  drv=mux_driver::type_id::create("drv", this);
  mon1=mux_MON1::type_id::create("mon1", this);
endfunction

virtual function void connect_phase(uvm_phase phase);
  
  super.connect_phase(phase);
  
  drv.seq_item_port.connect(seqr.seq_item_export);
  
endfunction

endclass
  
  
