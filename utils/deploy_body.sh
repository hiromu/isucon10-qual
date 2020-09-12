#!/bin/bash
set -ex

echo "Deploying on $(hostname)"
# TODO
cd /home/isucon/isuumo/webapp/go
make
echo "Finished on $(hostname)"

