# Recreate project from exported script
if { [file exists project/scripts/create_project.tcl] } {
  source project/scripts/create_project.tcl
} else {
  puts "ERROR: project/scripts/create_project.tcl not found."
  exit 1
}

# Optional: regenerate BD wrapper if BD exists
if { [file exists project/bd/system_bd.tcl] } {
  source project/bd/system_bd.tcl
  catch { make_wrapper -files [get_files *system_bd.bd] -top }
}

update_compile_order -fileset sources_1
launch_runs synth_1 -to_step write_bitstream
wait_on_run impl_1
