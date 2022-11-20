// LC DCO top PAR verilog


module lc_dco(vdd, vbp, vinit, vgnd, osc);
    output wire outp, outn;
    inout vdd, vbp, vinit, vgnd;

wire net1, net2, net3, net4, net5, net6, net7, net8, netvd	
// 1 element
	delay_singlestage delay_singlestage_inst1(
		.vd(netvd),
		.vout(net1),
		.vgnd(vgnd),
		.vin(net8)
		);
// 2 element
	delay_singlestage delay_singlestage_inst2(
		.vd(netvd),
		.vout(net2),
		.vgnd(vgnd),
		.vin(net1)
		);
//3 element
	delay_singlestage delay_singlestage_inst3(
		.vd(netvd),
		.vout(net3),
		.vgnd(vgnd),
		.vin(net2)
		);
//4 element
	delay_singlestage delay_singlestage_inst4(
		.vd(netvd),
		.vout(net4),
		.vgnd(vgnd),
		.vin(net3)
		);
//5 element
	delay_singlestage delay_singlestage_inst5(
		.vd(netvd),
		.vout(net5),
		.vgnd(vgnd),
		.vin(net4)
		);
//6 element
	delay_singlestage delay_singlestage_inst6(
		.vd(netvd),
		.vout(net6),
		.vgnd(vgnd),
		.vin(net5)
		);
//7 element
	delay_singlestage delay_singlestage_inst(
		.vd(netvd),
		.vout(net7),
		.vgnd(vgnd),
		.vin(net6)
		);		
//8 element	
	delay_singlestage delay_singlestage_inst(
		.vd(netvd),
		.vout(net8),
		.vgnd(vgnd),
		.vin(net7)
		);
//9 element
	delay_singlestage delay_singlestage_inst(
		.vd(netvd),
		.vout(net9),
		.vgnd(vgnd),
		.vin(net8)
		);
	pfet3_01v8_lvt
		M1 (
		.D( netvd ),
 		.G( vbp ),
 		.S( vdd )
 		);
 	pfet3_01v8_lvt
		M2 (
		.D( netvd ),
 		.G( vinit ),
 		.S( vdd )
 		);
 	cap_mim_m3_1
	#(
	.model ( cap_mim_m3_1 )
	)
	C1 (
	 .c0( netvd ),
 	 .c1( vgnd )
	);
	assign osc = net9;

);
endmodule

