class dff_env;

	// instantiate all classes in environment
	dff_generator gen;
	dff_driver drv;
	dff_monitor mon;
	dff_coverage cov;
	dff_scoreboard sb;
	dff_ref_model rm;
	
	// create object for all classes
	function new();
		gen =	new();
		drv =	new();
		mon =	new();
		cov =	new();
		sb  =	new();
		rm  =   new();
	endfunction

	// call all run methods of each call in parallel using fork-join_none
	task run();
		fork
		gen.run();
		drv.run();
		mon.run();
		cov.run();
		sb.run();
		rm.run();
		join_none
	endtask

	task report();
		// errors should be zero for test pass
		//also check for Number of transactions generated and processed match
		if((dff_cfg::error_count != 0) && (gen.num_trans != sb.num_trans)) 	
			$display("Test failed with errors = %d", dff_cfg::error_count);
		else
			$display("TEST PASS: DFF Works as expected!!!");
	endtask
	
endclass
