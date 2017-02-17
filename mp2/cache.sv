import lc3b_types::*;

module cache
(
    input clk,

    /******* Signals between CPU and Cache *******/
    // inputs
    input mem_read, mem_write,                                          // control
    input lc3b_mem_wmask mem_byte_enable,                               // datapath
    input lc3b_word mem_address, mem_wdata,                             // datapath
    // outputs
    output mem_resp,                                                    // control
    output lc3b_word mem_rdata,                                         // datapath

    /******* Signals between Cache and Physical Memory *******/
    // inputs
    input pmem_resp,                                                    // control
    input lc3b_cacheline pmem_rdata,                                    // datapath
    // outputs
    output pmem_read, pmem_write,                                       // control
    output lc3b_word pmem_address,                                      // datapath
    output lc3b_cacheline pmem_wdata                                    // datapath
);



cache_control control
(
    .clk,

    /* Datapath controls */
    // inputs

    // outputs

    /* CPU signals */
    .mem_read, .mem_write,      // inputs
    .mem_resp,                  // outputs

    /* Memory signals */
    .pmem_resp,                 // inputs
    .pmem_read, .pmem_write     // outputs
);


cache_datapath datapath
(
    .clk,

    /* Control signals */
    // inputs

    // outputs

    /* CPU signals */
    .mem_byte_enable, .mem_address, .mem_wdata,       // inputs
    .mem_rdata,                                     // outputs

    /* Memory signals */
    .pmem_rdata,                                    // inputs
    .pmem_address, .pmem_wdata                       // outputs

);

endmodule : cache
