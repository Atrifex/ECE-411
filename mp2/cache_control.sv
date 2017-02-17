import lc3b_types::*;

module cache_control
(
    input clk,

    /* Datapath controls */


    /* CPU signals */
    input mem_read, mem_write,
    output mem_resp,

    /* Memory signals */
    input pmem_resp,
    output pmem_read, pmem_write
);

endmodule : cache_control
