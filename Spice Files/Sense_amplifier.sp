Sense Amplifier
.param temp=27

**update the path
.lib "/../../SRAM/sky130_fd_pr/models/sky130.lib.spice" tt

*amplifier

x1 f bl a gnd sky130_fd_pr__nfet_01v8 L=0.15 W=0.36
x2 e blb a gnd sky130_fd_pr__nfet_01v8 L=0.15 W=0.36
x3 f e vdd vdd sky130_fd_pr__pfet_01v8 L=0.15 W=1.26
x4 e e vdd vdd sky130_fd_pr__pfet_01v8 L=0.15 W=0.42

*enable
x5 a rd_en gnd gnd sky130_fd_pr__nfet_01v8 L=0.15 W=1.26
*inverter
x6 dout f vdd vdd sky130_fd_pr__pfet_01v8 L=0.15 W=0.84
x7 dout f gnd gnd sky130_fd_pr__nfet_01v8 L=0.15 W=0.42 

V1 vdd gnd dc 1.8v
V2 blb 0 pulse 1.8 0 0 60ps 60ps 1ns 2ns
V3 bl 0 pulse 0 1.8 0 60ps 60ps 1ns 2ns
V4 rd_en 0 pulse 0 1.8 0 60ps 60ps 5ns 10ns

.tran 0.1p 20n
.control
run
plot V(rd_en)+6 V(bl)+4 V(blb)+2 V(dout) 
.endc
.end
