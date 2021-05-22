class mux_seq_item extends uvm_sequence_item;

`uvm_object_utils(mux_seq_item)
randc bit [3:0] in;
randc bit [1:0] sel;
     bit out;
     
  function new(string name="mux_seq_item");
  super.new(name);
  endfunction

  endclass
