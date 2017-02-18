module cache_writelogic
(
    input pmem_read,
    input lc3b_mem_wmask mem_byte_enable,
    input [2:0] offset,
    input lc3b_word mem_wdata,
    input lc3b_cacheline pmem_rdata, cur_cacheline,
    output lc3b_cacheline output_cacheline
);


logic [8:0] wordselector;

decoder3 decoder3_inst(.encodedvalue(offset),.decodedvalue(wordselector));

genvar i;
generate
    for (int i=0; i<8; j++)
    begin: module_instant_loop
        mux4 writelogic_highbyte
        (
            .sel({pmem_read,((~pmem_read)&mem_byte_enable[1]&wordselector[i])}),
            .a(cur_cacheline[(i*17-1):(i*16+8)]),
            .b(mem_wdata[15:8]),
            .c(pmem_rdata[(i*17-1):(i*16+8)]),
            .d(16'h0000),
            .f()
        );
        mux4 writelogic_lowbyte
        (
            .sel({pmem_read,((~pmem_read)&mem_byte_enable[1]&wordselector[i])}),
            .a(cur_cacheline[(i*16+7):(i*16)]),
            .b(mem_wdata[7:0]),
            .c(pmem_rdata[(i*16+7):(i*16)]),
            .d(16'h0000),
            .f()
        );
    end
endgenerate

endmodule : cache_writelogic