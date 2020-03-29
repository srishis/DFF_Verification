class dff_env;

	// instantiate all classes in environment
	dff_generator gen;
	dff_driver drv;
	dff_monitor mon;
	dff_coverage cov;
	dff_scoreboard sb;
	
	// create object for all classes
	function new();
		gen =	new();
		drv =	new();
		mon =	new();
		cov =	new();
		sb  =	new();
	endfunction

	// call all run methods of each call in fork-join_none
	task run();
		fork
		gen.run();
		drv.run();
		mon.run();
		cov.run();
		sb.run();
		join_none
	endtask

endclass