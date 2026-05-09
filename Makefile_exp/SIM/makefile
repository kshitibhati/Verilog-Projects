
#Makefile
RTL=../RTL/ram_16x8.v
TB=../TB/ram_tb.v
TOP_NAME=ram_tb

lib:
	vlib work
	
comp:
	vlog $(RTL) $(TB)
	
sim:
	vsim -novopt $(TOP_NAME)
	
cmd:
	vsim -novopt $(TOP_NAME) -c -do "run -all; exit"
	
TEST1:
	vsim -novopt $(TOP_NAME) -c -do "run -all; exit" +TEST1
	
run_all: lib comp sim
run_cmd: lib comp cmd



