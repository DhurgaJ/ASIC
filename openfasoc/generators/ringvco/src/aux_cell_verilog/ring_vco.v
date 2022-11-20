module ring_vco (
  output wire osc,
  input wire vgnd,
  input wire vbp,
  input wire vinit,
  input wire vdd
);

wire net6  ;
wire net7  ;
wire net8  ;
wire vout  ;
wire net1  ;
wire net2  ;
wire net3  ;
wire vd  ;
wire net4  ;
wire net5  ;
wire vin  ;

delay_singlestage
Xinv1 ( 
 .vin( net6 ),
 .vout( net1 ),
 .vd( vd ),
 .vgnd( net8 )
);


delay_singlestage
Xinv2 ( 
 .vin( net1 ),
 .vout( vin ),
 .vd( vd ),
 .vgnd( net8 )
);


delay_singlestage
Xinv3 ( 
 .vin( vin ),
 .vout( vout ),
 .vd( vd ),
 .vgnd( net8 )
);


delay_singlestage
Xinv4 ( 
 .vin( vout ),
 .vout( net2 ),
 .vd( vd ),
 .vgnd( net8 )
);


delay_singlestage
Xinv5 ( 
 .vin( net2 ),
 .vout( net3 ),
 .vd( vd ),
 .vgnd( net8 )
);


delay_singlestage
Xinv6 ( 
 .vin( net3 ),
 .vout( net7 ),
 .vd( vd ),
 .vgnd( net8 )
);


pfet_01v8_lvt
#(
.L ( cl ) ,
.W ( cw ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8_lvt ) ,
.spiceprefix ( X )
)
M13 ( 
 .D( vd ),
 .G( vbp ),
 .S( vdd ),
 .B( vdd )
);


pfet_01v8_lvt
#(
.L ( 1 ) ,
.W ( 5 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8_lvt ) ,
.spiceprefix ( X )
)
M14 ( 
 .D( vd ),
 .G( vinit ),
 .S( vdd ),
 .B( vdd )
);


delay_singlestage
Xinv7 ( 
 .vin( net7 ),
 .vout( net4 ),
 .vd( vd ),
 .vgnd( net8 )
);


delay_singlestage
Xinv8 ( 
 .vin( net4 ),
 .vout( net5 ),
 .vd( vd ),
 .vgnd( net8 )
);


delay_singlestage
Xinv9 ( 
 .vin( net5 ),
 .vout( net6 ),
 .vd( vd ),
 .vgnd( net8 )
);


cap_mim_m3_1
#(
.model ( cap_mim_m3_1 ) ,
.W ( 1 ) ,
.L ( 1 ) ,
.MF ( 1 ) ,
.spiceprefix ( X )
)
C1 ( 
 .c0( vd ),
 .c1( net8 )
);


*.lib ~/open_pdks/sky130/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.param mc_mm_switch=0
.param mc_pr_switch=0

.include ~/open_pdks/sky130/sky130A/libs.tech/ngspice/corners/tt/nonfet.spice


*model
.include ~/open_pdks/sky130/sky130A/libs.tech/ngspice/all.spice

*mosfet
.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_01v8__tt.corner.spice
.inclued ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__nfet_01v8__tt.corner.spice

*mismatch parameters
.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_01v8__mismatch.corner.spice
.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__nfet_01v8__mismatch.corner.spice
.MODEL swmod SW(VT=0.9 VH=0.01 RON=1 ROFF=10000000000)


.tran 1ns 600us
.save vcntl clkdiv2 clkdiv4q


.lib /home/dhurga/open_pdks/sky130/sky130A/libs.tech/ngspice/sky130.lib.spice ff
*.lib ~/open_pdks/sky130/sky130A/libs.tech/ngspice/sky130.lib.spice ss
.param mc_mm_switch=0
.param mc_pr_switch=0

 

.include ~/open_pdks/sky130/sky130A/libs.tech/ngspice/corners/tt/nonfet.spice

 


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

 

*mismatch parameters
*.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_01v8__mismatch.corner.spice
*.include ~/open_pdks/sky130/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__nfet_01v8__mismatch.corner.spice




.param cl=1 m1=1
.param cw=1
.param cw1=0.55 cl1=4
.param cw2=7 cl2=8 m2=1
.param cw3=1 cl3=1 m3=1
.temp 80
.control
let i=0
save vco
tran 1n 200u
plot vco
while i<3
run
meas tran te trig v(vco) val=0.9 rise=109+i targ v(vco) val=0.9 rise=110+i
*measures the time difference between v(1) reaching 0.5 V for the first time on its first rising
*slope (TRIG) versus reaching 0.5 V again on its second rising slope (TARG). I.e. it measures
*the signal period.
let i=i+1
end
print te

.endc 
endmodule

// expanding   symbol:  /home/dhurga/delay_singlestage.sym # of pins=4
// sym_path: /home/dhurga/delay_singlestage.sym
// sch_path: /home/dhurga/delay_singlestage.sch
module delay_singlestage (
  input wire vin,
  output wire vout,
  input wire vd,
  input wire vgnd
);

wire net1  ;
wire net2  ;
wire net3  ;
wire net4  ;


pfet_01v8_lvt
#(
.L ( cl1 ) ,
.W ( cw1 ) ,
.nf ( 1 ) ,
.mult ( m1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8_lvt ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( vout ),
 .G( net4 ),
 .S( net1 ),
 .B( net1 )
);


nfet_01v8_lvt
#(
.L ( cl2 ) ,
.W ( cw2 ) ,
.nf ( 1 ) ,
.mult ( m2 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8_lvt ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( vout ),
 .G( net4 ),
 .S( net2 ),
 .B( net3 )
);


nfet_01v8_lvt
#(
.L ( cl3 ) ,
.W ( cw3 ) ,
.nf ( 1 ) ,
.mult ( m3 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet3_01v8_lvt ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( net2 ),
 .G( net4 ),
 .S( net3 ),
 .B( net3 )
);

endmodule
