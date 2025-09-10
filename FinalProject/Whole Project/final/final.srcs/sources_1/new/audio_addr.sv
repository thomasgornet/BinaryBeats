module audio_addr(
    output logic [24:0] addr,
    input logic [15:0] data_in,
    output logic [7:0] data_out,
    input logic clk,
    input logic reset,
    input logic start
    );
    
    logic [11:0] counter;
    logic [23:0] end_addr;
    assign end_addr = 24'h575878;
    logic ready;
   
    always_comb begin
        if(addr[0])
            data_out=data_in[7:0];
        else
            data_out=data_in[15:8];
    end
    
    always_ff @(posedge clk) begin
        if(reset == 1'b1) begin
            counter <= 0;
            addr <= 0;
            ready<=0;   
        end 
        else begin
            if(ready == 1'b0) begin
                if(start) begin
                    ready<=1;
                end
            end
            else begin
                if(start) begin
                    addr<=0;
                    counter<=0;
                end
                else if(addr[24:1] != end_addr) begin
                    if(counter == 1134) begin
                        counter <= 0;
                        addr <= addr+1;
                    end
                    else begin
                        counter <= counter+1;
                        end
                    end
            end
            
       end
        
       
        
        
        
    end
    
 
endmodule