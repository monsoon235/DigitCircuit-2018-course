# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Users/rayomnd/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-5024-Monsoon-PC/incrSyn
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.cache/wt [current_project]
set_property parent.project_path D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5.xci
set_property used_in_implementation false [get_files -all d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.runs/c_counter_binary_5_synth_1 -new_name c_counter_binary_5 -ip [get_ips c_counter_binary_5]]

if { $cached_ip eq {} } {
close [open __synthesis_is_running__ w]

synth_design -top c_counter_binary_5 -part xc7a100tcsg324-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix c_counter_binary_5_ c_counter_binary_5.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_counter_binary_5_stub.v
 lappend ipCachedFiles c_counter_binary_5_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_counter_binary_5_stub.vhdl
 lappend ipCachedFiles c_counter_binary_5_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_counter_binary_5_sim_netlist.v
 lappend ipCachedFiles c_counter_binary_5_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_counter_binary_5_sim_netlist.vhdl
 lappend ipCachedFiles c_counter_binary_5_sim_netlist.vhdl
set TIME_taken [expr [clock seconds] - $TIME_start]

 config_ip_cache -add -dcp c_counter_binary_5.dcp -move_files $ipCachedFiles -use_project_ipc  -synth_runtime $TIME_taken  -ip [get_ips c_counter_binary_5]
}

rename_ref -prefix_all c_counter_binary_5_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef c_counter_binary_5.dcp
create_report "c_counter_binary_5_synth_1_synth_report_utilization_0" "report_utilization -file c_counter_binary_5_utilization_synth.rpt -pb c_counter_binary_5_utilization_synth.pb"

if { [catch {
  file copy -force D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.runs/c_counter_binary_5_synth_1/c_counter_binary_5.dcp d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.runs/c_counter_binary_5_synth_1/c_counter_binary_5.dcp d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.runs/c_counter_binary_5_synth_1/c_counter_binary_5_stub.v d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.runs/c_counter_binary_5_synth_1/c_counter_binary_5_stub.vhdl d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.runs/c_counter_binary_5_synth_1/c_counter_binary_5_sim_netlist.v d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.runs/c_counter_binary_5_synth_1/c_counter_binary_5_sim_netlist.vhdl d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.ip_user_files/ip/c_counter_binary_5]} {
  catch { 
    file copy -force d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_stub.v D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.ip_user_files/ip/c_counter_binary_5
  }
}

if {[file isdir D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.ip_user_files/ip/c_counter_binary_5]} {
  catch { 
    file copy -force d:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_stub.vhdl D:/Codes/Digital-circuit-course/lab9_3_1/lab9_3_1.ip_user_files/ip/c_counter_binary_5
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
