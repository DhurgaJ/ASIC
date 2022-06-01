## ASIC
Prerequisite installation for Openlane and CARAVEL

####install git:
$ sudo apt update
$ sudo apt install git-all

####install python
$ apt install -y build-essential python3 python3-venv python3-pip

#### Docker Installation Instructions 
 $ sudo apt-get update

 $ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
	
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
$ sudo apt-get update

$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#### To verify Docker Installation

$ sudo docker run hello-world
#############################################################################

#### Create a directory and call it anything you want

$ sudo -i 

$ mkdir -p caravel_tutorial

#### navigate into the directory

$ cd caravel_tutorial

$ git clone -b mpw-6b https://github.com/efabless/caravel_user_project caravel_walkthrough

$ cd caravel_walkthrough

$ export OPENLANE_ROOT=~/caravel_tutorial/openlane # you need to export this whenever you start a new shell

$ export PDK_ROOT=~/caravel_tutorial/pdk # you need to export this whenever you start a new shell

$ make setup

############################################################################

#### To check whether the installation works fine

$ make user_proj_example

###############################################################################
#### install klayout
https://www.klayout.de/build.html

(download the setup file for Ubuntu 20 and run the setup file similar to installations carried out in Windows OS)
#### View .gds extension file in the directory named final, using klayout

$ cd ~/caravel_tutprial/caravel_walkthrough/openlane/user_proj_example/runs/user_proj_example/results/final/gds
klayout user_proj_example.gds

################################################################################

Document link for Caravel, openlane flow and sky130A 

https://efabless.com/open_shuttle_program

https://github.com/The-OpenROAD-Project/OpenLane/blob/master/docs/source/hardening_macros.md

https://github.com/The-OpenROAD-Project/OpenLane#installation-notes

https://github.com/efabless/caravel

https://skywater-pdk.readthedocs.io/en/main/rules/assumptions.html#process-stack-diagram

##############################################################################
#### To add and execute your own design file

A) Create your own design folder with name same as the name given in top level module

i. Say if toplevel module is named as counter_16bit.v, create folder named counter_16bit under ~/caravel_tutorial/caravel_walkthrough/openlane

ii. Copy files config.json, config.tcl, pin_order.cfg from ~/caravel_tutorial/caravel_walkthrough/openlane/user_proj_example 
to directory

~/caravel_tutorial/caravel_walkthrough/openlane/counter_16bit/

iii. Modify "DESIGN_NAME" , "VERILOG_FILES" of config.json file (contents of the file is given below)

    "PDK"                      : "sky130A",
    "STD_CELL_LIBRARY"         : "sky130_fd_sc_hd",
    "CARAVEL_ROOT"             : "../../caravel",
    "CLOCK_NET"                : "counter.clk",
    "CLOCK_PERIOD"             : "10",
    "CLOCK_PORT"               : "wb_clk_i",
    "DESIGN_IS_CORE"           : "0",
    "DESIGN_NAME"              : "user_proj_example",
    "DIE_AREA"                 : "0 0 900 600",
    "DIODE_INSERTION_STRATEGY" : "4",
    "FP_PIN_ORDER_CFG"         : "pin_order.cfg",
    "FP_SIZING"                : "absolute",
    "GLB_RT_MAXLAYER"          : "5",
    "GND_NETS"                 : "vssd1",
    "PL_BASIC_PLACEMENT"       : "1",
    "PL_TARGET_DENSITY"        : "0.05",
    "RUN_CVC"                  : "1",
    "VDD_NETS"                 : "vccd1",
    "VERILOG_FILES"            : ["../../caravel/verilog/rtl/defines.v", ** **"../../verilog/rtl/user_proj_example.v"]





iv. Modify script_dir,CLOCK_PORT,CLOCK_NET contents in the below lines of config.tcl 

 set ::env(DESIGN_NAME) user_proj_example
 set ::env(VERILOG_FILES) "\
   $::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
   $script_dir/../../verilog/rtl/user_proj_example.v"
 set ::env(DESIGN_IS_CORE) 0
 set ::env(CLOCK_PORT) "wb_clk_i"
 set ::env(CLOCK_NET) "counter.clk"

B. Modify contents of the files under the folder rtl, includes in the path

~/caravel_tutorial/caravel_walkthrough/verilog as described below

i. Create your own design file say counter_16bit.v in the folder
~/caravel_tutorial/caravel_walkthrough/verilog/rtl

ii. Lines highlighted are to be added in the verilog file

An example code is given below , the highlighted lines are to be retained


`default_nettype none
module counter_16bit #(
       parameter BITS =32
) (
`ifdef USE_POWER_PINS
   inout vccd1,
   inout vssd1,
 `endif
    input clk, 
    input reset,
    output [3:0] count,
    output [3:0] io_oeb
  );
    wire clk;
    wire reset;

    reg [3:0] count;
    reg [3:0] io_oeb;

    assign io_oeb = 4'b0000;

    always @(negedge clk or posedge reset )
         if (reset) 
              count <= 4'b0000;
         else
               count <= count + 1'b1;
endmodule // counter 

iii. Edit include.rtl.caravel_user_project file under
~/caravel_tutorial/caravel_walkthrough/verilog/includes
Highlighted contents to be edited

#### Caravel user project includes

-v $(USER_PROJECT_VERILOG)/rtl/user_project_wrapper.v	     
-v $(USER_PROJECT_VERILOG)/rtl/counter_16bit.v

iv create your own design file under gl folder say named counter_16bit.v 
~/caravel_tutorial/caravel_walkthrough/verilog/gl

Copy the contents from user_proj_example to counter_16bit.v and edit the lines as per your port requirements
first few edited lines of counter_16bit.v are shown below

module counter_16bit (clk,
    reset,
    vccd1,
    vssd1,
    count,
    io_oeb);
 input clk;
 input reset;
 input vccd1;
 input vssd1;
 output [3:0] count;
 output [3:0] io_oeb;

 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _06_;
 wire _08_;
 wire _10_;
 wire _12_;


C. To execute design flow 

$ cd ~/caravel_tutorial/caravel_walkthrough

$ export OPENLANE_ROOT=~/caravel_tutorial/openlane # you need to export this whenever you start a new shell

$ export PDK_ROOT=~/caravel_tutorial/pdk # you need to export this whenever you start a new shell
 
$ make counter_16bit.v

D. Similarly modify user_project_wrapper folder in ~/caravel_tutorial/caravel_walkthrough/openlane and in ~/caravel_tutorial/caravel_walkthrough/verilog/rtl

 In ~/caravel_tutorial/caravel_walkthrough/openlane/user_project_wrapper
 edit mprj coordinate location for your macro
