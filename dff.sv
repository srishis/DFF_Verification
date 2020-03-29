module dff(dff_if.DUT dif);

	assign dif.qbar = ~dif.q;
	
	always_ff@(posedge dif.clk) begin
		if(dif.rst)	dif.q <= '0;
		else begin
			assert(!$isunknown(dif.d));		// design assertion to catch if D input provided to the design is unknown
			dif.q <= dif.d;
		end	
	end

endmodule
