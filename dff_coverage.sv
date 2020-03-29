class dff_cov;

	// transaction class handle (not object!) to use in this class
	dff_transaction tx;
	
	function new();
		tx 		= new;
		dff_cg  = new();
	endfunction
	
	// covergroup for DFF with only one coverpoint for D-input
	covergroup dff_cg;
		D_CP: coverpoint tx.d;
	endgroup
	
	task run();
		forever begin
		dff_cfg::mon2cov.get(tx);		// get the transaction from monitor class
		dff_cg.sample();				// use coverage in built sample() method to sample the transaction for coverage
		end
	endtask

endclass