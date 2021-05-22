class agent1 extends uvm_agent;
`uvm_component_utils(agent1)
seqr sr;
driver dr;
mon1 m1;

function new(string name="agent1",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
sr=seqr::type_id::create("sr",this);
dr=driver::type_id::create("dr",this);
m1=mon1::type_id::create("mon1",this);
endfunction

virtual function void connect_phase(uvm_phase phase);

super.connect_phase(phase);
dr.seq_item_port.connect(sr.seq_item_export);
endfunction

endclass
