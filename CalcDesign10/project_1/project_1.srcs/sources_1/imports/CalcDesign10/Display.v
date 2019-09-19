`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2018 10:00:40
// Design Name: 
// Module Name: Display
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


module DisplayInterface(
    input clock,
    input reset,
    input [15:0] value,
    input [3:0] points,
    output [7:0] segment,
    output reg [7:0] digit
    );
    wire [3:0] h0, h1, h2, h3;
    reg [9:0] count10;
    reg [1:0] count2;
    reg [3:0] hex_value;
    reg point_marker;
    wire [6:0] hex_pattern;
    
    assign h0 = value [3:0];
    assign h1 = value [7:4];
    assign h2 = value [11:8];
    assign h3 = value [15:12];
    
    always @ (posedge clock)
        begin
        if (reset) count10 <= 10'b0;
        else count10 <= (count10 + 10'b1);
        end
    always @ (posedge clock)
        begin
          if (reset) count2 <= 2'b0;
          else if (count10 == 10'b0) count2 <= (count2 + 2'b1);
        end
        
    always @ (h0, h1, h2, h3, count2)
        case (count2)
          2'b00: hex_value = h0;
          2'b01: hex_value = h1;
          2'b10: hex_value = h2;
          2'b11: hex_value = h3;
        endcase
    
    always @ (count2)
        case (count2)
          2'b00: digit = 8'b11111110;
          2'b01: digit = 8'b11111101;
          2'b10: digit = 8'b11111011;
          2'b11: digit = 8'b11110111;
        endcase
    
    always @ (points, count2)
        case (count2)
          2'b00: point_marker = points[0];
          2'b01: point_marker = points[1];
          2'b10: point_marker = points[2];
          2'b11: point_marker = points[3];
        endcase
            
        
    hex2seg part_seg(.number(hex_value), .pattern(hex_pattern));
    assign segment = {hex_pattern, ~(point_marker)};
    
        
        
endmodule
