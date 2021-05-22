class env extends uvm_env;
`uvm_component_utils(env)

agent1 ag1;
agent2 ag2;
sb s1;

function new(string name="env",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
ag1=agent1::type_id::create("ag1",this);
ag2=agent2::type_id::create("ag2",this);
s1=sb::type_id::create("s1",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 ag1.m1.MON12SB.connect(s1.ip_fifo.analysis_export);
 ag2.m2.MON22SB.connect(s1.op_fifo.analysis_export);
endfunction
endclass