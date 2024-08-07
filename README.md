# formal-experiments

This repo contains a VHDL counter module and a formal proof for it.

### Files

- `hdl/counter.vhd` - The counter, written in VHDL
- `formal/counter/counter.psl` - Assertions to prove the counter, written in PSL
- `formal/counter/counter.sby` - The SymbiYosys script
- `formal/counter/Makefile` - The Makefile to run SymbiYosys

### Usage

Inside `formal/counter/`, run `make`.

### Tools used

SymbiYosys, GHDL, and make. Follow [this guide](https://vhdlwhiz.com/formal-verification-in-vhdl-using-psl/) to install them. 
