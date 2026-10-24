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
- **Shear and blood damage:** wall and catheter shear rates and stresses, jet impact on the vessel wall, hemolysis and platelet activation (Giersiepen power laws).
- **Clotting:** fibrin sheath, mural thrombus and hole occlusion grow on a separate clinical clock. A thrombosis risk index is built from Virchow's triad.

The in-app *Methods, assumptions & references* panel lists every equation and source. This is an educational model and must not be used for clinical decisions.
