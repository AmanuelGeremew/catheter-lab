# Catheter Hemodynamics Lab

An interactive model of blood flow around an intravascular catheter. The whole website is one file, `index.html`: no install, no build step and no server-side code.

## Run it on your computer

- **Easiest:** double-click `index.html`. It opens in your browser and works offline. Fonts fall back to system fonts without internet.
- **As a localhost website:** double-click `start-server.bat` (Windows) or run `./start-server.sh` (Mac/Linux). Both need Python and serve the site at http://localhost:8000. Other devices on the same Wi-Fi can open `http://<this computer's IP>:8000`.

```bash
python -m http.server 8000
```

## Put it on the internet for anyone

Upload `index.html` to any static web host. All of these are free:

- **GitHub Pages:**
  1. Create a public repository and upload `index.html`.
  2. Go to Settings → Pages → Deploy from branch → `main`, then click Save.
  3. The site appears at `https://<username>.github.io/<repo>/`.
- **Netlify Drop:** drag this folder onto https://app.netlify.com/drop.
- **Cloudflare Pages:** create a project, choose direct upload, and upload this folder.

Anyone using the site can also press **Download this simulator (HTML)** to keep their own copy.

## Files

| File | What it is |
| --- | --- |
| `index.html` | The entire website (HTML, CSS and JavaScript in one file). |
| `start-server.bat` / `start-server.sh` | Start a local web server on port 8000. |

## What the model does

- **Blood flow:** solves the flow across the vessel cross-section on a 65×65 grid, with shear-thinning (Carreau) blood and pulsatile waveforms. It handles any catheter position and any clot deposited so far.
- **Catheter flow:** two directions. **Out of catheter** covers infusion and dialysis return; **Into catheter** covers aspiration and dialysis withdrawal. Side holes are placed by clicking the catheter, each with its own size and angle, and the model solves how the flow splits between them.
- **Dialysis mode:** a double-D dual-lumen catheter with step, flush or symmetric tips, standard or reversed lines, and A-wave backflow. Each lumen is solved separately. Recirculation comes from a per-opening model calibrated on 3D lattice-Boltzmann simulations of neonatal tips. The cards also show both lumen pressures, effective blood flow and the heparin spilled from the lock. The *Neonatal dialysis* presets show the recommended design (symmetric tip, no side holes) next to a typical step tip with side holes.
- **Shear and blood damage:** wall and catheter shear rates and stresses, jet impact on the vessel wall, hemolysis (Ding 2015 human-blood power law by default, optional ×1.6 neonatal fragility, Giersiepen 1990 as an option) and platelet activation.
- **Confidence badges:** every readout says how far to trust it (high, medium or low) and why.
- **Clotting:** fibrin sheath, mural thrombus and hole occlusion grow on a separate clinical clock. A thrombosis risk index is built from Virchow's triad.

The in-app *Methods, assumptions & references* panel lists every equation and source. This is an educational model and must not be used for clinical decisions.
