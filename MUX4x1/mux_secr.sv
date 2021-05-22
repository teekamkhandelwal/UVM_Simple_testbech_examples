class mux_seqr extends uvm_sequencer #(mux_seq_item);

`uvm_component_utils(mux_seqr)

function new(string name="mux_seqr", uvm_component parent);
  super.new(name, parent);
endfunction

endclass
