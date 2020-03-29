
class dff_sb;
  
  //used to count the number of transactions
  int num_trans;
  
  dff_transaction  tx, tx1;
  
  task run();
    
    forever begin
      dff_cfg::mon2sb.get(tx);
      dff_cfg::ref2sb.get(tx1);
      if((tx.d == 0) && (tx1.d == 0))
        //if((tx.q !== tx1.q) && (tx.qbar !== tx1.qbar)) begin
        if(!tx1.compare(tx)) begin
          $display("ERROR:DFF_SCOREBOARD: Mismatch found when d is equal to 0 :: Expected Data = %0p, Actual value = %0p", tx, tx1);
          dff_cfg::error_count++;
        end
      else if((tx.d == 1) && (tx1.d == 1))
        //if((tx.q !== tx1.q) && (tx.qbar !== tx1.qbar)) begin
         if(!tx1.compare(tx)) begin
          $display("ERROR:DFF_SCOREBOARD: Mismatch found when d is equal to 1 :: Expected Data = %0p, Actual value = %0p", tx, tx1);
          dff_cfg::error_count++;
        end
      num_trans++;
    end
 
  endtask
endclass
