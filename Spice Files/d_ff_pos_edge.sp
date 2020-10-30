D Flip Flop Positive Edge

.param temp=27

.lib "/home/chandra/ngspice-nghdl/6T_SRAM/sky130_fd_pr/models/sky130.lib.spice" tt

x1 clkb clk vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x2 clkb clk gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x3 1 clk D vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x4 1 clkb D gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x5 2 1 vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x6 2 1 gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x7 3 2 vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x8 3 2 gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x9 1 clkb 3 vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x10 1 clk 3 gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x11 4 clkb 2 vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x12 4 clk 2 gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x13 Q 4 vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x14 Q 4 gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x15 5 Q vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x16 5 Q gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x17 4 clk 5 vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x18 4 clkb 5 gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1

V1 vdd gnd dc 1.8V
V2 D gnd pulse 0 1.8 2.5ns 60ps 60ps 15ns 30ns
V3 clk gnd pulse 0 1.8 0 60ps 60ps 5ns 10ns

.tran 0.1ns 100ns
.control 
run
plot V(Q) V(D)+2 V(clk)+4
.endc
.end

