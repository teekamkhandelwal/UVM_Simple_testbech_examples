class and_sb extends uvm_scoreboard;
`uvm_component_utils(and_sb)

and_seq_item pkt1, pkt2;

uvm_tlm_analysis_fifo #(and_seq_item) ip_fifo;
uvm_tlm_analysis_fifo #(and_seq_item) op_fifo;

function new(string name="and_sb", uvm_component parent);
  super.new(name, parent);
  ip_fifo=new("ip_fifo", this);
  op_fifo=new("op_fifo", this);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  pkt1=and_seq_item::type_id::create("pkt1",this);
  pkt2=and_seq_item::type_id::create("pkt2",this);
endfunction

task run_phase(uvm_phase phase);
  forever
  begin
    fork
    ip_fifo.get(pkt1);
    op_fifo.get(pkt2);
    join
    
    if(pkt2.Y==(pkt1.A & pkt1.B))
      begin
      `uvm_info("SB Matched", $sformatf("pkt1.A=%b,pkt1.B=%b, pkt2.Y=%b",pkt1.A, pkt1.B, pkt2.Y),UVM_NONE);
     end
     else
       begin
      `uvm_info("SB Not Matched ", $sformatf("pkt1.A=%b,pkt1.B=%b, pkt2.Y=%b",pkt1.A, pkt1.B, pkt2.Y),UVM_NONE);
       end
   end
 endtask
 endclass