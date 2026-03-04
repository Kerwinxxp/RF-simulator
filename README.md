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

## Web UI Reference
The GitHub introduction content is synchronized with the web presentation located at:
- `C:\Users\phdwf\coverage-simulator-web\index.html`
