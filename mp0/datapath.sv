import lc3b_types::*;

module datapath
(
    input clk,

    /* control signals */
    input pcmux_sel,
    input load_pc,

	input storemux_sel

);

/* declare internal signals */
lc3b_word pcmux_out;
lc3b_word pc_out;
lc3b_word br_add_out;
lc3b_word pc_plus2_out;

// internal signals for store mux
lc3b_reg sr1;
lc3b_reg dest;
lc3b_reg storemux_out;


/*
 * PC
 */
mux2 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(br_add_out),
    .f(pcmux_out)
);

/*
 * Register file store mux instantiation using positional mapping
 */
mux2 #(3) storemux
(
	storemux_sel,
	sr1,
	dest,
	storemux_out
);


/***** Registers in the data path *****/
register IR
(



);


register pc
(
    .clk,
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);

register MAR
(


);


register MDR
(



);

register #(3) cc
(




);



endmodule : datapath
