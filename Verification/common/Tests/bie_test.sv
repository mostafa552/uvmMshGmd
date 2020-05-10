class bie_test extends GUVM_test;
    `uvm_component_utils(bie_test);



    function new(string name = "bie_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        env_h   = GUVM_env::type_id::create("env_h",this);
        generic_sequence_h = bie_sequence::type_id::create("generic_sequence_h");
    endfunction: build_phase 

   
endclass: bie_test
