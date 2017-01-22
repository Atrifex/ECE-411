import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module control
(
    /* Input and output port declarations */
    input clk,

    /* Datapath controls */
    input lc3b_opcode opcode,
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

/* List of states */
enum int unsigned {
    fetch1,
    fetch2,
    fetch3,
    decode,
    s_add,
	 s_and,
	 s_not,
	 br,
	 br_taken,
	 calc_addr,
	 ldr1,
	 ldr2,
	 str1,
	 str2
} state, next_state;

always_comb
begin : state_actions
    /* Default output assignments */
	 load_pc = 1’b0
	 load_ir = 1’b0
	 load_regfile = 1’b0
	 load_mar = 1’b0
	 load_mdr = 1’b0
	 load_cc = 1’b0
	 pcmux_sel =  1’b0
	 storemux_sel = 1’b0
	 alumux_sel = 1’b0
	 regfilemux_sel = 1’b0
	 marmux_sel = 1’b0
	 mdrmux_sel = 1’b0
	 aluop = alu_add
	 mem_read = 1’b0
	 mem_write = 1’b0
	 mem_byte_enable = 2’b11
	 
	 
	 
end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
	  next_state = state;
	  
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= next_state;
end

endmodule : control
