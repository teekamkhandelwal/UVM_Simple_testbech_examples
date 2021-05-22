class seq extends uvm_sequence #(mux_seq_item);
`uvm_object_utils(seq)

mux_seq_item pkt;
function new(string name="seq");
super.new(name);
endfunction

task body();
pkt=mux_seq_item::type_id::create("pkt");
repeat(10);
begin
#5
start_item(pkt);

assert(pkt.randomize());
finish_item(pkt);
`uvm_info("seq transaction",$sformatf("in=%b sel=%b",pkt.in,pkt.sel),UVM_NONE);
end
endtask

endclass
