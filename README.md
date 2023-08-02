# SENG-440
Repo for storing the SENG 440 project code.

## Objective
Provide a RGB to YCC colour conversion ASIP. Code will be written in C and compiled for an ARM processor with architecture armv4tl.

## Verification
The following describes how to test and verify various aspects of the design.
### Directions for running C code
To run, please compile the mainOptimzed.c file with 
```
gcc mainO.c -o mainO.exe
```

Copy the executable to the arm machine. You may have to enable permissions to execute using chmod +x ./main.exe

Please run the code using ./main.exe

If benchmark is set to 1, you should be presented with a total time and a conversion time in seconds.

If desired, you may install valgrind callgrind and run it on the executable to view the instruction execution count.

### Directions for running VHDL
Use Xilinx Vivado to synthesize the code and testbench. Use input and output gate delays of 5ns, and run a timing simulation. Design should perform similarly regardless of which stage of the EDA the timing simulation is run at. The expected values are listed in comments in the testbench, and more can be generated using https://www.picturetopeople.org/color_converter.html, making sure to convert the RGB from decimal to hex, and respecting the little-endian storage scheme. Correct output can be verified by the timing diagram of the simulation.

## Sources
https://sistenix.com/rgb2ycbcr.html

Kieth Jack, "Video Demystified" 4th ed.
