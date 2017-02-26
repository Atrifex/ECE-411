library verilog;
use verilog.vl_types.all;
entity cache_control is
    port(
        clk             : in     vl_logic;
        lru_in          : in     vl_logic;
        d_in0           : in     vl_logic;
        d_in1           : in     vl_logic;
        hit0            : in     vl_logic;
        hit1            : in     vl_logic;
        load_lru        : out    vl_logic;
        lru_set         : out    vl_logic;
        pmemwdata_sel   : out    vl_logic;
        load_d0         : out    vl_logic;
        load_v0         : out    vl_logic;
        load_TD0        : out    vl_logic;
        d_set0          : out    vl_logic;
        v_set0          : out    vl_logic;
        load_d1         : out    vl_logic;
        load_v1         : out    vl_logic;
        load_TD1        : out    vl_logic;
        d_set1          : out    vl_logic;
        v_set1          : out    vl_logic;
        pmemaddr_sel    : out    vl_logic_vector(1 downto 0);
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        mem_resp        : out    vl_logic;
        pmem_resp       : in     vl_logic;
        pmem_read       : out    vl_logic;
        pmem_write      : out    vl_logic
    );
end cache_control;
