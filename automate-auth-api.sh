#!/bin/bash

# startup auth-api

cd auth-api
cd app
source ./env/bin/activate
pip3 install -r requirements.txt
sleep 3
export HTTP_PORT=5000
export JWT_SECRET=supersecret
sleep 3
python3 run.py


