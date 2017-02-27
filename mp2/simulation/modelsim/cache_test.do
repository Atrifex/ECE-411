restart -f

mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_way0_data.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/way0/data/data
mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_dirty.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/way0/dirty/data
mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_way0_tag.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/way0/tag/data
mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_valid.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/way0/valid/data

mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_way1_data.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/way1/data/data
mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_dirty.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/way1/dirty/data
mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_way1_tag.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/way1/tag/data
mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_valid.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/way1/valid/data

mem load -i /home/rrthakk2/ece411/mp2/simulation/modelsim/cache_presets/c_lru.lst -format hex -startaddress 0 -endaddress 7 /cache_tb/DUT/datapath/lru/data

run 5000ns
