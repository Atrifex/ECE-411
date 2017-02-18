library verilog;
use verilog.vl_types.all;
entity cache_writelogic is
    port(
        pmem_read       : in     vl_logic;
        mem_byte_enable : in     vl_logic_vector(1 downto 0);
        offset          : in     vl_logic_vector(2 downto 0);
        mem_wdata       : in     vl_logic_vector(15 downto 0);
        pmem_rdata      : in     vl_logic_vector(127 downto 0);
        cur_cacheline   : in     vl_logic_vector(127 downto 0);
        output_cacheline: out    vl_logic_vector(127 downto 0)
    );
end cache_writelogic;
