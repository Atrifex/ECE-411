library verilog;
use verilog.vl_types.all;
entity way is
    port(
        clk             : in     vl_logic;
        load_d          : in     vl_logic;
        load_v          : in     vl_logic;
        load_TD         : in     vl_logic;
        index           : in     vl_logic_vector(2 downto 0);
        d_in            : in     vl_logic;
        v_in            : in     vl_logic;
        tag_in          : in     vl_logic_vector(8 downto 0);
        data_in         : in     vl_logic_vector(127 downto 0);
        d_out           : out    vl_logic;
        v_out           : out    vl_logic;
        tag_out         : out    vl_logic_vector(8 downto 0);
        data_out        : out    vl_logic_vector(127 downto 0)
    );
end way;
