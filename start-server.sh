#!/bin/sh
# Serves this folder at http://localhost:8000 (open that address in a browser).
cd "$(dirname "$0")"
python3 -m http.server 8000
