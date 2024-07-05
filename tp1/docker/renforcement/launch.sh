#!/bin/bash
PORT=8900
DATA_DIR=$HOME
echo $DATA_DIR
docker run --rm  -p $PORT:8888 -v $DATA_DIR:/home/rl/notebooks rl/rl