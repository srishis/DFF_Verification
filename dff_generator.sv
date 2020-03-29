class dff_generator;

	dff_transaction tx;
	dff_transaction txQ[$];

task run();
	// test cases for design
	// simple test for DFF with 10 random transactions
	repeat(10) begin
	tx = new();
	if(!tx.randomize())$display("DFF GENERATOR::RANDOMIZATION FAILED");
	txQ.push_back(tx);
	// mailbox for inter communication between classes
	dff_cfg::gen2drv.put(tx); 	// send transaction to Driver to drive it to the DUT using mailbox put() method
end
endtask

endclass