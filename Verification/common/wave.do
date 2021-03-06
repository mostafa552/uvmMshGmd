onerror {resume}
quietly WaveActivateNextPane {} 0
add wave vsim:/top/bfm/allow_pseudo_clk
add wave vsim:/top/bfm/clk_pseudo
add wave vsim:/top/dut/ici.rpc 
add wave vsim:/top/dut/ico.data 
add wave vsim:/top/dut/dci.maddress 
add wave vsim:/top/bfm/receive_data/*
add wave vsim:/top/dut/dci 

add wave -r /top/dut/*


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50316229 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1000 ns}
