onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mp2_tb/dut/mem_resp
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_resp
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_read
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_write
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_address
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_rdata
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cpu_inst/control/state
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/control/state
add wave -noupdate -color Magenta -radix hexadecimal -childformat {{{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[7]} -radix hexadecimal} {{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[6]} -radix hexadecimal} {{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[5]} -radix hexadecimal} {{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[4]} -radix hexadecimal} {{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[3]} -radix hexadecimal} {{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[2]} -radix hexadecimal} {{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[1]} -radix hexadecimal} {{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[7]} {-color Magenta -height 15 -radix hexadecimal} {/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[6]} {-color Magenta -height 15 -radix hexadecimal} {/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[5]} {-color Magenta -height 15 -radix hexadecimal} {/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[4]} {-color Magenta -height 15 -radix hexadecimal} {/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[3]} {-color Magenta -height 15 -radix hexadecimal} {/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[2]} {-color Magenta -height 15 -radix hexadecimal} {/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[1]} {-color Magenta -height 15 -radix hexadecimal} {/mp2_tb/dut/cpu_inst/datapath/regfile_inst/data[0]} {-color Magenta -height 15 -radix hexadecimal}} /mp2_tb/dut/cpu_inst/datapath/regfile_inst/data
add wave -noupdate -color Red -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/write
add wave -noupdate -color Red -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/index
add wave -noupdate -color Red -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/datain
add wave -noupdate -color Red -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way0/data/dataout
add wave -noupdate -color Cyan -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/write
add wave -noupdate -color Cyan -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/index
add wave -noupdate -color Cyan -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/datain
add wave -noupdate -color Cyan -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/way1/data/dataout
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/writelogic/pmem_read
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/writelogic/mem_byte_enable
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/writelogic/offset
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/writelogic/mem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/writelogic/pmem_rdata
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/writelogic/cur_cacheline
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/writelogic/output_cacheline
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache_inst/datapath/writelogic/wordselector
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {315944 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 328
configure wave -valuecolwidth 225
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
WaveRestoreZoom {0 ps} {910108 ps}
