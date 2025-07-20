`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 07:26:37 PM
// Design Name: 
// Module Name: PC_ALU
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


module PC_ALU (
    input  logic       clk,
    input  logic       rst_n,     // active-low reset
    input  logic [7:0] A,
    output logic [7:0] C
);

    localparam logic [7:0] INCREMENT = 8'd4;  // constant addend

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            C <= '0;
        else
            C <= A + INCREMENT;   // wraps automatically on overflow (mod 256)
    end

endmodule
