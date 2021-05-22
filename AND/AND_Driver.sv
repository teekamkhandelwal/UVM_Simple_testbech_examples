class and_driver extends uvm_driver #(and_seq_item);
`uvm_component_utils(and_driver)

and_seq_item pkt;
virtual and_if intf;

function new(string name="and_driver", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db #(virtual and_if)::get(this,"","intf",intf);
endfunction

task run_phase(uvm_phase phase);
   
  pkt=and_seq_item::type_id::create("pkt");
 forever
   begin
  seq_item_port.get_next_item(pkt);
  #5
  intf.A=pkt.A;
  intf.B=pkt.B;
  
  `uvm_info("DRV Transaction", $sformatf("A=%b, B=%b", intf.A, intf.B),UVM_NONE);
  seq_item_port.item_done();
end
endtask
endclass