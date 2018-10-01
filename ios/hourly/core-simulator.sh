#!/usr/bin/env bash

trap 'gem install run_loop' ERR

set -e

gem uninstall -Vax --force --no-abort-on-dependent run_loop
rm -rf run_loop
git clone git@github.com:calabash/run_loop.git
(cd run_loop; rake install)

exec DEBUG=1 run-loop simctl manage-processes
