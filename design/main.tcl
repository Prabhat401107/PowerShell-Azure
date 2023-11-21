set params $::quartus(args)
set output $::quartus(output)

set filename "template.v"
set new_filename "top.v"
	
set in  [open [file join $output $filename] r]
set out [open [file join $output $new_filename] w]

# line-by-line, read the original file
while {[gets $in line] != -1} {
	foreach param $params {
		set key_value [split $param :]
		set substring "parameter [lindex $key_value 0]" 
			
		if {[string first $substring $line] != -1} {
			regsub -all {\y[0-9]+\y} $line [lindex $key_value 1] line
		} 
	}
		
	# then write the transformed line
	puts $out $line
}

close $in
close $out

set project [file join $output "top.qpf"]
project_open $project
