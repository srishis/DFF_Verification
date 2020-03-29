class dff_generator;

	dff_transaction tx;
	dff_transaction txQ[$];
	int num_trans = 0;

	task run();
	// test cases for design
	// simple test for DFF with 10 random transactions
	repeat(10) begin
	tx = new();
	if(!tx.randomize()) $display("ERROR:DFF GENERATOR::RANDOMIZATION FAILED");
	//txQ.push_back(tx;	
	// mailbox for inter communication between classes
	dff_cfg::gen2drv.put(tx); 	// send transaction to Driver to drive it to the DUT using mailbox put() method
	dff_cfg::gen2ref.put(tx); 	// send transaction to reference model for generating expected values using mailbox put() method
	num_trans++;
	end
endtask

endclass
