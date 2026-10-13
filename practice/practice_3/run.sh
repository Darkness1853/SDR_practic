#!/bin/bash
PROJECT_ROOT=$(cd "$(dirname "$0")" && pwd)

export LD_LIBRARY_PATH=\
$PROJECT_ROOT/lib/SoapySDR/install/lib:\
$PROJECT_ROOT/lib/libiio/install/lib:\
$PROJECT_ROOT/lib/libad9361-iio/install/lib:\
$LD_LIBRARY_PATH

export SOAPY_SDR_PLUGIN_PATH=\
$PROJECT_ROOT/lib/SoapyPlutoSDR/install/lib/SoapySDR/modules0.8

sudo env \
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH" \
    SOAPY_SDR_PLUGIN_PATH="$SOAPY_SDR_PLUGIN_PATH" \
    "$PROJECT_ROOT/build/main"