import lc3b_types::*;

module cache_datapath
(
    input clk,

    /* Control signals */
    input load_lru, writeback_ctrlsig,
    input load_d0, load_v0, load_TD0, d_in0, v_in0,
    input load_d1, load_v1, load_TD1, d_in1, v_in1,
    output logic lru_out, d_out0, d_out1, hit,

    /* CPU signals */
    input lc3b_mem_wmask mem_byte_enable,
    input lc3b_word mem_address, mem_wdata,
    output lc3b_word mem_rdata,

    /* Memory signals */
    input lc3b_cacheline pmem_rdata,
    output lc3b_word pmem_address,
    output lc3b_cacheline pmem_wdata
);

/* Internal Signals */
logic hit0, hit1, v_out0, v_out1;

assign hit0 = (v_out0 & (mem_address[15:7] == tag0));
assign hit1 = (v_out1 & (mem_address[15:7] == tag1));
assign hit = hit0 | hit1;

array #(1) lru
(
    .clk,
    .write(load_lru),
    .index(mem_address[6:4]),
    .datain(hit0),
    .dataout(lru_out)
);


way way0
(
    .clk,

    /* Way Input Signals */
    .load_d(load_d0), .load_v(load_v0), .load_TD(load_TD0), .index(mem_address[6:4]),
    .d_in(d_in0), .v_in(v_in0), .tag_in(mem_address[15:7]), .data_in(write_logic_out),

    /* Way Output Signals */
    .d_out(d_out0), .v_out(v_out0), .tag_out(tag0), .data_out(data_out0)
);

way way1
(
    .clk,

    /* Way Input Signals */
    .load_d(load_d1), .load_v(load_v1), .load_TD(load_TD1), .index(mem_address[6:4]),
    .d_in(d_in1), .v_in(v_in1), .tag_in(mem_address[15:7]), .data_in(write_logic_out),

    /* Way Output Signals */
    .d_out(d_out1), .v_out(v_out1), .tag_out(tag1), .data_out(data_out1)
);


mux2 #(128) wayselector_mux
(
    .sel(hit0 | writeback_ctrlsig),
    .a(data_out1),
    .b(data_out0),
    .f(wayselector_out)
);

mux8 #(16) mem_rdata_mux
(
    .sel(mem_address[3:1]),
    .a(wayselector_out[127:112]),
    .b(wayselector_out[111:96]),
    .c(wayselector_out[95:80]),
    .d(wayselector_out[79:64]),
    .e(wayselector_out[63:48]),
    .f(wayselector_out[47:32]),
    .g(wayselector_out[31:16]),
    .h(wayselector_out[15:0]),
    .y(mem_rdata)
);



endmodule : cache_datapath
