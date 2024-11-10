# 1st argument is name of cell to extract (expected to resolve to $project.mag):
set project [lindex $argv $argc-1]
load $project.mag
flatten MYFLAT
load MYFLAT
select top cell
cellname delete $project
cellname rename MYFLAT ${project}_parax
extract all
ext2sim labels on
ext2sim
extresist tolerance 10
# extresist # Commented out because it seems to be crashing.
ext2spice lvs
ext2spice cthresh 0
ext2spice extresist on
ext2spice -o $project.sim.spice
quit -noprompt
# Output should be $project.sim.spice

