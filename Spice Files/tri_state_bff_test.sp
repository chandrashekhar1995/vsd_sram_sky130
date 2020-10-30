Tristate Buffer

.param temp=27

.lib "/home/chandra/ngspice-nghdl/6T_SRAM/sky130_fd_pr/models/sky130.lib.spice" tt

x1 a in gnd gnd sky130_fd_pr__nfet_01v8 w=1 l=.15 m=1
x2 a in vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x3 b a gnd gnd sky130_fd_pr__nfet_01v8 w=1 l=.15 m=1
x4 b a vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x5 enb en gnd gnd sky130_fd_pr__nfet_01v8 w=1 l=.15 m=1
x6 enb en vdd vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x7 out enb b vdd sky130_fd_pr__pfet_01v8 w=0.42 l=.15 m=1
x8 out en b gnd sky130_fd_pr__nfet_01v8 w=0.42 l=.15 m=1

V1 vdd gnd 1.8v
Vin in 0 pulse(0 1.8 0 60ps 60ps 0.5ns 1ns)
Ven en 0 pulse(0 1.8 0 60ps 60ps 2ns 4ns)
Venb enb 0 pulse(1.8 0 0 60ps 60ps 2ns 4ns)
.tran 0.1p 10n
.control 
run  
plot V(en)+6 V(enb)+4 V(in)+2 V(out)
.endc
.end
