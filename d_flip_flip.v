module d_flipflop(
input d, clk, rst,
output reg  q
);

always@(posedge clk or negedge rst) begin
    if(!rst) begin
        q <= 1'b0;   // reset asserted → force output low
    end
    else begin
        q <= ~clk;      // normal operation → capture d
    end
end
endmodule
