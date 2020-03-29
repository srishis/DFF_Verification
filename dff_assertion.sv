module dff_assertion(dff_if dif);

// reset check
property check_reset_p;
  @(posedge dif.clk) dif.reset |-> ((dif.q == 0) && (dif.qbar == 1));
endproperty

// D input check
property check_d_input_p;
 @(posedge dif.clk) disable iff (reset) (q == $past(d));
endproperty

// assert property to check if it fails
// cover property to ensure that it is hit by the test cases written (refer code coverage report or on GUI)
ACHECK_RESET: assert property(check_reset_p);
cover property(check_reset_p);

ACHECK_D:     assert property(check_d_input_p);
cover  assert property(check_d_input_p);

endmodule
