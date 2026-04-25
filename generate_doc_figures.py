"""
Generate the four documentation figures for fix_angle_trajectory_doc.html
and generateTrajectoryMaps_doc.html using existing repository data.

Outputs:
  fix angle simulation/ex1_signal_heatmap.png
  fix angle simulation/ex2_traj_with_target.png
  generateTrajectoryMaps/ex1_transmitter_heatmap.png
  generateTrajectoryMaps/ex3_python_overlay.png
"""
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

ROOT = Path(r"C:\Users\phdwf\Downloads\RF-Propagation-xinpeng\RF-Propagation-tyler")
FIX  = ROOT / "fix angle simulation"
GTM  = ROOT / "generateTrajectoryMaps"

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
def load_signal_map(xlsx_path):
    """Load a signal-map xlsx; keep only valid dBm rows."""
    df = pd.read_excel(xlsx_path)
    pwr = df["Power"].astype(float)
    df = df.assign(Power=pwr.where(pwr < 0))
    return df.dropna(subset=["Power"])


# ---------------------------------------------------------------------------
# Figure 1 + 3 (shared): scatter heatmap of one signal map
# ---------------------------------------------------------------------------
def make_signal_heatmap(out_path, source_xlsx, title="Received Signal Strength (dBm)"):
    df = load_signal_map(source_xlsx)
    # Clip color range to 5th-95th percentile so the colormap shows useful contrast
    vmin, vmax = np.percentile(df["Power"], [5, 95])

    fig, ax = plt.subplots(figsize=(5.6, 4.4), dpi=140)
    sc = ax.scatter(df["Longitude"], df["Latitude"], c=df["Power"],
                    cmap="jet", s=8, marker="o", vmin=vmin, vmax=vmax,
                    edgecolors="none")
    cbar = fig.colorbar(sc, ax=ax, shrink=0.92, pad=0.02, extend="both")
    cbar.set_label("Power (dBm)", fontsize=10)
    cbar.ax.tick_params(labelsize=9)

    ax.set_xlabel("Longitude (°)", fontsize=10)
    ax.set_ylabel("Latitude (°)",  fontsize=10)
    ax.set_title(title, fontsize=11, pad=8)
    ax.tick_params(labelsize=9)
    ax.grid(alpha=0.25, linewidth=0.5)
    ax.set_aspect("auto")
    fig.tight_layout()
    fig.savefig(out_path, dpi=140, bbox_inches="tight", facecolor="white")
    plt.close(fig)
    print(f"[ok] {out_path}  ({len(df)} valid points)")


# ---------------------------------------------------------------------------
# Figure 2: trajectory + target dot (mimics geoplot output)
# ---------------------------------------------------------------------------
def make_trajectory_with_target(out_path):
    traj = pd.read_csv(ROOT / "trajectory1.csv", header=None)
    ang  = pd.read_csv(ROOT / "trajectory1_targetAndAngles.csv", header=None)

    target_lat = float(ang.iloc[0, 0])
    target_lon = float(ang.iloc[0, 1])
    bearings   = ang.iloc[0, 2:].astype(float).to_numpy()

    fig, ax = plt.subplots(figsize=(5.4, 4.6), dpi=140)
    # Trajectory
    ax.plot(traj.iloc[:, 1], traj.iloc[:, 0],
            "-o", color="#2E5BFF", linewidth=1.6, markersize=3.2,
            markeredgewidth=0, label="Trajectory (100 waypoints)")
    # Start & end markers
    ax.plot(traj.iloc[0, 1], traj.iloc[0, 0], marker="s", color="#2E7D32",
            markersize=8, label="Start")
    ax.plot(traj.iloc[-1, 1], traj.iloc[-1, 0], marker="^", color="#6A1B9A",
            markersize=8, label="End")
    # Target
    ax.plot(target_lon, target_lat, marker="o", color="#D32F2F",
            markersize=11, markeredgecolor="white", markeredgewidth=1.3,
            label="Target")

    # Add a few dashed bearing rays from sampled waypoints to the target
    n = len(traj)
    sample_idx = np.linspace(0, n - 1, 6, dtype=int)
    for i in sample_idx:
        ax.plot([traj.iloc[i, 1], target_lon],
                [traj.iloc[i, 0], target_lat],
                color="#D32F2F", alpha=0.18, linewidth=0.8, linestyle="--")

    ax.set_xlabel("Longitude (°)", fontsize=10)
    ax.set_ylabel("Latitude (°)",  fontsize=10)
    ax.set_title(f"Trajectory with {len(bearings)} bearings to target",
                 fontsize=11, pad=8)
    ax.tick_params(labelsize=9)
    ax.grid(alpha=0.3, linewidth=0.5)
    ax.legend(fontsize=8.5, loc="best", framealpha=0.92)
    ax.set_aspect("auto")
    fig.tight_layout()
    fig.savefig(out_path, dpi=140, bbox_inches="tight", facecolor="white")
    plt.close(fig)
    print(f"[ok] {out_path}")


