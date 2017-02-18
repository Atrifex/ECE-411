library verilog;
use verilog.vl_types.all;
entity decoder3 is
    port(
        encodedvalue    : in     vl_logic_vector(2 downto 0);
        decodedvalue    : out    vl_logic_vector(7 downto 0)
    );
end decoder3;
