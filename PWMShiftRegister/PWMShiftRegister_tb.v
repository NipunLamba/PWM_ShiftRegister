module tb_PWMShiftRegister;
reg clk;
reg rst;
reg shift_en;
reg data_in;
reg [7:0] pwm_max;
wire pwm_out;
PWMShiftRegister uut (
    .clk(clk),
    .rst(rst),
    .shift_en(shift_en),
    .data_in(data_in),
    .pwm_max(pwm_max),
    .pwm_out(pwm_out)
);

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    shift_en = 0;
    data_in = 0;
    pwm_max = 8'd255;

    // Hold reset
    #20;
    rst = 0;

    // Shift in value: 8'b11000000 (192)
    shift_en = 1;
    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 0; #10;
    data_in = 0; #10;
    data_in = 0; #10;
    data_in = 0; #10;
    data_in = 0; #10;
    shift_en = 0;

    // Let PWM run
    #2000;

    $stop;
end

endmodule
