onerror {quit -f}
vlib work
vlog -work work key_expanse.vo
vlog -work work key_expanse.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.key_expansion_vlg_vec_tst
vcd file -direction key_expanse.msim.vcd
vcd add -internal key_expansion_vlg_vec_tst/*
vcd add -internal key_expansion_vlg_vec_tst/i1/*
add wave /*
run -all
