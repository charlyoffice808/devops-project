#!/bin/bash

# startup transaction-api

cd transaction-api
cd app
source ./env/bin/activate
pip3 install -r requirements.txt
sleep 2
redis-cli ping
sleep 2
export HTTP_PORT=5050
export JWT_SECRET=supersecret
export REDIS_URL=redis://127.0.0.1:6379/0
sleep 2
python3 run.py


