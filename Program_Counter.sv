`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 06:49:48 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter (
    input  logic       clk,
    input  logic       rst_n,      // active-low reset
    input  logic [7:0] pc_in,
    output logic [7:0] pc_out
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pc_out <= '0;              // Reset PC to 0
        else
            pc_out <= pc_in;
    end

endmodule
