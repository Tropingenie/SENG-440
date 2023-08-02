# SENG-440
Repo for storing the SENG 440 project code.

## Objective
Provide a RGB to YCC colour conversion ASIP. Code will be written in C and compiled for an ARM processor.

## Notes
This code was compiled and ran on the Real ARM machine using telnet, following the instructions in the Announcement section on Brightspace. The arm processor used had architecture armv4tl.

## Directions for running C code
To run, please compile the mainOptimzed.c file with 
```
gcc mainO.c -o mainO.exe
```

Copy the executable to the arm machine. You may have to enable permissions to execute using chmod +x ./main.exe

Please run the code using ./main.exe

If benchmark is set to 1, you should be presented with a total time and a conversion time in seconds.

## Sources
https://sistenix.com/rgb2ycbcr.html

Kieth Jack, "Video Demystified" 4th ed.
