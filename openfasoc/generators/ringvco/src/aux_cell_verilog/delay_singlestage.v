module delay_singlestage (
  output wire vout,
  input wire vd,
  input wire vgnd,
  input wire vin
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
