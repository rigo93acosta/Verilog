# Verilog

Learning Verilog

## Testing tools

### Install
```bash
sudo apt install iverilog 
sudo apt install verilator
sudo apt install gtkwave
```s

### Use
``` bash
iverilog -o "name_Simulation" "source1.v" "source2.v"
vvp "name_Simulation"
gtkwave "name_Data.vcd"
```