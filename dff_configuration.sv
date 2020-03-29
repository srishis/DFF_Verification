class dff_cfg;
  
  // create all mailboxes required in the environment 
  static mailbox gen2drv;
  static mailbox mon2cov;
  static mailbox mon2sb;
  
  // create virtual interface handle to pass to all classes from top
  static virtual dff_if vif;

endclass
