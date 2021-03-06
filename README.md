# Design of 1024*32 (4kB) SRAM 1.8V with access time &lt; 2.5ns using OpenRAM with Skywater SKY130 PDK

This project aims to develop a 1024 *32 (4kB) SRAM with supply voltage 1.8V and access time < 2.5ns. Circuits required as inputs to the OpenRAM compiler are designed and simulated.

# Table of Contents  
- [Custom Cells Required for OpenRAM](#custom-cells-required-for-openram)  
- [Prelayout Simulations](#prelayout-simulations)   
- [Acknowledgements](#acknowledgements)  
- [Contact Information](#contact-information)  

# Custom Cells Required for OpenRAM 

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/OpenRam.png)

* SRAM Bit cell  
* Sense Amplifier  
* Write Driver  
* Tristate Buffer  
* D-Flip Flop  

# Prelayout Simulations  
To clone the Repository and download the Netlist files for Simulation, enter the following commands in your terminal.  
```
$  sudo apt install -y git
$  git clone https://github.com/chandrashekhar1995/SRAM
$  cd SRAM
$  git clone https://foss-eda-tools.googlesource.com/skywater-pdk/libs/sky130_fd_pr
$  cd Spice\ Files/
```
Before Running any simluation,make sure that the path of your library file is updated in the spice files.


### 1. 6T Cell

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/6T%20Cell%20(2).bmp)

**-> Read Operation**  

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/6T_Cell_read.png)

```
$ ngspice 6Tcell_read.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/6T_read.png)

**-> Write Operation**



![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/6T_Cell_write.png)
  
```
$ ngspice 6Tcell_write.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/6T_Cell_Write.png)

### 6T Cell Stability

#### **-> SNM Calculation**  
The stability and writability of the cell are quantified by the hold margin, read margin and write margin which are determined by the static noise margin (SNM). It determines how much noise can be applied at the inputs of the two cross coupled inverters before a stable state is lost during hold or read operaring mode or a second stable state is created during write operation. 

**1. Hold SNM**

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/HoldSNM.png)

```
$ ngspice holdsnm.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/HoldSNM.png)  
By fitting a square in the upper and lower loop, we get SNMh = 0.78V and SNMl = 0.67V respectively.  
Hold SNM = min (SNMh, SNMl) = 0.67V

**2. Read SNM**

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/Read_SNM.png)

```
$ ngspice readsnm.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/ReadSNM.png)  
Similarly,  
Read SNM = min (SNMh, SNMl) = 0.38V

**3. Write SNM**

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/Write%20SNM.png)

```
$ ngspice writesnm.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/WriteSNM.png)  
By fitting the smallest square between the two curves, we get  
Write SNM = 0.79V

#### **-> N-Curve**  

N-curve provides the current flow information along with the voltage metrics which is equally important for an overall analysis of cell stability.    

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/N_Curve.png)

```
$ ngspice ncurve.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/ncurve.png)
**Read Stability Metrics**    

**Static Voltage Noise Margin (SVNM)** - It is the maximum tolerable dc noise voltage at internal nodes of the bitcell before its content flips and it is measured as the difference between point C and point A.  
SVNM = 0.630 V

**Static Current Noise Margin (SINM)** - It is the maximum tolerable dc noise current injected at internal nodes of the bitcell before its content changes and it is denoted by point B.  
SINM = 272.92 uA

**Write Stability Metrics**

**Write Trip Voltage (WTV)** - It is the minimum voltage drop needed to change the internal nodes of the bitcell and it is measured as the difference between point E and point C.  
WTV = 0.946 V

**Write Trip Current (WTI)** - It is the minimum amount of current needed to write the bitcell and it denoted by point D.  
WTI = -29.17 uA

### 2. Sense Amplifier

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/Sense%20Amplifier.bmp)

Run the netlist file using the following command:

``` 
$ ngspice Sense_amplifier.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Sense_Amplifier.png)

### 3. Write Driver

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/Write%20Driver.bmp)

Run the netlist file using the following command:

```
$ ngspice driver.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Write_Driver.png)

### 4. Tristate Buffer

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/Tri-State%20Buffer.png)

Run the netlist file using the following command:

```
$ ngspice tri_state_buff_test.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Tristate_Buffer.png)

### 5. Positive Edge Triggered DFF

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/Circuit%20Diagrams/Dff.bmp)

Run the netlist file using the following command:

```
$ ngspice d_ff_pos_edge.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/dff.png)

### 1-Bit SRAM  
![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/1bitsram_arch.png)

**-> Read Operation**

```
$ ngspice 1_bit_cell_read.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/1-bit_cell_read.png)

**-> Write Operation**  
  
```
$ ngspice 1_bit_cell_write.sp
```

![](https://github.com/chandrashekhar1995/SRAM/blob/main/Diagrams/1-bit_cell_write.png)

# Acknowledgements 
* Yash Kumar, B.E. Electronics, Fr. Conceicao Rodrigues College of Engineering, Mumbai - laryash99@gmail.com
* Reuel Reuben, Undergraduate Student, BVPCOE,reuel992000@gmail.com
* Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd.
* Penumarthi Aishwarya,M.tech Embedded Systems, NIT Jamshedpur,aishwarya.penumarthi@gmail.com
* Philipp Gühring, Software Architect, LibreSilicon Assocation
* R. Timothy Edwards, Open Circuit Design


# Contact Information  
* Chandra Shekhar Srivastava, M.Tech Embedded System and VLSI,NSUT New Delhi, chandrashekhar.srivastava@gmail.com
* Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. - kunalghosh@gmail.com
* Philipp Gühring, Software Architect, LibreSilicon Assocation - pg@futureware.at

