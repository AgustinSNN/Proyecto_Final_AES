onerror {quit -f}
vlib work
vlog -work work desencriptador.vo
vlog -work work desencriptador.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.main_inv_AES_vlg_vec_tst
vcd file -direction desencriptador.msim.vcd
vcd add -internal main_inv_AES_vlg_vec_tst/*
vcd add -internal main_inv_AES_vlg_vec_tst/i1/*
add wave /*
run -all
