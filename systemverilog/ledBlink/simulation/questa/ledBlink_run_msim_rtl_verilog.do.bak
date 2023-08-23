transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/ailr16/fpga-training/systemverilog/ledBlink {/home/ailr16/fpga-training/systemverilog/ledBlink/ledBlink.sv}

