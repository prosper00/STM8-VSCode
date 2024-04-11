Simple benchmarking program to measure the number of prime numbers that can be calculated in 1000ms.

Really, a useless program, but the point of this repo is actually the Visual Studio Code setup files, which configure debugging and code completion for an STM8 project.

Prequisites:
- Google, then download and install the STM8-binutils patches, and ensure you can run 'stm8-gdb' on your system
- Google, then install SDCC
- Install VSCode, and the following extensions:
   - marus25.cortex-debug
   - mcu-debug.peripheral-viewer
   - ms-vscode.cpptools
   - ms-vscode.makefile-tools
- Edit the paths in the json files in the .vscode directory of this repo to reflect the paths on your actual system

