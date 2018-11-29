module top (
	input clk, resetn,
	output trap,

	output        mem_valid,
	output        mem_instr,
	input         mem_ready,

	output [31:0] mem_addr,
	output [31:0] mem_wdata,
	output [ 3:0] mem_wstrb,
	input  [31:0] mem_rdata
);

    clk_wiz_v3_6 pll(.CLK_IN1(clk), .CLK_OUT1(gclk));

    picorv32 #(
        .ENABLE_COUNTERS(0),
        .TWO_STAGE_SHIFT(0),
        .CATCH_MISALIGN(0),
        .CATCH_ILLINSN(0)
    ) cpu (
        .clk      (gclk     ),
        .resetn   (resetn   ),
        .trap     (trap     ),
        .mem_valid(mem_valid),
        .mem_instr(mem_instr),
        .mem_ready(mem_ready),
        .mem_addr (mem_addr ),
        .mem_wdata(mem_wdata),
        .mem_wstrb(mem_wstrb),
        .mem_rdata(mem_rdata)
    );
endmodule
