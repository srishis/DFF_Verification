class dff_transaction;

rand bit d;
bit qbar, q;

function void print();
	$display("-----PRINTING TRANSACTION CLASS PROPERTIES---------");
	$display("\t D = %b", tx.d);
	$display("\t Q = %b", tx.q);
	$display("\t QBar = %b", tx.qbar);
	$display("---------------------------------------------------");
endfunction
	
function void copy(output dff_transaction tx);
	tx 	= new();
	tx.d    = this.d;
	tx.qbar = this.qbar;
	tx.q 	= this.q;
endfunction

function compare(input dff_transaction tx);
	if((tx.d != this.d)	||	(tx.qbar != this.qbar)	||	(tx.q != this.q))
		return 0; 							//compare failed
	else
		return 1;							//compare passed
endfunction

endclass