# ---------------------------------------------------------------------------
# Figure 4: Python OpenCV-style trajectory overlay on building mask
# ---------------------------------------------------------------------------
def make_python_overlay(out_path):
    # Build a 256x256 occupancy mask from existing trajectory bounds.
    traj = pd.read_csv(ROOT / "trajectory1.csv", header=None)
    lat_min, lat_max = traj.iloc[:, 0].min(), traj.iloc[:, 0].max()
    lon_min, lon_max = traj.iloc[:, 1].min(), traj.iloc[:, 1].max()

    # Pad the bounding box slightly so the trajectory has room.
    lat_pad = (lat_max - lat_min) * 0.15 + 1e-5
    lon_pad = (lon_max - lon_min) * 0.15 + 1e-5
    lat_min -= lat_pad; lat_max += lat_pad
    lon_min -= lon_pad; lon_max += lon_pad

    img = np.zeros((256, 256), dtype=np.uint8)

    # Synthetic building footprints (gray = 50). Layout chosen to look urban
    # and to avoid trampling the trajectory we will draw next.
    rng = np.random.default_rng(7)
    blocks = [
        (10, 10, 50, 60),  (80, 10, 60, 50), (170, 20, 60, 70),
        (10, 90, 60, 60),  (90, 90, 50, 50), (180, 110, 60, 60),
        (20, 175, 70, 60), (110, 175, 50, 60),(190, 200, 50, 40),
    ]
    for (x, y, w, h) in blocks:
        # split each rectangle into a few sub-blocks for variety
        for sub in range(rng.integers(2, 5)):
            sx = x + rng.integers(0, max(w // 3, 1))
            sy = y + rng.integers(0, max(h // 3, 1))
            sw = rng.integers(max(w // 4, 4), max(w // 2, 6))
            sh = rng.integers(max(h // 4, 4), max(h // 2, 6))
            img[sy:sy + sh, sx:sx + sw] = 50

    # Map trajectory coords to grid pixels
    def to_xy(lat, lon):
        x = int(np.clip((lon - lon_min) / (lon_max - lon_min) * 255, 0, 255))
        y = int(np.clip((1 - (lat - lat_min) / (lat_max - lat_min)) * 255, 0, 255))
        return x, y

    pts = [to_xy(la, lo) for la, lo in zip(traj.iloc[:, 0], traj.iloc[:, 1])]

    # Draw thick trajectory in white (255). Use Bresenham-style line segments.
    def stamp(cx, cy, r=1):
        for dy in range(-r, r + 1):
            for dx in range(-r, r + 1):
                if dx * dx + dy * dy <= r * r:
                    yy, xx = cy + dy, cx + dx
                    if 0 <= yy < 256 and 0 <= xx < 256:
                        img[yy, xx] = 255

    for i in range(len(pts) - 1):
        x0, y0 = pts[i]; x1, y1 = pts[i + 1]
        steps = max(abs(x1 - x0), abs(y1 - y0), 1) + 1
        for t in np.linspace(0, 1, steps):
            stamp(int(round(x0 + (x1 - x0) * t)),
                  int(round(y0 + (y1 - y0) * t)), r=1)

    # Render with matplotlib so the output looks like cv2.imshow but saves to PNG
    fig, ax = plt.subplots(figsize=(4.6, 4.6), dpi=140)
    ax.imshow(img, cmap="gray", vmin=0, vmax=255, interpolation="nearest")
    ax.set_title("Trajectory overlay on building mask  (OpenCV-style)",
                 fontsize=10, pad=6)
    ax.set_xlabel("grid x", fontsize=9)
    ax.set_ylabel("grid y", fontsize=9)
    ax.tick_params(labelsize=8)
    fig.tight_layout()
    fig.savefig(out_path, dpi=140, bbox_inches="tight", facecolor="white")
    plt.close(fig)
    print(f"[ok] {out_path}")


# ---------------------------------------------------------------------------
# Run everything
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    sig_src = ROOT / "synctest_trajectoryDataset1" / "50.xlsx"
    make_signal_heatmap(FIX / "ex1_signal_heatmap.png", sig_src,
                        title="Signal-strength map at one waypoint  (28 GHz, ray tracing)")
    make_trajectory_with_target(FIX / "ex2_traj_with_target.png")
    make_signal_heatmap(GTM / "ex1_transmitter_heatmap.png", sig_src,
                        title="Per-transmitter signal map  (random angle, 28 GHz)")
    make_python_overlay(GTM / "ex3_python_overlay.png")
    print("All four figures generated.")
