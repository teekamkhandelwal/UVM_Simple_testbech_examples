class test extends uvm_test;
`uvm_component_utils(test)

seq s1;
env e1;

function new(string name="test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
s1=seq::type_id::create("s1",this);
e1=env::type_id::create("e1",this);
endfunction

task run_phase(uvm_phase phase);
begin
phase.raise_objection(this);
s1.start(e1.ag1.sr);
phase.drop_objection(this);
end

endtask
endclass
