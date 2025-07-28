# PWM Shift Register (Verilog)

A simple Verilog project that implements an 8-bit PWM generator using a serial-in shift register. The duty cycle is controlled by shifting bits into the register and comparing with a counter.

## Features
- Serial input for dynamic duty cycle control
- Synthesizable on Basys 3 FPGA
- Includes testbench for simulation

## Files
- `PWMShiftRegister.v` – Main Verilog module  
- `tb_PWMShiftRegister.v` – Testbench  
- `Basys3_Master.xdc` – Constraints file (optional)

## Tools
Vivado | Verilog HDL | Basys 3 | GTKWave
## Author
Nipun Lamba
