module PWMShiftRegister(
    input clk,            //clk
    input rst,            // rst
    input shift_en,       // enable shift
    input data_in,        // serial data in
    input [7:0] pwm_max,  // max PWM counter
    output pwm_out        
);

reg [7:0] shift_reg = 8'b0;
reg [7:0] pwm_cnt = 8'b0;
reg pwm_out_reg;

always @(posedge clk or posedge rst) begin
    if (rst)
        shift_reg <= 8'b0;
    else if (shift_en)
        shift_reg <= {shift_reg[6:0], data_in}; // Shift left
end


always @(posedge clk or posedge rst) begin
    if (rst) begin
        pwm_cnt <= 8'b0;
        pwm_out_reg <= 0;
    end
    else begin
        pwm_cnt <= (pwm_cnt == pwm_max) ? 8'b0 : pwm_cnt + 1;

        if (pwm_cnt < shift_reg)   // Compare with shift register value
            pwm_out_reg <= 1;
        else
            pwm_out_reg <= 0;
    end
end

assign pwm_out = pwm_out_reg;

endmodule
