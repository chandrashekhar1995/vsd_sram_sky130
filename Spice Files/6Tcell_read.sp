6T Cell Read

.param temp=27

**update the path
.lib "/../../SRAM/sky130_fd_pr/models/sky130.lib.spice" tt


*inverter 1
x1 q qb gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x4 q qb vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1

*inverter 2
x2 qb q gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x3 qb q vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1

*Access Transistors
x5 bl wl q gnd sky130_fd_pr__nfet_01v8 w=.58 l=.15 m=1
x6 blb wl qb gnd sky130_fd_pr__nfet_01v8 w=.58 l=.15 m=1


V1 vdd gnd dc 1.8v
Vwl wl gnd pulse 0 1.8 0 60ps 60ps 20ns 40ns
Vq q gnd pulse 0 1.8 0 60ps 60ps 5ns 10ns

.tran 0.1n 100n 
.control
run
plot V(wl)+8 V(bl)+2 V(blb) V(q)+6 V(qb)+4
.endc
.end
