v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 40 -70 40 30 { lab=y}
N 40 30 170 30 { lab=y}
N 40 -180 40 -130 { lab=#net1}
N 50 90 170 90 { lab=#net2}
N -60 60 10 60 { lab=#net3}
N -60 -100 -60 60 { lab=#net3}
N -60 -100 -0 -100 { lab=#net3}
N -160 -210 0 -210 { lab=#net4}
N -160 -210 -160 130 { lab=#net4}
N -160 130 120 130 { lab=#net4}
N 120 60 120 130 { lab=#net4}
N 120 60 130 60 { lab=#net4}
N 40 -280 40 -240 { lab=#net5}
N 170 90 170 150 { lab=#net2}
N 50 60 80 60 { lab=#net2}
N 80 60 80 90 { lab=#net2}
N 170 60 210 60 { lab=#net2}
N 210 60 210 100 { lab=#net2}
N 170 100 210 100 { lab=#net2}
N -320 -20 -320 -10 { lab=#net4}
N -110 30 -110 40 { lab=#net3}
N 200 -280 200 -270 { lab=#net5}
N 110 210 110 220 { lab=#net2}
N -320 -20 -160 -20 { lab=#net4}
N -110 30 -60 30 { lab=#net3}
N 110 140 110 210 { lab=#net2}
N 110 140 170 140 { lab=#net2}
N 40 -280 200 -280 { lab=#net5}
C {xschem_sky130/sky130_fd_pr/nfet_01v8.sym} 30 60 0 0 {name=M1
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {xschem_sky130/sky130_fd_pr/nfet_01v8.sym} 150 60 0 0 {name=M2
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {xschem_sky130/sky130_fd_pr/pfet3_01v8.sym} 20 -210 0 0 {name=M3
L=0.15
W=0.8
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} -50 -20 0 0 {name=p1 lab=A}
C {xschem_sky130/sky130_fd_pr/pfet3_01v8.sym} 20 -100 0 0 {name=M4
L=0.15
W=0.8
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} -150 -40 0 0 {name=p2 lab=B}
C {iopin.sym} 30 -280 0 0 {name=p3 lab=vdd}
C {opin.sym} 40 -30 0 0 {name=p5 lab=y}
C {iopin.sym} 160 150 0 0 {name=p6 lab=GND}
C {code.sym} 400 -230 0 0 {name=s2 only_toplevel=true value="

.lib /home/dhurga/open_pdks/sky130/sky130A/libs.tech/ngspice/sky130.lib.spice tt
#.include "/home/dhurga/skywater-pdk/libraries/sky130_fd_pr/latest/models/sky130_fd_pr__model__inductors.model.spice"
*.lib ~/open_pdks/sky130/sky130A/libs.tech/ngspice/sky130.lib.spice hh
* Resistor/Capacitor
*.include "/home/dhurga/open_pdks/sky130/sky130A/libs.tech/ngspice/r+c/res_high__cap_high.spice"
*.include "/home/dhurga/open_pdks/sky130/sky130A/libs.tech/ngspice/r+c/res_high__cap_high__lin.spice"
*.include "/home/dhurga/open_pdks/sky130/sky130A/libs.tech/ngspice/corners/ff/specialized_cells.spice"


*.include ~/open_pdks/sky130/sky130A/libs.tech/ngspice/corners/tt/nonfet.spice/wb_flat.spice"

*/home/dhurga/temperature_sensor_priorupload/postlayout_simulations/Wien_Bridge
*.include "/home/dhurga/temperature_sensor_priorupload/postlayout_simulations/Wien_Bridge/wb_flat.spice"
*.include "/home/dhurga/temperature_sensor_priorupload/postlayout_simulations/cb_chopper/buff_final_flat.spice"
*.include "/home/dhurga/temperature_sensor_priorupload/postlayout_simulations/Switched_capacitor/switchcap_flat.spice"

*model
*.include ~/open_pdks/sky130/sky130A/libs.tech/ngspice/all.spice

 

*mosfet
*.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_01v8_lvt__tt.corner.spice
*.inclued ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__nfet_01v8_lvt__tt.corner.spice

 

*mismatch parameters
*.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_01v8_lvt__mismatch.corner.spice
*.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__nfet_01v8_lvt__mismatch.corner.spice



*mosfet
*.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_01v8__tt.corner.spice
*.inclued ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__nfet_01v8__tt.corner.spice



.MODEL swmod SW(VT=0.9 VH=0.01 RON=1 ROFF=1000k)
"}
C {code_shown.sym} 350 -60 0 0 {name=s1 only_toplevel=false value="
#.include "/home/dhurga/skywater-pdk/libraries/sky130_fd_pr/latest/models/sky130_fd_pr__model__inductors.model.spice"
.option trtol=1
.option chgtol=1e-16
.save 
 

.control

run


.endc
"
}
C {vsource.sym} -320 20 0 0 {name=V1 value=1.8}
C {gnd.sym} -320 50 0 0 {name=l2 lab=GND}
C {vsource.sym} -110 70 0 0 {name=V2 value=1.8}
C {gnd.sym} -110 100 0 0 {name=l1 lab=GND}
C {vsource.sym} 200 -240 0 0 {name=V4 value=1.8}
C {gnd.sym} 200 -210 0 0 {name=l4 lab=GND}
C {vsource.sym} 110 250 0 0 {name=V5 value=0}
C {gnd.sym} 110 280 0 0 {name=l5 lab=GND}
