# Wireless Coverage Simulator

A MATLAB-based ray-tracing toolkit for wireless coverage prediction, trajectory simulation, and dataset generation.

## Project Overview
This project provides an end-to-end RF propagation workflow for transmitter-receiver deployment experiments, coverage analysis, and trajectory-based signal simulation.

## Core Capabilities
- Scene and map visualization for target regions
- Directional antenna control and orientation setup
- Tx/Rx site deployment and propagation visualization
- Trajectory and mobility simulation
- Ray-tracing signal-map generation

## Repository Structure
- `static transimiter simulation/`: static transmitter signal-map example
- `fix angle simulation/`: fixed-orientation trajectory simulation scripts
- `generateTrajectoryMaps/`: trajectory signal-map generation scripts
- Data and docs: `.osm`, `.csv`, `.mat`, `.xlsx`, `.pdf`, `.docx`

## Installation
1. Install MATLAB 2025 (R2025).
2. Open this repository folder in MATLAB.
3. Ensure RF/ray-tracing related toolboxes are installed.

## Run
For the latest version with all integrated UI features, run:
- `app_codex.m`: Main MATLAB app entry point. Use this file if you want access to the full workflow, including coverage visualization, site management, trajectory generation, mobility analysis, and dataset generation.

### Additional script-based examples
The repository also includes standalone script flows for specific tasks.

### Signal map generation
Use the `static transimiter simulation` folder for single-region signal-map generation:
- `static transimiter simulation/static_trans.m`: Main script for static-transmitter signal-map simulation.
- `static transimiter simulation/target_region_1.xlsx`: Example target-region input used by the script.

### Fixed-orientation trajectory example
Use the following scripts for trajectory simulation with fixed orientation angles:
- `fix angle simulation/fix_angle_trajectory.m`: Generates trajectories and writes `trajectory_*_targetAndAngles.csv` files (target point + per-node orientation angles).
- `fix angle simulation/generate_fix_angle.m`: Loads generated trajectories and target-angle files, applies fixed antenna orientation along the trajectory, and exports per-step signal maps.

### Trajectory signal-map generation
Use the `generateTrajectoryMaps` folder for trajectory-based signal-map generation:
- `generateTrajectoryMaps/generateTrajectoryMaps.m`: Main entry for generating trajectory signal maps.
- `generateTrajectoryMaps/trajectorySignalStrengthScript.m`: Computes and exports signal-strength maps along trajectories.
- `generateTrajectoryMaps/region_matches_trajectory_test.m`: Utility script for region/trajectory matching checks.
