`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 01:38:48 AM
// Design Name: 
// Module Name: RISC_V_Processor
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


module RISC_V_Processor(
    input  logic       clk,
    input  logic       rst_n,
    input  logic       pc_control,
    input  logic [7:0] pc_in,          // external input for jump address
    output logic [31:0] instruction
);
    logic [7:0] address;
    logic [7:0] pc_next;

    // MUX for PC source
    logic [7:0] pc_source;
    assign pc_source = pc_control ? pc_in : pc_next;

    Program_Counter pc (
        .clk(clk),
        .rst_n(rst_n),
        .pc_in(pc_source),
        .pc_out(address)
    );

    PC_ALU pc_alu (
        .clk(clk),
        .rst_n(rst_n),
        .A(address),
        .C(pc_next)
    );

    Instruction_Memory im (
        .rst_n(rst_n),
        .Address(address),
        .Instruction(instruction)
    );
endmodule

