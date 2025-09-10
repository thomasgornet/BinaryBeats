module pixel_color(
    input logic [9:0] drawX, 
    input logic [9:0] drawY,
    input logic [7:0] rom_data,
    input logic [31:0] sram_data,
    output logic [3:0]  Red, Green, Blue,
    output logic [13:0] sram_addr,
    output logic [10:0] rom_addr,
    output logic sram_enb,
    input logic clk,
    input logic [31:0] score,
    input logic [31:0] high_score,
    output logic [16:0] ram_addr,
    input logic [1:0] color
);

logic [16:0] pixAddr;
logic [2:0] byteAddr;
logic [31:0] data;
logic [13:0] addr;
logic [3:0] pixel;
logic [11:0] palette;
logic [16:0] y_ext;
logic colored;
logic [16:0] divY, divX;


logic [2:0] byteAddr_d;
logic [9:0] tempX, tempY;
logic [7:0] character;
logic [16:0] ram;
always_ff @ (posedge clk) begin
    sram_addr <= addr;
    byteAddr_d <= byteAddr;
    data <= sram_data;
    ram_addr <= ram;
end

always_comb begin
    y_ext = {7'b0, drawY};
    sram_enb = 1'b1;
    tempX = 0;
    tempY = 0;
    character = 0;
    colored = 0;
    rom_addr=0;
    ram = 0;
    Red=0;
    Green=0;
    Blue=0;
    divX = {7'd0, drawX[9:1]};
    divY = {7'd0, drawY[9:1]};
    ram = divX + (divY<<8) + (divY<<6);
        case(color)
            2'b00: begin
                Red = 4'h0;
                Green=4'h0;
                Blue=4'h0;
            end
            2'b01: begin
                Red = 4'h6;
                Green=4'hC;
                Blue=4'hC;
            end
            
            2'b10: begin
                Red = 4'hD;
                Green=4'h2;
                Blue=4'h6;
            end
            
            2'b11: begin
                Red = 4'h3;
                Green=4'h5;
                Blue=4'h6;
            end
            
        endcase
    if (drawX < 220 || drawX > 419) begin
        pixAddr = 0;
        addr = 0;
        byteAddr = 0;
        palette = 0;
        pixel = 0;
        if(score[29:29] == 1'b0) begin
        if(drawX > 419 && drawX <484 && drawY > 99 && drawY < 116) begin
            tempX = drawX - 420;
            tempY = drawY - 100;
            case(tempX[5:3])
                3'b010: character = score[31:28] + 8'h2F;
                3'b011: character = score[27:24] + 8'h2F;
                3'b100: character = score[23:20] + 8'h2F;
                3'b101: character = score[19:16] + 8'h2F;
                3'b110: character = score[15:12] + 8'h2F;
                3'b111: character = score[11:8] + 8'h2F;
                3'b000: character = 8'h2F;
                3'b001: character = 8'h2F;
           
            endcase
                if(character != 7'h2F) begin
                rom_addr = {character[6:0], tempY[3:0]};
                colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'hf;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
               
                end
            end
            if(drawX > 419 && drawX <484 && drawY > 49 && drawY < 66) begin
            tempX = drawX - 420;
            tempY = drawY - 50;
            case(tempX[5:3])
                3'b010: character = high_score[31:28] + 8'h2F;
                3'b011: character = high_score[27:24] + 8'h2F;
                3'b100: character = high_score[23:20] + 8'h2F;
                3'b101: character = high_score[19:16] + 8'h2F;
                3'b110: character = high_score[15:12] + 8'h2F;
                3'b111: character = high_score[11:8] + 8'h2F;
                3'b000: character = 8'h2F;
                3'b001: character = 8'h2F;
           
            endcase
                if(character != 7'h2F) begin
                rom_addr = {character[6:0], tempY[3:0]};
                colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'hf;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
               
                end
            end
            if(score[28:28] == 1'b1) begin
                if(drawX > 429 && drawX <494 && drawY > 24 && drawY < 41) begin
                tempX = drawX - 430;
                tempY = drawY - 75;
                case(tempX[5:3])
                3'b010: character = 8'h2D;
                3'b011: character = 8'h53;
                3'b100: character = 8'h43;
                3'b101: character = 8'h4F;
                3'b110: character = 8'h52;
                3'b111: character = 8'h45;
                3'b000: character = 8'h48;
                3'b001: character = 8'h49;
           
            endcase
                
                rom_addr = {character[6:0], tempY[3:0]};
                colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'hf;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 429 && drawX <470 && drawY > 74 && drawY < 91) begin
                tempX = drawX - 430;
                tempY = drawY - 25;
                case(tempX[5:3])
                3'b010: character = 8'h4F;
                3'b011: character = 8'h52;
                3'b100: character = 8'h45;
                3'b101: character = 0;
                3'b110: character = 0;
                3'b111: character = 0;
                3'b000: character = 8'h53;
                3'b001: character = 8'h43;
           
            endcase
                
                rom_addr = {character[6:0], tempY[3:0]};
                colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'hf;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
            end
            end
       end
       
    else begin
    pixAddr = ((y_ext<<7) + (y_ext<<6) + (y_ext<<3) + (drawX-220));
    addr = pixAddr[16:3];
    byteAddr = pixAddr[2:0];
    
    case(byteAddr_d)
        3'b000: pixel = data[3:0];
        3'b001: pixel = data[7:4];
        3'b010: pixel = data[11:8];
        3'b011: pixel = data[15:12];
        3'b100: pixel = data[19:16];
        3'b101: pixel = data[23:20];
        3'b110: pixel = data[27:24];
        3'b111: pixel = data[31:28];
    endcase
    
    case(pixel)
        4'b0000: palette = 12'h000; // Black
        4'b0001: palette = 12'hbbb; // Light Gray
        4'b0010: palette = 12'hf33; // Red
        4'b0011: palette = 12'he94; // Orange
        4'b0100: palette = 12'hed0; // Yellow
        4'b0101: palette = 12'h4d8; // Green
        4'b0110: palette = 12'h36b; // Dark Blue
        4'b0111: palette = 12'h2cb; // Cyan
        4'b1000: palette = 12'h639; // Purple
        4'b1001: palette = 12'hf7d; // Pink
        4'b1010: palette = 12'h631; // Brown
        4'b1011: palette = 12'h555; // Dark Gray
        4'b1100: palette = 12'h6ae; // Light Blue
        4'b1101: palette = 12'h6CC; // Dark Cyan
        4'b1110: palette = 12'h111; // CLEAR
        4'b1111: palette = 12'hfff; // White
    endcase
    if(palette != 12'h111) begin
        Red = palette[11:8];
        Green = palette[7:4];
        Blue = palette[3:0];
    end
    if(score[29:29] == 1'b1) begin
        
        if(drawX > 289 && drawX <354 && drawY > 99 && drawY < 116) begin
            tempX = drawX - 290;
            tempY = drawY - 100;
            case(tempX[5:3])
                3'b010: character = score[31:28] + 8'h2F;
                3'b011: character = score[27:24] + 8'h2F;
                3'b100: character = score[23:20] + 8'h2F;
                3'b101: character = score[19:16] + 8'h2F;
                3'b110: character = score[15:12] + 8'h2F;
                3'b111: character = score[11:8] + 8'h2F;
                3'b000: character = 8'h2F;
                3'b001: character = 8'h2F;
           
            endcase
                if(character != 7'h2F) begin
                rom_addr = {character[6:0], tempY[3:0]};
                colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'hf;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
               
                end
            end
            if(drawX > 289 && drawX <354 && drawY > 49 && drawY < 66) begin
            tempX = drawX - 290;
            tempY = drawY - 50;
            case(tempX[5:3])
                3'b010: character = high_score[31:28] + 8'h2F;
                3'b011: character = high_score[27:24] + 8'h2F;
                3'b100: character = high_score[23:20] + 8'h2F;
                3'b101: character = high_score[19:16] + 8'h2F;
                3'b110: character = high_score[15:12] + 8'h2F;
                3'b111: character = high_score[11:8] + 8'h2F;
                3'b000: character = 8'h2F;
                3'b001: character = 8'h2F;
           
            endcase
                if(character != 7'h2F) begin
                rom_addr = {character[6:0], tempY[3:0]};
                colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'hf;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
               
                end
            end
            if(score[29:29] == 1'b1) begin
                if(drawX > 289 && drawX <354 && drawY > 24 && drawY < 41) begin
                tempX = drawX - 290;
                tempY = drawY - 75;
                case(tempX[5:3])
                3'b010: character = 8'h2D;
                3'b011: character = 8'h53;
                3'b100: character = 8'h43;
                3'b101: character = 8'h4F;
                3'b110: character = 8'h52;
                3'b111: character = 8'h45;
                3'b000: character = 8'h48;
                3'b001: character = 8'h49;
           
            endcase
                
                rom_addr = {character[6:0], tempY[3:0]};
                colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'hf;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 289 && drawX <354 && drawY > 74 && drawY < 91) begin
                tempX = drawX - 290;
                tempY = drawY - 25;
                case(tempX[5:3])
                3'b010: character = 8'h4F;
                3'b011: character = 8'h52;
                3'b100: character = 8'h45;
                3'b101: character = 0;
                3'b110: character = 0;
                3'b111: character = 0;
                3'b000: character = 8'h53;
                3'b001: character = 8'h43;
           
            endcase
                
                rom_addr = {character[6:0], tempY[3:0]};
                colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'hf;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                
            end
            if(score[31:30] == 2'b00) begin
                if(drawX > 269 && drawX <278 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 270;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 319 && drawX <328 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 320;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 369 && drawX <378 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 370;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                
                
                
            end
            
            if(score[31:30] == 2'b01) begin
                if(drawX > 269 && drawX <278 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 270;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 319 && drawX <328 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 320;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 369 && drawX <378 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 370;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
            end
            
            if(score[31:30] == 2'b01) begin
                if(drawX > 269 && drawX <278 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 270;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 319 && drawX <328 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 320;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 369 && drawX <378 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 370;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'h8;
                        Green = 4'h8;
                        Blue = 4'h8;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
            end
           
            if(score[31:30] == 2'b01) begin
                if(drawX > 269 && drawX <278 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 270;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'hf;
                        Green = 4'hf;
                        Blue = 4'h0;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 319 && drawX <328 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 320;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'h8;
                        Green = 4'h8;
                        Blue = 4'h8;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 369 && drawX <378 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 370;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'h8;
                        Green = 4'h8;
                        Blue = 4'h8;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
            end
            if(score[31:30] == 2'b01) begin
                if(drawX > 269 && drawX <278 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 270;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'h8;
                        Green = 4'h8;
                        Blue = 4'h8;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 319 && drawX <328 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 320;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'h8;
                        Green = 4'h8;
                        Blue = 4'h8;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
                if(drawX > 369 && drawX <378 && drawY > 174 && drawY < 191) begin
                    tempX = drawX - 370;
                    tempY = drawY - 175;
                    rom_addr = {7'h0f, tempY[3:0]};
                    colored = rom_data[7 - tempX[2:0]];
                    if (colored) begin
                        Red = 4'h8;
                        Green = 4'h8;
                        Blue = 4'h8;
                    end 
                    else begin
                        Red = 4'h0;
                        Green = 4'h0;
                        Blue = 4'h0;
                    end
                end
            end
        
        
    end
    
    
    
    end
end
endmodule