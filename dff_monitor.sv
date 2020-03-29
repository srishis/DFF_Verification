class dff_monitor;

	// transaction class handle (not object!) to use in this class
	dff_transaction tx;
	// As monitor interacts with the interface it needs a virtual interface handle!
	virtual	dff_if.MON vif;

	function new();
		this.vif = dff_cfg::vif;
	endfunction

	task run();
		forever begin
		// always create a new transaction object for each transaction to avoid conflicts
		tx 	= new;		// transaction class object created
		tx.d 	= vif.d;
		tx.q 	= vif.q;
		tx.qbar = vif.qbar;
		dff_cfg::mon2cov.put(tx);		// send transaction to coverage module
		dff_cfg::mon2sb.put(tx);		// send transaction to scoreaboard/checker
		end
	endtask

endclass
