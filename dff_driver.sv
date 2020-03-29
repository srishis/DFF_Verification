class dff_driver;
	
	// transaction class handle (not object!) to use in this class
	dff_transaction tx;
	// As driver interacts with the interface it needs a virtual interface handle!
	virtual dff_if.DRIVER vif;
	
	int num_trans = 0;
	
	function new();
		this.vif = dff_cfg::vif;	// pass interface from top to each class which needs it as virtual interface handle
	endfunction
	
	task run();
		forever begin
		// get transactions from generator class using gen2drv mailbox get() method
		dff_cfg::gen2drv.get(tx);
		// drive transactions to DUT
		drive_trans(tx);
		num_trans++;
	end
	endtask
	
	// task to drive transactions/inputs to DUT
	task drive_trans(dff_trans tx)
		// drive transactions/inputs at clock edge using clocking block
		@(vif.dff_cb)
		vif.d = tx.d;		// convert object level information(tx) to signal level(vif) to drive it to the DUT
	endtask
	
endclass
