function void verify_add(GUVM_sequence_item cmd_trans,GUVM_result_transaction res_trans,GUVM_history_transaction hist_trans);
	bit [31:0]hc,i1,i2,h1 ;
	i1 = hist_trans.get_reg_data(cmd_trans.rs1); 
	i2 = hist_trans.get_reg_data(cmd_trans.rs2); 
	h1 = i1 + i2 ;
	hist_trans.updateflags (h1);
	if (cmd_trans.v == 1)
	begin	
		hc = res_trans.result;
		if((h1) == (hc))
		begin
			`uvm_info ("ADDITION_PASS", $sformatf("Actual Calculation=%d Expected Calculation=%d ", hc, h1), UVM_LOW)
		end
		else
		begin
			`uvm_error("ADDITION_FAIL", $sformatf("Actual Calculation=%d Expected Calculation=%d ", hc, h1))
		end
	end
endfunction