class and_MON2 extends uvm_monitor;

`uvm_component_utils(and_MON2)

and_seq_item pkt;
uvm_analysis_port #(and_seq_item) MON22SB;


virtual and_if intf;

function new(string name="and_MON2", uvm_component parent);
super.new(name, parent);
MON22SB=new("MON22SB",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual and_if)::get(this,"", "intf", intf);
endfunction

task run_phase(uvm_phase phase);
  
  pkt=and_seq_item::type_id::create("pkt");
  forever
  begin
    #5
    pkt.Y=intf.Y;
   
    
    `uvm_info("MON2", $sformatf("Y=%b", pkt.Y),UVM_NONE);
    MON22SB.write(pkt);
  end
endtask
endclass