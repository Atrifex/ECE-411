import lc3b_types::*;

module cache_datapath
(
    input clk,

    /* Control signals */


    /* CPU signals */
    input lc3b_mem_wmask mem_byte_enable,
    input lc3b_word mem_address, mem_wdata,
    output lc3b_word mem_rdata,

    /* Memory signals */
    input lc3b_cacheline pmem_rdata,
    output lc3b_word pmem_address,
    output lc3b_cacheline pmem_wdata
);





endmodule : cache_datapath
