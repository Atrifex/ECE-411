module mp2_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;
logic pmem_resp;
logic pmem_read;
logic pmem_write;
logic [15:0] pmem_address;
logic [127:0] pmem_rdata;
logic [127:0] pmem_wdata;
logic mem_read, mem_write, mem_resp;
logic [1:0] mem_byte_enable;
logic [15:0] mem_address, mem_wdata, mem_rdata,

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

initial begin: TEST SIGNALS
mem_read = 0;
mem_write = 0;
mem_byte_enable = 0;
mem_address = 0;
mem_wdata = 0;



cache cache_inst
(
    .clk,

    .mem_read, .mem_write, .mem_byte_enable,
    .mem_address, .mem_wdata,
    .mem_resp, .mem_rdata,

    .pmem_resp, .pmem_rdata,                                 
    .pmem_read, .pmem_write, .pmem_address, .pmem_wdata
);

physical_memory memory
(
    .clk,
    .read(pmem_read),
    .write(pmem_write),
    .address(pmem_address),
    .wdata(pmem_wdata),
    .resp(pmem_resp),
    .rdata(pmem_rdata)
);




endmodule : mp2_tb
