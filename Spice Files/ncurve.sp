N-Curve

.lib "/home/chandra/ngspice-nghdl/6T_SRAM/sky130_fd_pr/models/sky130.lib.spice" tt



x1 Q Qb gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x4 Q Qb vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x5 bl wl Q gnd sky130_fd_pr__nfet_01v8 w=0.58 l=.15 m=1


x2 Qb Q gnd gnd sky130_fd_pr__nfet_01v8 w=0.84 l=.15 m=1
x3 Qb Q vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x6 blb wl Qb gnd sky130_fd_pr__nfet_01v8 w=0.58 l=.15 m=1

V1 vdd gnd dc 1.8V
Vin Q gnd dc 1.8V
Vwl wl gnd dc 1.8v
Vbl bl gnd dc 1.8v
Vblb blb gnd dc 1.8v

.dc Vin 0 1.8 0.01
.control
run
plot -I(Vin)
.endc
.end
