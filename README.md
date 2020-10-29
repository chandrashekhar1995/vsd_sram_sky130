# SRAM
Design of 1024*32 (4kB) SRAM 1.8V with access time < 2.5ns using OpenRAM

This project aims to develop a 1024 *32 (4kB) SRAM with supply voltage 1.8V and access time < 2.5ns. Circuits required as inputs to the OpenRAM compiler are designed and simulated.
Table of Contents

    Custom Cells Required for OpenRAM
    Prelayout Simulations
    Postlayout Simulations
    Future Work
    Acknowledgements
    Contact Information

Custom Cells Required for OpenRAM

    SRAM Bit cell
    Sense Amplifier
    Write Driver
    Tristate Buffer
    D-Flip Flop

Prelayout Simulations

To clone the Repository and download the Netlist files for Simulation, enter the following commands in your terminal.

$  sudo apt install -y git
$  git clone https://github.com/yash-k33/vsdsram
$  cd vsdsram/Simulation/Prelayout

1. 6T Cell

-> Read Operation

$ ngspice cell6T_read.cir

-> Write Operation

$ ngspice cell6T_write.cir

6T Cell Stability
-> SNM Calculation

The stability and writability of the cell are quantified by the hold margin, read margin and write margin which are determined by the static noise margin (SNM). It determines how much noise can be applied at the inputs of the two cross coupled inverters before a stable state is lost during hold or read operaring mode or a second stable state is created during write operation.

1. Hold SNM

$ ngspice holdsnm.cir


By fitting a square in the upper and lower loop, we get SNMh = 0.91V and SNMl = 0.61V respectively.
Hold SNM = min (SNMh, SNMl) = 0.61V

2. Read SNM

$ ngspice readsnm.cir


Similarly,
Read SNM = min (SNMh, SNMl) = min (0.48V, 0.39V) = 0.39V

3. Write SNM

$ ngspice writesnm.cir


By fitting the smallest square between the two curves, we get
Write SNM = 1.065V
-> N-Curve

N-curve provides the current flow information along with the voltage metrics which is equally important for an overall analysis of cell stability.

$ ngspice ncurve.cir

Read Stability Metrics

Static Voltage Noise Margin (SVNM) - It is the maximum tolerable dc noise voltage at internal nodes of the bitcell before its content flips and it is measured as the difference between point C and point A.
SVNM = 0.617V

Static Current Noise Margin (SINM) - It is the maximum tolerable dc noise current injected at internal nodes of the bitcell before its content changes and it is denoted by point B.
SINM = 255.67uA

Write Stability Metrics

Write Trip Voltage (WTV) - It is the minimum voltage drop needed to change the internal nodes of the bitcell and it is measured as the difference between point E and point C.
WTV = 0.988V

Write Trip Current (WTI) - It is the minimum amount of current needed to write the bitcell and it denoted by point D.
WTI = -53.47uA
2. Sense Amplifier

Run the netlist file using the following command:

$ ngspice senseamp.cir

3. Write Driver

Run the netlist file using the following command:

$ ngspice writedriver.cir

4. Tristate Buffer

Run the netlist file using the following command:

$ ngspice tristatebuff.cir

5. Positive Edge Triggered DFF

Run the netlist file using the following command:

$ ngspice dff.cir

1-Bit SRAM

-> Read Operation

$ ngspice 1bitsram_read.cir

-> Write Operation

$ ngspice 1bitsram_write.cir

