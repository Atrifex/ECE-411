library verilog;
use verilog.vl_types.all;
entity cccomp is
    port(
        cur_cc          : in     vl_logic_vector(2 downto 0);
        br_cc           : in     vl_logic_vector(2 downto 0);
        br_enable       : out    vl_logic
    );
end cccomp;
