onerror {quit -f}
vlib work
vlog -work work mapa_logistico.vo
vlog -work work mapa_logistico.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mapa_logistico_vlg_vec_tst
vcd file -direction mapa_logistico.msim.vcd
vcd add -internal mapa_logistico_vlg_vec_tst/*
vcd add -internal mapa_logistico_vlg_vec_tst/i1/*
add wave /*
run -all
