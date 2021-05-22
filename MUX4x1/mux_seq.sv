class mux_seq extends uvm_sequence #(mux_seq_item);
`uvm_object_utils(mux_seq)

mux_seq_item pkt;
function new(string name="mux_seq");
  super.new(name);
  
endfunction

task body();
  
  pkt=mux_seq_item::type_id::create("pkt");
  repeat(10)
  begin
    start_item(pkt);
    
    assert(pkt.randomize());
    finish_item(pkt);
    `uvm_info("mux Seq",$sformatf("in=%b, sel=%b", pkt.in, pkt.sel), UVM_NONE);
  end
endtask
endclass
