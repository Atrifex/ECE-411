import lc3b_types::*;

module mp0
(
    input clk,

    /* Memory signals */
    input mem_resp,
    input lc3b_word mem_rdata,
    output mem_read,
    output mem_write,
    output lc3b_mem_wmask mem_byte_enable,
    output lc3b_word mem_address,
    output lc3b_word mem_wdata
);

/* Instantiate MP 0 top level blocks here */
control control_inst
(
    .clk,

    /* Datapath controls */
    opcode,
    input br_enable,
    output logic load_pc,
    output logic load_ir,
    output logic load_regfile,
    output logic load_mar,
    output logic load_mdr,
    output logic load_cc,
    output logic pcmux_sel,
    output logic storemux_sel,
    output logic alumux_sel,
    output logic regfilemux_sel,
    output logic marmux_sel,
    output logic mdrmux_sel,
    output lc3b_aluop aluop,

    /* Memory signals */
    input mem_resp,
    output logic mem_read,
    output logic mem_write,
    output lc3b_mem_wmask mem_byte_enable
);

datapath datapath_inst
(
    .clk,

    /* control signals */
	 input load_pc,
	 input load_ir,
	 input load_regfile,
	 input load_mar,
	 input load_mdr,
	 input load_cc,
	 input pcmux_sel,
	 input storemux_sel,
	 input alumux_sel,
	 input regfilemux_sel,
	 input marmux_sel,
	 input mdrmux_sel,
	 input lc3b_aluop aluop,
	 output lc3b_opcode opcode,
	 output br_enable,
	 
	 /* Memory signals */
	 input lc3b_word mem_rdata,
    output lc3b_word mem_address,
	 output lc3b_word mem_wdata	 
);


endmodule : mp0
