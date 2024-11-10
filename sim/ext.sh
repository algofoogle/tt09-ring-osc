#!/usr/bin/bash

PROJECT_NAME=tt_um_algofoogle_tt09_ring_osc
SRC_MAG_FILE=../runs/wokwi/final/mag/$PROJECT_NAME.mag

# Refresh source .mag file (from TT09 OL2 harden) if it exists:
[ -f "$SRC_MAG_FILE" ] && cp "$SRC_MAG_FILE" .

# Run extraction from .mag file to .spice:
magic -noconsole -dnull tcl/extract_for_sim.tcl $PROJECT_NAME

