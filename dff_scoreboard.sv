// In progress
class dff_sb;
  
  //used to count the number of transactions
  int num_trans;
  
  dff_transaction  tx, tx1;
  
  task run();
    
    forever begin
      dff_cfg::mon2sb.get(tx);
      dff_cfg::ref2sb.get(tx1);
      if(tx.d == 0)
        if((tx.q !== tx1.q) && (tx.qbar !== tx1.qbar))
          $display("ERROR:DFF_SCOREBOARD: Mismatch found :: Expected Data = %0p, Actual value = %0p", tx, tx1);
      else if(tx.d == 1)
        if((tx.q !== tx1.q) && (tx.qbar !== tx1.qbar))
          $display("ERROR:DFF_SCOREBOARD: Mismatch found :: Expected Data = %0h, Actual value = %0h");
        
      
    end
    
    
    
  endtask
endclass
