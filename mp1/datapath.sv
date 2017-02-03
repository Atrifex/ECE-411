import lc3b_types::*;

module datapath
(
    input clk,

    /* control signals */
    input load_pc,
    input load_ir,
    input load_regfile,
    input load_mar,
    input load_mdr,
    input load_cc,
    input [1:0] pcmux_sel,
    input storemux_sel,
    input [1:0] alumux_sel,
    input [1:0] regfilemux_sel,
    input [1:0] marmux_sel,
    input mdrmux_sel,
	 input addrmux_sel,
	 input drmux_sel,
	 input offset6_lsse,
	 input [1:0] mdrInModifier_sel,
	 input [1:0] mdrOutModifier_sel,
    input lc3b_aluop aluop,
    output lc3b_opcode opcode,
	 output ir_4,
    output ir_5,
	 output ir_11,
    output br_enable,

    /* Memory signals */
    input lc3b_word mem_rdata,
    output lc3b_word mem_address,
    output lc3b_word mem_wdata
);

/***** declare internal signals *****/
// MDR and MAR Signals
lc3b_word marmux_out, mdrmux_out;
lc3b_word mdr_out, mdrOutModifier_out, mdrInModifier_out;
assign mem_wdata = mdr_out;

// Signals related to PC
lc3b_word pcmux_out, pc_out;
lc3b_word br_add_out, pc_plus2_out, addrmux_out;
lc3b_word adj11_offset, adj9_offset, adj6_offset;

// Signals related to IR
lc3b_reg sr1, sr2, dest;
lc3b_reg storemux_out, drmux_out;
lc3b_offset6 offset6;
lc3b_trapvect8 trapVect;
lc3b_offset9 offset9;
lc3b_offset11 offset11;
lc3b_imm4 imm4;
lc3b_imm5 imm5;

// signals related to regfile
lc3b_word regfilemux_out;
lc3b_word sr1_out, sr2_out, alumux_out;

// signals related to alu
lc3b_word alu_out;

// signals related to branch
lc3b_nzp gencc_out, cc_out;

/***** PC *****/
// register that stores the current PC value
register pc
(
    .clk,
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);

// Mux used to select the value that will be placed into the PC register
mux4 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(br_add_out),
    .c(alu_out),
    .d(mdr_out),
    .f(pcmux_out)
);

// increments PC value to access next instruction
plus2 pcPlus2
(
	.in(pc_out),
	.out(pc_plus2_out)
);

adder br_adder
(
	.a(pc_out),
	.b(addrmux_out),
	.c(br_add_out)
);

mux2 addrmux
(
    .sel(addrmux_sel),
    .a(adj9_offset),
    .b(adj11_offset),
    .f(addrmux_out)
);

adj #(9) offset9_adjuster
(
	.lsse(1'b1),
	.in(offset9),
	.out(adj9_offset)
);

adj #(11) offset11_adjuster
(
	.lsse(1'b1),
	.in(offset11),
	.out(adj11_offset)
);


/*****  IR *****/
ir IR
(
	// inputs
    .clk,
    .load(load_ir),
    .in(mdrOutModifier_out),

	// outputs
    .opcode(opcode),
    .dest(dest),
	 .src1(sr1),
	 .src2(sr2),
    .offset6(offset6),
	 .trapVect(trapVect),
    .offset9(offset9),
	 .offset11(offset11),
	 .imm4(imm4),
    .imm5(imm5),
	 .ir_4(ir_4),
    .ir_5(ir_5),
	 .ir_11(ir_11)
);

mux2 #(3) storemux
(
	.sel(storemux_sel),
	.a(sr1),
	.b(dest),
	.f(storemux_out)
);

mux2 #(3) drmux
(
	.sel(drmux_sel),
	.a(dest),
	.b(3'b111),
	.f(drmux_out)
);

adj #(6) offset6_adjuster
(
	.lsse(offset6_lsse),
	.in(offset6),
	.out(adj6_offset)
);

/***** Regfile *****/
regfile regfile_inst
(
	.clk,
	.load(load_regfile),
	.in(regfilemux_out),
	.src_a(storemux_out),
	.src_b(sr2),
	.dest(drmux_out),
	.reg_a(sr1_out),
	.reg_b(sr2_out)
);

mux4 regfilemux
(
	.sel(regfilemux_sel),
	.a(alu_out),
	.b(mdrOutModifier_out),
    .c(br_add_out),
    .d(pc_out),
	.f(regfilemux_out)
);

mux4 alumux
(
	.sel(alumux_sel),
	.a(sr2_out),
	.b(adj6_offset),
    .c({{11{imm5[4]}},imm5}),
    .d({12'h000,imm4}),
	.f(alumux_out)
);

/***** ALU *****/
alu alu_inst
(
    .aluop(aluop),
    .a(sr1_out),
    .b(alumux_out),
    .f(alu_out)
);

/***** Branch Related Modules *****/
gencc gencc_inst
(
	.in(regfilemux_out),
	.out(gencc_out)
);

register #(3) cc
(
    .clk,
    .load(load_cc),
    .in(gencc_out),
    .out(cc_out)
);

cccomp cccomp_inst
(
	.cur_cc(cc_out),
	.br_cc(dest),
	.br_enable(br_enable)
);

/***** MAR *****/
mux4 marmux
(
    .sel(marmux_sel),
    .a(alu_out),
    .b(pc_out),
	 .c(mdr_out),
    .d({7'h00,trapVect,1'b0}),
    .f(marmux_out)
);

register MAR
(
    .clk,
    .load(load_mar),
    .in(marmux_out),
    .out(mem_address)
);

/***** MDR *****/
mux4 mdrInModifier
(
    .sel(mdrInModifier_sel),
    .a(alu_out),
    .b({8'h00, alu_out[7:0]}),
    .c({alu_out[7:0], 8'h00}),
    .d(16'h0000),
    .f(mdrInModifier_out)
);


mux2 mdrmux
(
    .sel(mdrmux_sel),
    .a(mdrInModifier_out),
    .b(mem_rdata),
    .f(mdrmux_out)
);

register MDR
(
    .clk,
    .load(load_mdr),
    .in(mdrmux_out),
    .out(mdr_out)
);

mux4 mdrOutModifier
(
    .sel(mdrOutModifier_sel),
    .a(mdr_out),
    .b({8'h00, mdr_out[7:0]}),
    .c({8'h00, mdr_out[15:8]}),
    .d(16'h0000),
    .f(mdrOutModifier_out)
);

endmodule : datapath
