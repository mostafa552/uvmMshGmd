/*function void verify_JumpAndLink(target_seq_item cmd_trans,GUVM_result_transaction res_trans);
	bit [31:0]actual_r,exp_r,actual_npc,cpc,exp_npc,offset ; 
	// cpc => current_pc, npc => next_pc, exp => expected, r => result in rd
	cpc = cmd_trans.current_pc ;
	offset =  {{12{cmd_trans.immb20}},cmd_trans.immb19_12,cmd_trans.immb11,cmd_trans.immb10_1,1'b0};
	$display("offset = 32h'%h 	32b'%b",offset,offset);
	actual_npc = res_trans.next_pc; 
	actual_r = res_trans.result;
	exp_r = cpc + 32'd4 ;
	exp_npc = cpc + offset;
	if((exp_r == actual_r) && (exp_npc == actual_npc))
	begin
        `uvm_info ("JumpAndLink_PASS", $sformatf("Actual register result=%d Expected register result=%d ", actual_r, exp_r), UVM_LOW)
		`uvm_info ("JumpAndLink_PASS", $sformatf("Actual next pc=%d Expected next pc=%d ", actual_npc, exp_npc), UVM_LOW)
	end
	else
	begin
		`uvm_error ("JumpAndLink_FAIL", $sformatf("Actual register result=%d Expected register result=%d ", actual_r, exp_r))
		`uvm_error ("JumpAndLink_FAIL", $sformatf("Actual next pc=%d Expected next pc=%d ", actual_npc, exp_npc))	
	end
endfunction
*/
function void verify_BranchIfEqual(target_seq_item cmd_trans,GUVM_result_transaction res_trans);
endfunction