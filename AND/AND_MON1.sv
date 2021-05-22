class and_MON1 extends uvm_monitor;

`uvm_component_utils(and_MON1)

and_seq_item pkt;

virtual and_if intf;


uvm_analysis_port #(and_seq_item) MON12SB;

function new(string name="and_MON1", uvm_component parent);
super.new(name, parent);
MON12SB=new("MON12SB",this);
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
    pkt.A=intf.A;
    pkt.B=intf.B;
    
    `uvm_info("MON1", $sformatf("A=%b, B=%b", pkt.A, pkt.B),UVM_NONE);
    MON12SB.write(pkt);
  end
endtask
endclass
    