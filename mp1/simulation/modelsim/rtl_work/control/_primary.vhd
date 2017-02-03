library verilog;
use verilog.vl_types.all;
library work;
entity control is
    port(
        clk             : in     vl_logic;
        opcode          : in     work.lc3b_types.lc3b_opcode;
        ir_4            : in     vl_logic;
        ir_5            : in     vl_logic;
        ir_11           : in     vl_logic;
        br_enable       : in     vl_logic;
        memparity       : in     vl_logic;
        load_pc         : out    vl_logic;
        load_ir         : out    vl_logic;
        load_regfile    : out    vl_logic;
        load_mar        : out    vl_logic;
        load_mdr        : out    vl_logic;
        load_cc         : out    vl_logic;
        pcmux_sel       : out    vl_logic_vector(1 downto 0);
        storemux_sel    : out    vl_logic;
        alumux_sel      : out    vl_logic_vector(1 downto 0);
        regfilemux_sel  : out    vl_logic_vector(1 downto 0);
        marmux_sel      : out    vl_logic;
        mdrmux_sel      : out    vl_logic;
        addrmux_sel     : out    vl_logic;
        drmux_sel       : out    vl_logic;
        offset6_lsse    : out    vl_logic;
        mdrInModifier_sel: out    vl_logic_vector(1 downto 0);
        mdrOutModifier_sel: out    vl_logic_vector(1 downto 0);
        aluop           : out    work.lc3b_types.lc3b_aluop;
        mem_resp        : in     vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem_byte_enable : out    vl_logic_vector(1 downto 0)
    );
end control;
