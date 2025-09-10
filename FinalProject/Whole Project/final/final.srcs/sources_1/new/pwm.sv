module pwm
( 
    input logic clk,
    input logic reset,
    input logic [7:0] audio_in,
    output logic pwm_o,
    input logic start
);
    logic [7:0] counter;
    logic ready;
    always_comb begin
        if(counter < audio_in) begin
            pwm_o = 1;
        end 
        else begin
            pwm_o = 0;
        end
    end

    always_ff @(posedge clk) begin
        if(reset == 1'b1) begin
            counter <= 0;
            ready <=0;
        end
        else begin
            if(ready == 1'b0) begin
                if(start == 1'b1) begin
                    ready <= 1'b1;
                end
            end 
            else begin
                if(start == 1'b1) begin
                    counter <= 1'b0;
                end else begin
                    counter <= counter+1;
                end
            end
        end
    end

    
endmodule