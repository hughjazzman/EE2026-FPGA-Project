`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 08:28:16 PM
// Design Name: 
// Module Name: changestate
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


module changestate(
    input clk, btnC, micD, pw_flag,
    input [2:0] menu_flag, // menu flag
    output reg [2:0] state = 5
    );
    
    always @ (posedge clk) begin
        // If in menu when pw_flag received, change to state 5
        // If btnC is pressed, and in menu, change to menu flag, else change to lockscreen.
        state <= (pw_flag && state == 5 && micD) ? 0 : 
                 ((!pw_flag || !micD) && state == 5) ? 5 : 
                  btnC && state != 5 ? 
                 !state ? menu_flag == 5 ? 5 : menu_flag : 5 : state;
//        state <= btnC ? (!state ? menu_flag : 0) : state;
    end
    // : 2
endmodule
