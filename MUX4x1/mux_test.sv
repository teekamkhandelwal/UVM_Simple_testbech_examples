class mux_test extends uvm_test;
 
 `uvm_component_utils(mux_test)
 
 
 mux_seq seq;
 mux_env ENV;
 
 function new(string name="mux_test", uvm_component parent);
 
 super.new(name, parent);
 
 endfunction
 
 
 virtual function void build_phase(uvm_phase phase);
   
   super.build_phase(phase);
seq=mux_seq::type_id::create("seq", this);   
ENV=mux_env::type_id::create("ENV", this);
endfunction

task run_phase(uvm_phase phase);
  begin
  phase.raise_objection(this);
  seq.start(ENV.ag1.seqr);
  phase.drop_objection(this); 
end
endtask

endclass

