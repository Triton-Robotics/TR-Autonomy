#!/bin/bash

# nsys profile --trace=cuda,nvtx -o combined_profile --wait primary --force-overwrite true ./run-nsight-cv.sh


# Function to handle script termination
cleanup() {
    echo "Stopping processes..."
    kill $PID1 $PID2
    exit
}

# Trap Ctrl+C (SIGINT) and call cleanup function
trap cleanup INT

ros2 run tr-camera-basler tr-camera-basler &
PID1=$!

ros2 launch yolox_ros_cpp yolox_tensorrt.launch.py &
PID2=$!

echo "Processes running ($PID1, $PID2). Press Ctrl+C to stop."

# Wait for background processes
wait
