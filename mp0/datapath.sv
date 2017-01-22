lc3b_types::*;

module datapath
(
    input clk,

    /* control signals */
    input pcmux_sel,
    input load_pc,
	 input storemux_sel,
	 input load_ir,
	 input load_regfile,
	 
	 output lc3b_opcode opcode,
	 
	 /* Memory signals */
	 input lc3b_word mem_rdata,
    output lc3b_word mem_address,
	 output lc3b_word mem_wdata	 
);

/***** declare internal signals *****/
// General Signals
lc3b_word bus;
assign bus = mem_wdata;

// Signals related to PC
lc3b_word pcmux_out, pc_out;
lc3b_word br_add_out, pc_plus2_out;
lc3b_word adj9_offset, adj6_offset;
lc3b_offset9 offset9;
lc3b_offset6 offset6;

// Signals related to IR


lc3b_reg sr1, sr2, dest;
lc3b_reg storemux_out;


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
mux2 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(br_add_out),
    .f(pcmux_out)
);

// increments PC value to access next instruction
plus2 pcPlus2
(
	.in(pcmux_out), 
	.out(pc_plus2_out)
);

adder br_adder
(
	.a(pcmux_out), 
	.b(adj9_offset),
	.c(br_add_out)
);

adj #(9) offset9_adjuster
(
	.in(offset9)
	.out(adj9_offset)
);

/*****  IR *****/
ir IR
(
	 // inputs
    .clk,
    .load(load_ir),
    .in(bus),
	 
	 // outputs
    .opcode(opcode),
    .dest(dest), 
	 .src1(sr1), 
	 .src2(sr2),
    .offset6(offset6),
    .offset9(offset9)
);

mux2 #(3) storemux
(
	.sel(storemux_sel),
	.a(sr1),
	.b(dest),
	.f(storemux_out)
);


adj #(6) offset6_adjuster
(
	.in(offset6)
	.out(adj6_offset)
);

regfile regfile_inst
(
	.clk,
	.load(load_regfile),
	input lc3b_word in,
	input lc3b_reg src_a, src_b, dest,
	output lc3b_word reg_a, reg_b
);


endmodule : datapath
