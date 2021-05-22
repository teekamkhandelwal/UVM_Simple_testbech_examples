class and_seqr extends uvm_sequencer #(and_seq_item);

`uvm_component_utils(and_seqr)

function new(string name="and_seqr", uvm_component parent);
  super.new(name, parent);
endfunction

endclass