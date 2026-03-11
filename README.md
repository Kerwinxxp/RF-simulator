# RF Propagation & Trajectory Studio

A MATLAB-based RF propagation toolkit for wireless coverage prediction, trajectory simulation, and dataset generation — with a polished integrated GUI.

**[Live Demo](https://kerwinxxp.github.io/coverage-simulator-web/)**

## Project Overview
This project provides an end-to-end RF propagation workflow for transmitter-receiver deployment experiments, coverage analysis, and trajectory-based signal simulation. The main application (`app.m`) bundles all functionality into a single App Designer interface.

## Core Capabilities
- **Scenario Setup**: Target region configuration with multiple propagation models (freespace, close-in, rain, gas, fog, longley-rice, raytracing)
- **Tx/Rx Site Management**: Add transmitter and receiver sites with custom frequency, power, height, and antenna properties
- **Coverage Visualization**: Plot coverage areas on interactive geographic maps with selectable base map styles
- **Directional Antenna**: URA beam pattern design with sinc/gaussian elements and tilt control
- **Trajectory Generation**: RRT-based path planning with random-angle, fixed-angle, and pairwise-target modes
- **Vehicle Kinematics**: Unicycle, bicycle, and differential-drive mobility models
- **Sequence Generation**: Transformer-based trajectory synthesis from seed node sequences
- **Dataset Generation**: Automated signal-map and heatmap dataset export with progress tracking

## Repository Structure
```
app.m                           # Main GUI application (run this)
trajectory.m                    # Trajectory class used by the app
app_codex.m                     # Legacy version (kept for reference)
static transimiter simulation/  # Static transmitter signal-map example
fix angle simulation/           # Fixed-orientation trajectory scripts
generateTrajectoryMaps/         # Trajectory signal-map generation scripts
```

## Installation
1. Install **MATLAB R2025** or later.
2. Open this repository folder in MATLAB.
3. Required toolboxes:
   - Antenna Toolbox
   - Communications Toolbox
   - Phased Array System Toolbox
   - Mapping Toolbox
   - Navigation Toolbox
   - Signal Processing Toolbox

## Run
```matlab
app
```
This launches the main GUI with all integrated features: coverage visualization, site management, trajectory generation, mobility analysis, antenna pattern design, and dataset generation.

### Additional script-based examples
The repository also includes standalone script flows for specific tasks.

#### Signal map generation
- `static transimiter simulation/static_trans.m`: Static-transmitter signal-map simulation.
- `static transimiter simulation/target_region_1.xlsx`: Example target-region input.

#### Fixed-orientation trajectory
- `fix angle simulation/fix_angle_trajectory.m`: Generates trajectories with orientation angles.
- `fix angle simulation/generate_fix_angle.m`: Applies fixed antenna orientation and exports signal maps.

#### Trajectory signal-map generation
- `generateTrajectoryMaps/generateTrajectoryMaps.m`: Main entry for trajectory signal maps.
- `generateTrajectoryMaps/trajectorySignalStrengthScript.m`: Signal-strength map export along trajectories.
- `generateTrajectoryMaps/region_matches_trajectory_test.m`: Region/trajectory matching utility.
