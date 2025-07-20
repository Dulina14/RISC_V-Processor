`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 11:19:28 AM
// Design Name: 
// Module Name: RSIC_tb
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


module RSIC_tb;
    logic clk = 0;
    logic rst_n;
    logic pc_control;
    logic [7:0] pc_in;
    logic [31:0] instruction;

    // Instantiate the DUT (Device Under Test)
    RISC_V_Processor uut (
        .clk(clk),
        .rst_n(rst_n),
        .pc_control(pc_control),
        .pc_in(pc_in),
        .instruction(instruction)
    );

    // Clock generation: 1ns period = 500ps high + 500ps low
    always #500 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize signals
        rst_n = 0;
        pc_control = 0;
        pc_in = 0;

        // Apply reset
        #1000;
        rst_n = 1;          // Deassert reset (active-low reset)
        
        // Wait and toggle control
        #5000;
        pc_control = 1;     // Hold PC
        #5000;
        pc_control = 0;     // Allow PC to increment
        
        // Run for a while
        #20000;
        $stop;              // Stop simulation
    end
endmodule

