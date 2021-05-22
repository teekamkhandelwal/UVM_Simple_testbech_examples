class and_seq_item extends uvm_sequence_item;

`uvm_object_utils(and_seq_item)
randc bit A, B;
     bit Y;
     
  function new(string name="and_seq_item");
  super.new(name);
  endfunction

  endclass