class mux_driver extends uvm_driver #(mux_seq_item);
`uvm_component_utils(mux_driver)

mux_seq_item pkt;
virtual mux_if intf;

function new(string name="mux_driver", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db #(virtual mux_if)::get(this,"","intf",intf);
endfunction

task run_phase(uvm_phase phase);
   
  pkt=mux_seq_item::type_id::create("pkt");
 forever
   begin
  seq_item_port.get_next_item(pkt);
  #5
  intf.in[0]=pkt.in[0];
intf.in[1]=pkt.in[1];
intf.in[2]=pkt.in[2];
intf.in[3]=pkt.in[3];

  intf.sel[0]=pkt.sel[0];
 intf.sel[1]=pkt.sel[1];

  
  `uvm_info("DRV Transaction", $sformatf("in=%b, sel=%b", intf.in, intf.sel),UVM_NONE);
  seq_item_port.item_done();
end
endtask
endclass
