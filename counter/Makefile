.PHONY: sim

sim:
	ghdl -a --std=08 counter.vhd
	ghdl -a --std=08 counter_tb.vhd
	ghdl -e --std=08 counter_tb
	ghdl -r --std=08 counter_tb --wave=wave.ghw

formal:
	sby --yosys "yosys -m ghdl" -f counter.sby
