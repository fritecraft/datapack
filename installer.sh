#!/bin/bash
# Installe le pack sur un serveur (copie pack.mcmeta et data/ dans world/datapacks/fritecraft).
#   ./installer.sh test        -> /behemoth/data/FRITECRAFT/fritecraft_2027/servers/test/data/world/datapacks/fritecraft
# Redémarrer le serveur ensuite (docker restart -t 120 <conteneur>) et lire le journal : les erreurs de chargement y sont.
set -euo pipefail
cd "$(dirname "$0")"
serveur="${1:?usage : ./installer.sh <serveur>  (par exemple test)}"
racine="/behemoth/data/FRITECRAFT/fritecraft_2027/servers/$serveur/data/world/datapacks/fritecraft"
mkdir -p "$racine"
rm -rf "$racine/data"
cp pack.mcmeta "$racine/pack.mcmeta"
cp -r data "$racine/data"
chown -R 1000:1000 "$racine/.." 2>/dev/null || true
echo "pack installé dans $racine"
