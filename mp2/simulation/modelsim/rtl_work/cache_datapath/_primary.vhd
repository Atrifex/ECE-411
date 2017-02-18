library verilog;
use verilog.vl_types.all;
entity cache_datapath is
    port(
        clk             : in     vl_logic;
        load_lru        : in     vl_logic;
        lru_in          : in     vl_logic;
        writeback_ctrlsig: in     vl_logic;
        load_d0         : in     vl_logic;
        load_v0         : in     vl_logic;
        load_TD0        : in     vl_logic;
        d_in0           : in     vl_logic;
        v_in0           : in     vl_logic;
        load_d1         : in     vl_logic;
        load_v1         : in     vl_logic;
        load_TD1        : in     vl_logic;
        d_in1           : in     vl_logic;
        v_in1           : in     vl_logic;
        pmemaddr_sel    : in     vl_logic_vector(1 downto 0);
        lru_out         : out    vl_logic;
        d_out0          : out    vl_logic;
        d_out1          : out    vl_logic;
        hit0            : out    vl_logic;
        hit1            : out    vl_logic;
        mem_byte_enable : in     vl_logic_vector(1 downto 0);
        mem_address     : in     vl_logic_vector(15 downto 0);
        mem_wdata       : in     vl_logic_vector(15 downto 0);
        mem_rdata       : out    vl_logic_vector(15 downto 0);
        pmem_read       : in     vl_logic;
        pmem_rdata      : in     vl_logic_vector(127 downto 0);
        pmem_address    : out    vl_logic_vector(15 downto 0);
        pmem_wdata      : out    vl_logic_vector(127 downto 0)
    );
end cache_datapath;
