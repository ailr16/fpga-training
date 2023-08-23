transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/ailr16/fpga-training/verilog/clockdivider {/home/ailr16/fpga-training/verilog/clockdivider/clockdivider.v}

vlog -vlog01compat -work work +incdir+/home/ailr16/fpga-training/verilog/clockdivider {/home/ailr16/fpga-training/verilog/clockdivider/clockdivider_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  clockdivider_tb

add wave *
view structure
view signals
run -all
