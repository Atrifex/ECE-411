module cache_tb;

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
logic [15:0] mem_address, mem_wdata, mem_rdata;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

initial 
begin: TEST_SIGNALS
	mem_read = 0;
	mem_write = 0;
	mem_byte_enable = 0;
	mem_address = 0;
	mem_wdata = 0;

	/********************* Way 0 Tests *********************/
	// Read miss, clean, way 0, set 0
	#5 
		mem_read = 1;
	wait(mem_resp == 1);
	#10 
		mem_read = 0;
	
	// Read hit, clean, way 0, set 0
	#10 
		mem_address = {9'h0, 3'h0,3'h1,1'b0};
		mem_read = 1;
	wait(mem_resp == 1);
	#10 
		mem_read = 0;
		
	// Write hit, clean, way 0, set 0, high byte
	#10 
		mem_address = {9'h0, 3'h0,3'h1,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b10;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
	
	// Write hit, way 0, set 0, low byte
	#10 
		mem_address = {9'h0, 3'h0,3'h1,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b01;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
	
	// Write miss, clean, way 0, set 1
	#10 
		mem_address = {9'h0, 3'h1,3'h0,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b11;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
		
	// Read hit, dirty, way 0, set 1
	#10 
		mem_address = {9'h0, 3'h1,3'h0,1'b0};
		mem_read = 1;
	wait(mem_resp == 1);
	#10 
		mem_read = 0;
	
	// Read miss, dirty, way 0, set 2
	#10 
		mem_address = {9'h0, 3'h2,3'h0,1'b0};
		mem_read = 1;
	wait(mem_resp == 1);
	#10 
		mem_read = 0;
		
	// Write miss, dirty, way 0, set 3
	#10 
		mem_address = {9'h0, 3'h3,3'h0,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b11;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
		
	// Write hit, dirty, way 0, set 3
	#10 
		mem_address = {9'h0, 3'h3,3'h1,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b11;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;

	/********************* Way 1 Tests *********************/
	// Read miss, clean, way 1, set 0
	#10 
		mem_address = {9'h2, 3'h0,3'h0,1'b0};
		mem_read = 1;
	wait(mem_resp == 1);
	#10 
		mem_read = 0;
	
	// Read hit, clean, way 1, set 0
	#10 
		mem_address = {9'h2, 3'h0,3'h1,1'b0};
		mem_read = 1;
	wait(mem_resp == 1);
	#10 
		mem_read = 0;
		
	// Write hit, clean, way 1, set 0, high byte
	#10 
		mem_address = {9'h2, 3'h0,3'h1,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b10;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
	
	// Write hit, way 1, set 0, low byte
	#10 
		mem_address = {9'h2, 3'h0,3'h1,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b01;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
	
	// Write miss, clean, way 1, set 1
	#10 
		mem_address = {9'h2, 3'h1,3'h0,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b11;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
		
	// Read hit, dirty, way 1, set 1
	#10 
		mem_address = {9'h2, 3'h1,3'h0,1'b0};
		mem_read = 1;
	wait(mem_resp == 1);
	#10 
		mem_read = 0;
	
	// Read miss, dirty, way 1, set 2
	#10 
		mem_address = {9'h2, 3'h2,3'h0,1'b0};
		mem_read = 1;
	wait(mem_resp == 1);
	#10 
		mem_read = 0;
		
	// Write miss, dirty, way 1, set 3
	#10 
		mem_address = {9'h2, 3'h3,3'h0,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b11;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
		
	// Write hit, dirty, way 1, set 3
	#10 
		mem_address = {9'h2, 3'h3,3'h1,1'b0};
		mem_wdata = 16'h600D;
		mem_byte_enable = 2'b11;
		mem_write = 1;
	wait(mem_resp == 1);
	#10 
		mem_write = 0;
		
end

cache DUT
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

endmodule : cache_tb
