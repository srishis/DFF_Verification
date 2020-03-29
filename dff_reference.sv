class dff_ref_model;

  dff_transaction tx, tx_copy;
  
  task run();
    forever begin
      dff_cfg::gen2ref.get(tx);
      tx_copy.copy(tx);
      
      if(tx_copy.d == 0) begin tx_copy.q = 0; tx_copy.qbar = 1; end
      else               begin tx_copy.q = 1; tx_copy.qbar = 0; end
      
      dff_cfg::ref2sb.put(tx_copy);
    end  
  endtask
  
endclass
