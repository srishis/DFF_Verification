program dff_tb;

	// instantiate environment class
	dff_env env;
	
	// create env class object and call run method which triggers the call chain of run methods in each sub-class in the environment
	initial begin
		env = new();
		env.run();
		env.report();
	end


endprogram
