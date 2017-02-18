onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mp2_tb/clk
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_resp
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_read
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_write
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_address
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_rdata
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/lru/data
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/clk
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/write
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/index
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/datain
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/dataout
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/clk
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/write
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/index
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/datain
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/dataout
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cpu_inst/datapath/regfile_inst/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2999112 ps} 0}
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
WaveRestoreZoom {2999050 ps} {3000050 ps}
