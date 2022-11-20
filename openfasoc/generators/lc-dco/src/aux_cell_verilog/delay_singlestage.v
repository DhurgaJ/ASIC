// sch_path: /home/chandru/Tools/OpenFASOC/generators/lc-dco/xschem_rundir/diff_cross_mirror_verilog.sch
module delay_singlestage (
  output wire vd,
  output wire vout,
  output wire vgnd,
  input wire vin
);

wire net1  ;
wire net2  ;
wire net3  ;
wire GND  ;

nfet3_01v8_lvt
M1 (
 .D( net1 ),
 .G( vin ),
 .S( vgnd )
);


nfet3_01v8_lvt
M2 (
 .D( vout ),
 .G( vin ),
 .S( net1 )
);


pfet3_01v8_lvt
M3 (
 .D( vout ),
 .G( vin ),
 .S( vd )
);


endmodule
