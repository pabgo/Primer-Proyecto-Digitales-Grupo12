vsim -gui -L C:/Modeltech_pe_edu_10.4a/lib/unisim Principal_tb unisim.glbl
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Blue /Principal_tb/sel_display
add wave -noupdate /Principal_tb/reset
add wave -noupdate -color {Light Blue} /Principal_tb/humo
add wave -noupdate -color Blue /Principal_tb/display
add wave -noupdate -color {Light Blue} /Principal_tb/current
add wave -noupdate /Principal_tb/clk
add wave -noupdate -color Gold /Principal_tb/Led2
add wave -noupdate /Principal_tb/Led1
add wave -noupdate -color Gold /Principal_tb/Alarma2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {7961 ps}
run -all