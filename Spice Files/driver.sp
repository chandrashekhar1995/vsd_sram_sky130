Write Driver with Precharge 

.param temp=27

**update the path
.lib "/../../SRAM/sky130_fd_pr/models/sky130.lib.spice" tt

x7 1 din gnd gnd sky130_fd_pr__nfet_01v8 w=0.42 l=.15 m=1
x8 1 din vdd vdd sky130_fd_pr__pfet_01v8 w=0.84 l=.15 m=1

x9 2 1 gnd gnd sky130_fd_pr__nfet_01v8 w=0.42 l=.15 m=1
x10 2 1 vdd vdd sky130_fd_pr__pfet_01v8 w=0.84 l=.15 m=1

x11 3 1 vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x12 4 wb 3 vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x13 5 2 vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x14 6 wb 5 vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1

x15 4 wb gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x16 4 1 gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x17 6 wb gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1
x18 6 2 gnd gnd sky130_fd_pr__nfet_01v8 w=0.36 l=.15 m=1

x19 blb 4 gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x20 bl 6 gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1

x21 blb gnd vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x22 bl gnd vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1


V1 vdd gnd dc 1.8V
V2 wb gnd pulse 0 1.8 0 60ps 60ps 2ns 4ns
V3 din gnd pulse 0 1.8 0 60ps 60ps 0.5ns 1ns
*xdriver bl blb wb din vdd gnd driver

.tran 0.1p 10n
.control
run
plot V(wb)+6 V(din)+4 V(bl)+2 V(blb)
.endc
.end 


