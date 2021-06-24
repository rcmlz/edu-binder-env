#!/bin/bash
source $HOME/start

zef install Physics::Measure Physics::Unit Physics::Constants SVG::Plot::Pie Metropolis Telemetry Log::Async Test::Fuzz

rm -rf $HOME/.zef
