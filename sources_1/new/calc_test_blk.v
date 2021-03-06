`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 04:28:36 PM
// Design Name: 
// Module Name: calc_test_blk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calc_test_blk(
    input btnCLK,
    input mvD, mvL, mvR, mvRot,
    input [4:0] cur_x, cur_y,
    input [1:0] cur_rot,
    output reg [4:0] test_x, test_y,
    output reg [1:0] test_rot
    );
    
    always @ (*) begin
        if (mvD) begin
            test_x = cur_x;
            test_y = cur_y - 1;
            test_rot = cur_rot;
        end else if (mvL) begin
            test_x = cur_x - 1;
            test_y = cur_y;
            test_rot = cur_rot;
        end else if (mvR) begin
            test_x = cur_x + 1;
            test_y = cur_y;
            test_rot = cur_rot;
        end else if (mvRot) begin
            test_x = cur_x;
            test_y = cur_y;
            test_rot = cur_rot + 1;
        end else begin // else gameclk moves it down
            test_x = cur_x;
            test_y = cur_y - 1;
            test_rot = cur_rot;
        end
    end
endmodule
