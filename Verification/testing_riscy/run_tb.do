onerror {quit}

vlog +incdir+../testing_leon+../common+../common/inst_h+../common/Tests+../common/sequences ../testing_leon/target_pkg.sv

vlog ../testing_riscy/riscy_interface.sv
vlog ../testing_riscy/top.sv

vsim -novopt top

log /* -r

run -all
quit