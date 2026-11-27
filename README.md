# Pack de données Fritecraft

Un **pack unique** pour les personnalisations du serveur (format de données 121, Minecraft 26.3). Il contient aujourd'hui :

- **Échanges des villageois** (refonte complète, décisions de John du 27/11/2026) : `data/fritecraft/villager_trade/`, les listes
  de candidats par métier et par niveau (`data/minecraft/tags/villager_trade/`), le nombre d'échanges tirés par niveau
  (`data/minecraft/trade_set/`, un par niveau) et les échanges du marchand ambulant filtrés (`data/minecraft/villager_trade/`).
  **Ces fichiers sont GÉNÉRÉS** par `outils/generer_echanges.py` du dépôt friteshop (à partir de `prix.yml` du dossier de
  référence et du jar de Minecraft) : ne pas les modifier à la main, relancer le générateur.
- Les anciens **succès** (pack téléchargé et adapté aux divinités, jamais utilisés) ont été mis de côté dans
  `_ressources/succes_desactives/` : ils remplaçaient les succès vanilla par des succès impossibles (parent `error:`), ce qui
  casserait l'arbre des succès sur un serveur. Ils ne sont pas chargés.
- `_ressources/` : anciennes ressources (non chargées par le jeu).

## Installer sur un serveur

```
./installer.sh test        # copie pack.mcmeta et data/ dans servers/test/data/world/datapacks/fritecraft
docker restart -t 120 fritecraft-paper-test
```

Lire ensuite le journal du serveur : une erreur de chargement du pack (identifiant d'objet inconnu, JSON mal formé) **empêche le
serveur de démarrer** (« Failed to load datapacks »). En cas d'erreur, retirer le dossier `world/datapacks/fritecraft` et
redémarrer.

## Régénérer les échanges

```
cd /behemoth/data/FRITECRAFT/code/friteshop
python3 -I outils/generer_echanges.py            # simulation
python3 -I outils/generer_echanges.py --ecrire   # écrit dans ce dépôt
```
