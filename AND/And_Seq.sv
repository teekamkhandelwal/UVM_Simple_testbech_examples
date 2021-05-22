class and_seq extends uvm_sequence #(and_seq_item);
`uvm_object_utils(and_seq)

and_seq_item pkt;
function new(string name="and_seq");
  super.new(name);
  
endfunction

task body();
  
  pkt=and_seq_item::type_id::create("pkt");
  repeat(10)
  begin
    start_item(pkt);
    
    assert(pkt.randomize());
    finish_item(pkt);
    `uvm_info("AND Seq",$sformatf("A=%b, B=%b", pkt.A, pkt.B), UVM_NONE);
  end
endtask
endclass