module tb_d_flipflop;

    reg d, clk, rst;
    wire out;

    d_flipflop uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(out)          // connect DUT's q port to testbench's out wire
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
    d   = 1;     
    rst = 0;

    #20;
    rst = 1;     

    #200;
    $finish;
end

    initial begin
        $monitor("t=%0t | clk=%b rst=%b d=%b out=%b", $time, clk, rst, d, out);  // q -> out
    end

    initial begin
        $fsdbDumpfile("freq_div_2.fsdb");
        $fsdbDumpvars(0, tb_d_flipflop);
    end

endmodule