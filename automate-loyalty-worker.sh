#!/bin/bash

# startup loyalty worker-api

cd loyalty-worker
cd app
source ./env/bin/activate
sleep 2
pip3 install -r requirements.txt
sleep 3
python3 run.py


