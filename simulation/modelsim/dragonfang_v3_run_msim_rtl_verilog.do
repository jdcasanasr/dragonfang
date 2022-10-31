transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages {C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/riscv_v_pkg.sv}
vlog -sv -work work +incdir+C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages {C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/packages/dragonfang_pkg.sv}
vlog -sv -work work +incdir+C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/functional_units/integer {C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/src/functional_units/integer/vector_extension_unit.sv}

vlog -sv -work work +incdir+C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/sim/testbenches {C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/sim/testbenches/vector_extension_unit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  vector_extension_unit_tb

do C:/Users/jdani/OneDrive/Documents/Thesis/dragonfang_v3/sim/do_files/vector_extension_unit
