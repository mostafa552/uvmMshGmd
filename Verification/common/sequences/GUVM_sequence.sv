
//generates the sequence of instructions needed to test an add instruction 

class GUVM_sequence extends uvm_sequence #(GUVM_sequence_item);
    `uvm_object_utils(GUVM_sequence);
    target_seq_item command,load1,load2,store,nop ;
    target_seq_item c;
    function new(string name = "GUVM_sequence");
        super.new(name);
    endfunction : new

    task genNop(integer i , logic[31:0] data );
        repeat(i) begin
            nop = target_seq_item::type_id::create("nop");
            nop.ran_constrained(NOP); 
            nop.data = data ; 
            start_item(nop);
            finish_item(nop);
        end
    endtask
    
    task body();
        repeat(1)
        begin
            load1 = target_seq_item::type_id::create("load1"); //load register x with data dx
            load2 = target_seq_item::type_id::create("load2"); //load register y with data dy
            command = target_seq_item::type_id::create("command");//send add instruction (or any other instruction under test)
            store = target_seq_item::type_id::create("store");//store the result from reg z to memory location (dont care)
            //nop = target_seq_item::type_id::create("nop"); 
            //opcode x=A ;
           // $display("hello , this is the sequence,%d",command.upper_bit);
            command.ran_constrained(A); // first randomize the instruction as an add (A is the enum code for add)
            //nop.ran_constrained(NOP);
            command.setup();//set up the instruction format fields 
            if ($isunknown(command.rs1))
                load1.load(0);
            else
            begin
                load1.load(command.rs1);//specify regx address
                load1.rd=command.rs1;
            end
            if ($isunknown(command.rs2))
                load2.load(0);
            else
            begin
                load2.load(command.rs2);//specify regx address  
                load2.rd=command.rs2;
            end 
            store.store(command.rd);//specify regz address

			//specify regx and regy data
            command.operand1=load1.data;
            command.operand2=load2.data;
            command.v=1;

			//send the sequence
            start_item(load1);
            finish_item(load1);
            genNop(5,load1.data);
            start_item(load2);
            finish_item(load2);
            genNop(5,load2.data);
            start_item(command);
            finish_item(command);
            genNop(5,0);
            start_item(store);
            finish_item(store);
            start_item(store);
            finish_item(store);
            genNop(6,0);
            command.SOM = SB_VERIFICATION_MODE ; 
            start_item(command);
            finish_item(command);
            //genNop(10);
        end
    endtask : body


endclass : GUVM_sequence

