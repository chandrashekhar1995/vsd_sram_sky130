1-Bit Cell Write

.param temp=27

**update the path
.lib "/../../SRAM/sky130_fd_pr/models/sky130.lib.spice" tt

** 6T Cell 
*inverter 1
x1 q qb gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x4 q qb vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1

*inverter 2
x2 qb q gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x3 qb q vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1

*Access Transistors
x5 bl wl q gnd sky130_fd_pr__nfet_01v8 w=.58 l=.15 m=1
x6 blb wl qb gnd sky130_fd_pr__nfet_01v8 w=.58 l=.15 m=1


*** Driver with Precharge
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

*** Sense Amplifier

x23 f bl a gnd sky130_fd_pr__nfet_01v8 L=0.15 W=0.36
x24 e blb a gnd sky130_fd_pr__nfet_01v8 L=0.15 W=0.36
x25 f e vdd vdd sky130_fd_pr__pfet_01v8 L=0.15 W=1.26
x26 e e vdd vdd sky130_fd_pr__pfet_01v8 L=0.15 W=0.42

*enable
x27 a rd_en gnd gnd sky130_fd_pr__nfet_01v8 L=0.15 W=1.26
*inverter
x28 dout f vdd vdd sky130_fd_pr__pfet_01v8 L=0.15 W=0.84
x29 dout f gnd gnd sky130_fd_pr__nfet_01v8 L=0.15 W=0.42 
 

V1 vdd gnd dc 1.8V
Vwl wl gnd pulse 0 1.8 0 60ps 60ps 5ns 10ns
Vwb wb gnd pulse 1.8 0 0 60ps 60ps 5ns 10ns
Vdin din gnd pulse 0 1.8 0 60ps 60ps 1ns 2ns 
Vrd rd_en gnd dc 0V

.tran 0.1p 20n
.control
run
plot V(bl)+6 V(blb)+4 V(q)+2 V(qb) V(wb)+10 V(din)+8
.endc
.end

