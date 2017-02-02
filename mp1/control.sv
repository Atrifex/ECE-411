import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module control
(
    /* Input and output port declarations */
    input clk,

    /* Datapath controls */
    input lc3b_opcode opcode,
	 input ir_4,
    input ir_5,
	 input ir_11,
    input br_enable,
	 input memparity,
    output logic load_pc,
    output logic load_ir,
    output logic load_regfile,
    output logic load_mar,
    output logic load_mdr,
    output logic load_cc,
    output logic [1:0] pcmux_sel,
    output logic storemux_sel,
    output logic [1:0] alumux_sel,
    output logic [1:0] regfilemux_sel,
    output logic marmux_sel,
    output logic mdrmux_sel,
	 output logic addrmux_sel,
	 output logic drmux_sel,
	 output logic offset6_lsse,
	 output logic [1:0] mdrInModifier_sel,
	 output logic [1:0] mdrOutModifier_sel,
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
	 s_shf,
    br,
    br_taken,
    calc_addr,
    calc_addr_b,
    ldr1,
    ldr2,
	 ldb1,
    ldb2,
    str1,
    str2,
    stb1,
    stb2,
    jmp,
    lea,
	 jsr
} state, next_state;

always_comb
begin : state_actions
    /* Default output assignments */
    load_pc = 1'b0;
    load_ir = 1'b0;
    load_regfile = 1'b0;
    load_mar = 1'b0;
    load_mdr = 1'b0;
    load_cc = 1'b0;
    pcmux_sel =  2'b00;
    storemux_sel = 1'b0;
    alumux_sel = 2'b00;
    regfilemux_sel = 2'b00;
    marmux_sel = 1'b0;
    mdrmux_sel = 1'b0;
	 addrmux_sel = 1'b0;
	 drmux_sel = 1'b0;
    offset6_lsse = 1'b1;
	 mdrInModifier_sel = 2'b00;
	 mdrOutModifier_sel = 2'b00;
	 aluop = alu_add;
    mem_read = 1'b0;
    mem_write = 1'b0;
    mem_byte_enable = 2'b11;
	 
    case (state)
        fetch1: begin
            /* MAR <= PC */
            marmux_sel = 1;
            load_mar = 1;

            /* PC <= PC + 2 */
            pcmux_sel = 2'b00;
            load_pc = 1;
        end
        fetch2: begin
            /* Read memory */
            mem_read = 1;
            mdrmux_sel = 1;
            load_mdr = 1;
        end
        fetch3: begin
            /* IR <= MDR */
            load_ir = 1;
        end
        decode: begin
            /* Do nothing ---> Opcode is being decoded */
        end
        s_add: begin
            alumux_sel = (ir_5 == 1)? 2'b10: 2'b00;
            aluop = alu_add;
            load_regfile = 1;
            load_cc = 1;
        end
        s_and: begin
            alumux_sel = (ir_5 == 1)? 2'b10: 2'b00;
            aluop = alu_and;
            load_regfile = 1;
            load_cc = 1;
        end
        s_not: begin
            aluop = alu_not;
            load_regfile = 1;
            load_cc = 1;
        end
        br: begin
            /* Check for if BEN is high in state transition */
        end
        br_taken: begin
            pcmux_sel = 2'b01;
            load_pc = 1;
        end
        calc_addr: begin
            alumux_sel = 2'b01;
            aluop = alu_add;
            load_mar = 1;
        end
		  calc_addr_b: begin
				offset6_lsse = 1'b0;
            alumux_sel = 2'b01;
            aluop = alu_add;
            load_mar = 1;
        end
        ldr1: begin
            mdrmux_sel = 1;
            load_mdr = 1;
            mem_read = 1;
        end
        ldr2: begin
            regfilemux_sel = 2'b01;
            load_regfile = 1;
            load_cc = 1;
        end		  
		  ldb1: begin
            mdrmux_sel = 1;
            load_mdr = 1;
            mem_read = 1;
        end
        ldb2: begin
				mdrOutModifier_sel = (memparity == 1'b0)? 2'b01: 2'b10;
				regfilemux_sel = 2'b01;
            load_regfile = 1;
            load_cc = 1;
        end		  
        str1: begin
            storemux_sel = 1;
            aluop = alu_pass;
            load_mdr = 1;
        end
        str2: begin
            mem_write = 1;
        end
        stb1: begin
  				mdrInModifier_sel = (memparity == 1'b0)? 2'b01: 2'b10;
            storemux_sel = 1;
            aluop = alu_pass;
            load_mdr = 1;
        end
        stb2: begin
				mem_byte_enable = (memparity == 1'b0)? 2'b01: 2'b10;
            mem_write = 1;
        end
        jmp: begin
            aluop = alu_pass;
            pcmux_sel = 2'b10;
            load_pc = 1;
        end
        lea: begin
            regfilemux_sel = 2'b10;
            load_regfile = 1;
            load_cc = 1;
        end
		  jsr: begin
				// load current PC value into R7
				drmux_sel = 1'b1;
				regfilemux_sel = 2'b11;
				load_regfile = 1'b1;

            if(ir_11 == 1'b0) begin
					// PC = BR
					storemux_sel = 1'b0;
					aluop = alu_pass;

					pcmux_sel = 2'b10;
					load_pc = 1'b1;
				end else begin
					// PC = PC + PCOffset11
					addrmux_sel = 1'b1;
					pcmux_sel = 2'b01;
					load_pc = 1'b1;
					
				end
        end
		  s_shf: begin
            alumux_sel = 2'b11;
				if(ir_4 == 1'b0) begin // D
					aluop = alu_sll;
				end else begin
					if(ir_5 == 1'b0) begin // A
						aluop = alu_srl;
					end else begin
						aluop = alu_sra;
					end	
				end
            load_regfile = 1;
            load_cc = 1;
        end
        default : /* Do nothing and transition back to fetch1 */;
    endcase


end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
    next_state = state;

    case (state)
        fetch1: begin
            next_state = fetch2;
        end
        fetch2: begin
            if(mem_resp == 1)
                next_state = fetch3;
        end
        fetch3: begin
            next_state = decode;
        end
        decode: begin
            case (opcode)
                op_add: next_state = s_add;
                op_and: next_state = s_and;
                op_not: next_state = s_not;
                op_ldr: next_state = calc_addr;
                op_str: next_state = calc_addr;
					 op_ldb: next_state = calc_addr_b;
                op_stb: next_state = calc_addr_b;
                op_br: next_state = br;
                op_jmp: next_state = jmp;
					 op_lea: next_state = lea;
					 op_jsr: next_state = jsr;
					 op_shf: next_state = s_shf;
					 default : next_state = fetch1;
            endcase
        end
        s_add: begin
            next_state = fetch1;
        end
        s_and: begin
            next_state = fetch1;
        end
        s_not: begin
            next_state = fetch1;
        end
        br: begin
            if(br_enable == 1)
                next_state = br_taken;
            else
                next_state = fetch1;
        end
        br_taken: begin
            next_state = fetch1;
        end
        calc_addr: begin
            case (opcode)
                op_ldr: next_state = ldr1;
                op_str: next_state = str1;
					 default : next_state = fetch1;
            endcase
        end
		  calc_addr_b: begin
            case (opcode)
					 op_ldb: next_state = ldb1;
                op_stb: next_state = stb1;
					 default : next_state = fetch1;
            endcase
        end
        ldr1: begin
            if(mem_resp == 1)
                next_state = ldr2;
        end
        ldr2: begin
            next_state = fetch1;
        end
		  ldb1: begin
            if(mem_resp == 1)
                next_state = ldb2;
        end
        ldb2: begin
            next_state = fetch1;
        end
        str1: begin
            next_state = str2;
        end
        str2: begin
            if(mem_resp == 1)
                next_state = fetch1;
        end
		  stb1: begin
            next_state = stb2;
        end
        stb2: begin
            if(mem_resp == 1)
                next_state = fetch1;
        end
        jmp: begin
            next_state = fetch1;
        end
        lea: begin
            next_state = fetch1;
        end
		  jsr: begin
				next_state = fetch1;
        end
		  s_shf: begin
				next_state = fetch1;
        end
        default : next_state = fetch1;
    endcase

end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= next_state;
end

endmodule : control
