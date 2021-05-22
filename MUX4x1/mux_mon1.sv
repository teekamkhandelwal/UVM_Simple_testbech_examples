class mux_MON1 extends uvm_monitor;

`uvm_component_utils(mux_MON1)

mux_seq_item pkt;

virtual mux_if intf;


uvm_analysis_port #(mux_seq_item) MON12SB;

function new(string name="mux_MON1", uvm_component parent);
super.new(name, parent);
MON12SB=new("MON12SB",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);

uvm_config_db #(virtual mux_if)::get(this,"", "intf", intf);
endfunction

task run_phase(uvm_phase phase);
  
  pkt=mux_seq_item::type_id::create("pkt");
  forever
  begin
    #5
    pkt.in[0]=intf.in[0];
pkt.in[1]=intf.in[1];
pkt.in[2]=intf.in[2];
pkt.in[3]=intf.in[3];

  pkt.sel[0]=intf.sel[0];
 pkt.sel[1]=intf.sel[1];
    
    `uvm_info("MON1", $sformatf("in=%b, sel=%b", pkt.in, pkt.sel),UVM_NONE);
    MON12SB.write(pkt);
  end
endtask
endclass
    
