
---

# 📡 Wireless Coverage Simulator

A **MATLAB-based ray-tracing toolkit** for wireless coverage prediction, trajectory simulation, and dataset generation.

This project provides an **end-to-end RF propagation simulation workflow**, enabling experiments on transmitter–receiver deployment, coverage quality evaluation, and trajectory-based signal analysis.

---

# 📖 Project Overview

The simulator supports **full-scene wireless propagation analysis**, from geographic map initialization to signal heatmap export.

It is designed for:

* RF propagation experiments
* Coverage planning and analysis
* Mobility-based signal simulations
* Dataset generation for wireless research and machine learning

The framework integrates **map visualization, antenna modeling, trajectory simulation, and ray-tracing coverage computation** into a single MATLAB workflow.

---

# ⚙️ Core Capabilities

### 🗺 Scene & Map Visualization

* Unified basemap canvas
* Target region framing
* 3D environment context

### 📡 Directional Antenna Control

* Antenna tilt adjustment
* Orientation visualization
* Directional pattern control

### 📍 Tx/Rx Site Deployment

* Visual display of transmitter and receiver sites
* Multiple deployment options (manual, file import, grid/random)

### 🚶 Trajectory & Mobility Simulation

* Synthetic trajectory generation
* Mobility experiment support
* Animated trajectory preview

### 🌡 Ray-Tracing Coverage Maps

* High-resolution signal strength heatmaps
* Custom target-region coverage computation

### 🎬 Trajectory Signal Simulation

* Signal strength evaluation along movement paths
* Step-by-step trajectory signal-map generation

---

# 🔄 Simulation Workflow

The typical simulation process consists of four main stages:

### 1️⃣ Define Region

* Set **NW / NE / SW boundaries**
* Load basemap (`.osm`)
* Initialize the simulation scene

### 2️⃣ Deploy Sites

Add transmitter/receiver locations using:

* Manual placement
* File import
* Random or grid-based deployment

### 3️⃣ Run Simulations

Execute simulation modules including:

* Antenna directivity visualization
* Coverage heatmap generation
* Trajectory simulation
* Signal analysis along paths

### 4️⃣ Export Results

Export simulation outputs such as:

* Site configuration files
* Trajectory datasets
* Region-level signal maps

---

# 📂 Repository Structure

The repository contains selected resources for wireless simulation experiments.

```
project/
│
├── static transmitter simulation/
│   ├── static_trans.m
│   └── target_region_1.xlsx
│
├── fix angle simulation/
│   ├── fix_angle_trajectory.m
│   └── generate_fix_angle.m
│
├── generateTrajectoryMaps/
│   ├── generateTrajectoryMaps.m
│   ├── trajectorySignalStrengthScript.m
│   └── region_matches_trajectory_test.m
│
├── data/
│   ├── region maps (.osm)
│   ├── trajectory files (.csv)
│   └── signal datasets (.mat)
│
└── documentation/
    ├── project documentation (.pdf)
    └── additional notes (.docx)
```

Included asset types:

* MATLAB scripts (`.m`)
* MATLAB App Designer file (`.mlapp`)
* Map files (`.osm`)
* Signal / trajectory data (`.csv`, `.mat`)
* Documentation (`.pdf`, `.docx`)

---

# 🧩 Installation

### Requirements

* **MATLAB R2025** (or MATLAB 2025 release)
* Required MATLAB **RF / ray-tracing related toolboxes**

### Setup

1. Install MATLAB.
2. Clone or download this repository.
3. Open the project folder in MATLAB.
4. Ensure required toolboxes are installed and enabled.

---

# 🚀 Running Simulations

## 1️⃣ Signal Map Generation (Static Transmitter)

Use the folder:

```
static transmitter simulation/
```

Main files:

* `static_trans.m`
  Main script for **static-transmitter signal-map simulation**

* `target_region_1.xlsx`
  Example **target-region configuration input**

---

## 2️⃣ Fixed-Orientation Trajectory Simulation

Use the folder:

```
fix angle simulation/
```

Scripts:

### `fix_angle_trajectory.m`

* Generates movement trajectories
* Exports files:

```
trajectory_*_targetAndAngles.csv
```

Each file contains:

* Target points
* Per-node antenna orientation angles

---

### `generate_fix_angle.m`

* Loads generated trajectories
* Applies **fixed antenna orientation along trajectories**
* Generates **per-step signal maps**

---

## 3️⃣ Trajectory Signal-Map Generation

Use the folder:

```
generateTrajectoryMaps/
```

Main components:

### `generateTrajectoryMaps.m`

Main entry script for **trajectory signal-map generation**

### `trajectorySignalStrengthScript.m`

Computes and exports **signal strength maps along trajectories**

### `region_matches_trajectory_test.m`

Utility script for **region–trajectory matching verification**

---

# 📊 Outputs

The simulator produces multiple types of datasets:

* 📡 **Coverage Heatmaps**
* 🗺 **Region-Level Signal Maps**
* 🚶 **Trajectory-Based Signal Measurements**
* 📁 **Exportable CSV/MAT datasets**

These outputs can be used for:

* Wireless coverage analysis
* Mobility-based RF experiments
* Machine learning dataset generation

---

