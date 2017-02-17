library verilog;
use verilog.vl_types.all;
library work;
entity datapath is
    port(
        clk             : in     vl_logic;
        load_pc         : in     vl_logic;
        load_ir         : in     vl_logic;
        load_regfile    : in     vl_logic;
        load_mar        : in     vl_logic;
        load_mdr        : in     vl_logic;
        load_cc         : in     vl_logic;
        pcmux_sel       : in     vl_logic_vector(1 downto 0);
        storemux_sel    : in     vl_logic;
        alumux_sel      : in     vl_logic_vector(1 downto 0);
        regfilemux_sel  : in     vl_logic_vector(1 downto 0);
        marmux_sel      : in     vl_logic_vector(1 downto 0);
        mdrmux_sel      : in     vl_logic;
        addrmux_sel     : in     vl_logic;
        drmux_sel       : in     vl_logic;
        offset6_lsse    : in     vl_logic;
        mdrInModifier_sel: in     vl_logic_vector(1 downto 0);
        mdrOutModifier_sel: in     vl_logic_vector(1 downto 0);
        aluop           : in     work.lc3b_types.lc3b_aluop;
        opcode          : out    work.lc3b_types.lc3b_opcode;
        ir_4            : out    vl_logic;
        ir_5            : out    vl_logic;
        ir_11           : out    vl_logic;
        br_enable       : out    vl_logic;
        mem_rdata       : in     vl_logic_vector(15 downto 0);
        mem_address     : out    vl_logic_vector(15 downto 0);
        mem_wdata       : out    vl_logic_vector(15 downto 0)
    );
end datapath;
