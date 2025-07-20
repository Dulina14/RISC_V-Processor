# RISC_V-Processor
readme_content = """# RISC-V Processor (SystemVerilog)

This project implements a simplified **RISC-V processor** in **SystemVerilog**, focusing on the core concepts of instruction fetching and program counter management. The design includes three main components:  
- **Program Counter (PC)** – Handles the current instruction address and supports control signals for hold/load operations.  
- **PC_ALU** – Calculates the next program counter value by incrementing the current PC.  
- **Instruction Memory** – Provides instruction data (32-bit words) based on the PC address.  

All components are integrated into the top module `RISC_V_Processor`, and a dedicated testbench (`RSIC_tb`) is provided to simulate and verify the functionality.

---

## **Features**
- Basic instruction fetch cycle.
- Modular design for easy extension.
- Testbench for functional verification.
- Compatible with **Vivado** and **EDA Playground** simulations.

---

## **How to Simulate**
1. **Using Vivado:**
   - Create a new Vivado project and add all `.sv` files.
   - Set `RSIC_tb.sv` as the top simulation source.
   - Run the behavioral simulation.

2. **Using EDA Playground:**
   - Upload the `RISC_V_Processor.sv` and `RSIC_tb.sv` files.
   - Select **SystemVerilog (VCS)** as the simulator.
   - Enable waveform dumping and run the simulation.

---

## **Future Improvements**
- Add an instruction decoder.
- Implement a register file and ALU for arithmetic operations.
- Add support for simple RISC-V instructions.
"""

# Save to a file
readme_path = "/mnt/data/README.md"
with open(readme_path, "w") as f:
    f.write(readme_content)

readme_path
