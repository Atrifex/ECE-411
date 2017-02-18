import lc3b_types::*;

module cache_control
(
    input clk,

    /* Datapath controls */
    input lru_out, d_in0, d_in1, hit,
    output logic load_lru, writeback_ctrlsig,
    output logic load_d0, load_v0, load_TD0, d_set0, v_set0,
    output logic load_d1, load_v1, load_TD1, d_set1, v_set1,
    output logic [1:0] pmemaddr_sel,

    /* CPU signals */
    input mem_read, mem_write,
    output logic mem_resp,

    /* Memory signals */
    input pmem_resp,
    output logic pmem_read, pmem_write
);

/* List of states */
enum int unsigned {
    process_request, fetch_cline, write_back
} state, next_state;

always_comb
begin : state_actions
    /* Default output assignments */
    load_lru = 0;
    writeback_ctrlsig = 0;
    load_d0 = 0; load_v0 = 0; load_TD0 = 0;
    d_set0 = 0; v_set0 = 0;
    load_d1 = 0; load_v1 = 0; load_TD1 = 0;
    d_set1 = 0; v_set1 = 0;
    pmemaddr_sel = 2'b00;
    mem_resp = 0; pmem_read = 0; pmem_write = 0;


    case (state)
        process_request: begin

        end
        fetch_cline: begin

        end
        write_back: begin

        end
        default:;
    endcase


end

always_comb
begin : next_state_logic
    next_state = state;

    case (state)
        process_request: begin

        end
        fetch_cline: begin

        end
        write_back: begin

        end
        default:next_state = process_request;
    endcase


end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= next_state;
end


endmodule : cache_control
