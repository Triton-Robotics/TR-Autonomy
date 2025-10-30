# TR-Autonomy-2025

Parent repository for Triton Robotics Autonomy team. It contains the setup files to run on Jetson boot (when connected to the robot), and contains the submodules of all the necessary child nodes.

This repository should only include final, runnable code that follows coding conventions in [Styles.md](./Styles.md) and works on our Jetson.

| Table of Contents|
|---------------------------|
| [Building](#Building)|
| [Running](#Running)|
| [Systemd, launch nodes on boot](.md/systemd.md)|
| [Serial terminal over usb-c port](.md/serial_terminal.md)|
| [Bringing up a new Jetson](.md/jetson_setup.md)|
| [Code style guide](.md/Styles.md)|

## Launching

To prevent the overhead of making multiple terminals, we have setup launch files such as [sim_aiming_launch.bash](./launch/sim_aiming_launch.bash) to more easily run multiple terminals. To run a launch file, all you have to do is navigate into the launch directory, add permissions to run the script (do this for all scripts you plan to run), and then run it.

```
cd ./launch
chmod u+x ./sim_aiming_launch.bash
./sim_aiming_launch.bash
```

## Linting, Type Hints, Autocomplete

1. install the `Robotics Developer Environment` extension on vscode
![alt text](.md/ros2_vscode_extension.png)

2. open the command pallet (ctrl + shift + p)

3. run `ROS2: Update Python Path`

4. run `ROS2: Update C++ Properties`

## Python virtual environment  

### Overview

Instead of having to install python dependencies into your system python, potentially leading to conflicts, we can use a python virtual environment

### Setup

```bash
apt install python3.10-venv

python3 -m venv .venv

source .venv/bin/activate

pip install -r requirements.txt
```

### Development cycle

1. Source ros

```bash
source /opt/ros/humble/setup.bash
```

2. Activate the virtual python environment  

```bash
source .venv/bin/activate
```

You should see a `(.venv)` in front of your prompt

3. Source the workspace

```bash
source install/setup.bash
```

4. Run your node/launch file

5. You can exit the venv using

```bash
deactivate
```

### Configuring python ros packages to use the venv

You must add the following to the `setup.cfg` file for all python packages in your workspace

```
[build_scripts]
executable=/usr/bin/env python3
```
