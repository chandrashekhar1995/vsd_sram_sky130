Write SNM

**update the path
.lib "/../../SRAM/sky130_fd_pr/models/sky130.lib.spice" tt



x1 qb1 q1 gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x4 qb1 q1 vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x5 qb1 vdd vdd gnd sky130_fd_pr__nfet_01v8 w=.58 l=.15 m=1


x2 q2 qb2 gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x3 q2 qb2 vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x6 q2 vdd gnd gnd sky130_fd_pr__nfet_01v8 w=.58 l=.15 m=1

V1 vdd gnd 1.8V
V2 q1 gnd dc 1.8V
V3 qb2 gnd dc 1.8V
.dc V3 0 1.8 0.01 V2 0 1.8 0.01

.control
run
plot V(qb1) vs V(q1) V(qb2) vs V(q2) 
.endc
.END


