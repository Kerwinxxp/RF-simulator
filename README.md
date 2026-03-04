# Wireless Coverage Simulator

A MATLAB-based ray-tracing toolkit for wireless coverage prediction, trajectory simulation, and dataset generation.

## Project Overview
This project provides an end-to-end workflow for RF propagation analysis, from map/scene setup to signal-map export. It is designed for simulation-driven experiments on transmitter-receiver deployment, coverage quality, and trajectory-based signal behavior.

## Core Capabilities
- Scene & Map View: Unified basemap canvas with target-region framing and 3D context.
- Directional Pattern Control: Visualize and adjust antenna tilt, orientation, and directivity.
- Tx/Rx Site Visualization: Display transmitter sites, receiver sites, and propagation views.
- Path & Motion Simulation: Generate synthetic trajectories for mobility experiments.
- Ray-Tracing Coverage Maps: Produce high-resolution heatmaps for custom regions.
- Trajectory Simulation Preview: Animated simulation for path-based scenarios.

## Workflow
1. Define Region: Set NW/NE/SW bounds, basemap, and initialize scene.
2. Deploy Sites: Add Tx/Rx manually, via file upload, or randomized/grid placement.
3. Simulate: Run directivity, heatmap, trajectory, and signal-along-path simulations.
4. Export: Save site files, trajectory files, and region-level signal-map datasets.

## Included Assets in This Repository
This repository currently includes selected simulation resources, such as:
- MATLAB scripts (`.m`) and app file (`.mlapp`)
- Region/map files (`.osm`)
- Signal and trajectory data files (`.csv`, `.mat`)
- Project documentation (`.pdf`, `.docx`)

## Installation
1. Install MATLAB 2025 (or MATLAB R2025 release).
2. Open this project folder in MATLAB.
3. Ensure required toolboxes for RF/ray-tracing workflows are available in your MATLAB installation.

## Run
### Signal map generation
Run the script:
- `test_script.m`

This file contains a complete example for generating a signal map over one region.

### Fixed-orientation trajectory example
Use the following scripts for trajectory simulation with fixed orientation angles:
- `fix_angle_trajectory.m`: Generates trajectories and writes `trajectory_*_targetAndAngles.csv` files (target point + per-node orientation angles).
- `generate_fix_angle.m`: Loads generated trajectories and target-angle files, applies fixed antenna orientation along the trajectory, and exports per-step signal maps.
