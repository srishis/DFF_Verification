module dff_top;

	// top level clock and reset signals
	bit clk, rst;

	//generate top level clock to be passed to the design and test bench
	initial begin
		clk = 0;					// not required as declared bit, why?
		forever #5 clk = ~clk;	// assuming 100Mhz clock frequency hence #5ns, calculate the time period based on system clock requirements
	end

// Lift global reset
 initial begin
   rst = 1;
   // wait few clocks cycles for system to stabilize before lifting reset, varies from design to design based on the complexity 
   //it might be even as high as 1000 clock cycles for an complex SoC, refer architectural specifications for getting the number
   repeat(10) @(posedge clk);	
   rst = 0;
 end
 
	// DFF main interface instantiation
	dff_if pif(clk, rst);

	// DFF design instantiation
	dff dut(pif);

	// DFF Testbench instantiation
	dff_tb tb;

	// hook up design and Testbench using physical interface handle pif to virtual interface handle
	initial begin
	dff_cfg::vif = pif;
	end

endmodule
