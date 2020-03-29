interface dff_if(input logic clk, rst);

 logic q;
 logic qbar;
 logic d;

//modport for monitor
modport IN_MON (input clk, rst, d, q, qbar);
// modport OUT_MON (input qbar, q);

// Design modport
modport DUT (input d, clk, rst,output qbar, q);

// Driver modport
modport DRIVER (rst, clocking dff_cb);

//clocking block
clocking dff_cb(@posedge clk);
	default input #1 step;
	default output #1 step;
	input q, qbar;
	output d;
endclocking

endinterface
