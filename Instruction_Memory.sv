`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 05:45:03 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory (
    input  logic        rst_n,          // Active-high reset (clears memory on *falling* edge)
    input  logic [7:0] Address,        // Full byte address (we'll index with upper bits)
    output logic [31:0] Instruction
);

    logic [31:0] memory [0:63];         // 64 words of 32 bits

    // Asynchronous read (word-aligned: ignore bottom 2 address bits)
    assign Instruction = memory[Address[7:2]];

    // Clear memory on *negedge* of Reset (as you originally requested)
    always @(negedge rst_n) begin
        for (int i = 0; i < 64; i++) begin
            memory[i] = '0;              // blocking ok: single procedural block
        end
    end

endmodule

