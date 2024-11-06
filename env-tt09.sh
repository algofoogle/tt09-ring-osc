#!/bin/bash

if [ ! -d ./tt ]; then
    echo "ABORTING as ./tt/ does not exist yet."
    echo "See the tt-support-tools step of: https://tinytapeout.com/guides/local-hardening/"
    echo "Typically, you'd run: git clone -b tt09 https://github.com/TinyTapeout/tt-support-tools tt"
    return 1
fi

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "WARNING: It looks like you ran $0 directly."
    echo "NORMALLY you should instead run: source $0"
    echo "MAYBE you want to give that another try?"
fi

export TTPYTHON=python3.11
export TTPROMPT=tt09
export TTTOOLS=/home/anton/ttsetup@tt09
mkdir -p "$TTTOOLS/pdk"

# From https://github.com/TinyTapeout/tt-gds-action/blob/ac4c7934481e7c5fb9afa202a72a14025e78e13f/action.yml#L53-L57
export FLOW=openlane2
export FLOW_ARG=--openlane2
export OPENLANE2_TAG=2.1.9
export PDK_ROOT=$TTTOOLS/pdk
export PDK=sky130A

# Mangling of https://github.com/TinyTapeout/tt-gds-action/blob/ac4c7934481e7c5fb9afa202a72a14025e78e13f/action.yml#L122
export LINTER_LOG_BASE="runs/wokwi/*-verilator-lint/verilator-lint.log"

export VENV_DIR="$TTTOOLS/venv"
export VENV_CMD="$VENV_DIR/bin/activate"
if [ ! -e "$VENV_CMD" ]; then
    echo "NOTE: Venv $VENV_CMD doesn't exist; creating it..."
    $TTPYTHON -m venv --prompt "$TTPROMPT" "$VENV_DIR"
    echo "DONE."
fi
echo "Activating VENV..."
source "$VENV_CMD"
echo "NOTE: If prompt doesn't include '($TTPROMPT)' then make sure you run this script via 'source'"
