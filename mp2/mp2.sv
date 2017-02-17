import lc3b_types::*;

module mp2
(
    input clk,

    /* Memory input signals */
    input pmem_resp,
    input lc3b_cacheline pmem_rdata,

    /* Memory output signals */
    output pmem_read,
    output pmem_write,
    output lc3b_word pmem_address,
    output lc3b_cacheline pmem_wdata
);

/* Signals between CPU and Cache */
logic mem_resp, mem_read, mem_write;
lc3b_mem_wmask mem_byte_enable;
lc3b_word mem_rdata, mem_address, mem_wdata;



cpu cpu_inst
(
    .clk,

    /******* Signals between CPU and Cache *******/
    // inputs
    .mem_resp, .mem_rdata,
    // outputs
    .mem_read, .mem_write,
    .mem_byte_enable, .mem_address, .mem_wdata
);

cache cache_inst
(
    .clk,

    /******* Signals between CPU and Cache *******/
    // inputs
    .mem_read, .mem_write, .mem_byte_enable,
    .mem_address, .mem_wdata,
    // outputs
    .mem_resp, .mem_rdata,

    /******* Signals between Cache and Physical Memory *******/
    .pmem_resp, .pmem_rdata,                                 // inputs
    .pmem_read, .pmem_write, .pmem_address, .pmem_wdata      // outputs

);


endmodule : mp2
