module dff_assertions(dff_if dif);

// reset check
property check_reset_p;
  @(posedge dif.clk) (dif.rst) |=> (dif.q == 0) ;
endproperty

// D input check
property check_d_input_p;
  @(posedge dif.clk) disable iff (dif.rst) (dif.q == $past(dif.d));
endproperty
  
// Q and Qbar check
  ERROR_Q_AND_QBAR_CANNOT_BE_SAME: assert(dif.q != dif.qbar) $error("Q and QBar cannot be same!!");  
  
// assert property to check if it fails
// cover property to ensure that it is hit by the test cases written (refer code coverage report or on GUI)
  ERROR_IN_RESET_CONDITION: assert property(check_reset_p);
  cover property(check_reset_p);

  ERROR_Q_DID_NOT_FOLLOW_D: assert property(check_d_input_p);
  cover  assert property(check_d_input_p);

endmodule
