module dff_top;
	
	parameter CLK_PERIOD 	 = 5;
	parameter GLOBAL_TIMEOUT = 1000;
	
	// top level clock and reset signals
	bit clk, rst;

	//generate top level clock to be passed to the design and test bench
	initial begin
		clk = 0;				// not required as declared bit, why?
		forever #CLK_PERIOD clk = ~clk;		// assuming 100Mhz clock frequency hence #5ns, calculate the time period based on system clock requirements
	end

// Lift global reset
 initial begin
   repeat(1) @(posedge clk);
   rst = 1;
   // wait few clocks cycles for system to stabilize before lifting reset, varies from design to design based on the complexity 
   //it might be even as high as 1000 clock cycles for an complex SoC, refer architectural specifications for getting the number
   repeat(10) @(posedge clk);	
   rst = 0;
 end
 
	// DFF main physical interface instantiation
	dff_if pif(clk, rst);

	// DFF design instantiation
	dff DUT (pif);

	// DFF Testbench instantiation
	dff_tb TB ();
	
	// DFF assertion binding to DFF design and instantiation
	bind dff dff_assertions DA (pif);
	
	// hook up design and Testbench using physical interface handle pif to virtual interface handle
	initial begin
	dff_cfg::vif = pif;
	end
	
	 // Test case ending using finish
	 initial begin
  	 	#GLOBAL_TIMEOUT;
  	 	$finish;
 	end

endmodule
