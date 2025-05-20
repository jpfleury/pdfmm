## Aperçu

pdfmm (pour «pdf moins moins», ou «pdf--») est un assistant graphique pour réduire la taille de fichiers PDF.

<img src="https://raw.githubusercontent.com/jpfleury/pdfmm/master/doc/exemple1-fr.png" width="683" height="526" alt="Assistant graphique de réduction de la taille des fichiers PDF">

Voici quelques résultats obtenus avec des fichiers PDF choisis au hasard:

| Taille de départ | Taille à la sortie | % d'optimisation |
| ---------------- | ------------------ | ---------------- |
| 29 Kio           | 23 Kio             | 20 %             |
| 363 Kio          | 72 Kio             | 80 %             |
| 733 Kio          | 658 Kio            | 10 %             |
| 991 Kio          | 349 Kio            | 65 %             |
| 1,7 Mio          | 0,8 Mio            | 52 %             |
| 1,9 Mio          | 1,1 Mio            | 40 %             |
| 2,3 Mio          | 1,6 Mio            | 31 %             |
| 3,4 Mio          | 1,3 Mio            | 60 %             |
| 7,1 Mio          | 5,4 Mio            | 23 %             |
| 14,8 Mio         | 9,4 Mio            | 36 %             |
| 54,3 Mio         | 14,6 Mio           | 73 %             |

Bien sûr, ces chiffres sont donnés seulement à titre d'exemples. Le résultat ne sera sûrement pas le même avec d'autres fichiers de taille similaire. Tout dépend du contenu.

## Dépendances

pdfmm est un script shell dépendant de bash (>= 4.0), sed, zenity et ghostscript.

## Installation

- [Télécharger l'archive de la dernière version.](https://github.com/jpfleury/pdfmm/archive/master.zip)

- Extraire l'archive.

### Utilisateur courant

Le script est prêt à être utilisé par l'utilisateur courant.

### Tous les utilisateurs

Pour rendre accessible le script à tous les utilisateurs, ajouter le fichier `pdfmm` dans le dossier `/usr/bin/` (nécessite d'avoir les droits d'administration).

Dans ce cas, le dossier créé par l'extraction de l'archive peut être effacé ou mis à la corbeille après la copie.

## Désinstallation

### Utilisateur courant

Supprimer simplement le dossier créé par l'extraction de l'archive.

### Tous les utilisateurs

Supprimer le fichier `pdfmm` précédemment copié dans `/usr/bin/` (nécessite d'avoir les droits d'administration).

## Utilisation

**Notes:**

- Aucun fichier original n'est modifié. Le fichier optimisé est créé dans le même dossier que le fichier original.

- À la fin de l'opération, une fenêtre apparaît pour lister les fichiers optimisés. En cliquant sur *Valider*, ces fichiers seront conservés; en cliquant sur *Annuler*, ils seront supprimés.

- Un fichier de configuration est créé dans le dossier personnel de l'utilisateur lançant `pdfmm`:

		~/.config/pdfmm.conf

	Ce fichier contient le dossier du dernier fichier sélectionné. C'est ce dossier qui sera proposé par défaut lors de la prochaine ouverture de `pdfmm`.

### Utilisateur courant

Pour utiliser le script dans une console, lancer le fichier `pdfmm` en précisant son chemin d'accès:

	chemin/vers/pdfmm

Si vous vous trouvez dans le même dossier que le fichier `pdfmm`, la commande est:

	./pdfmm

Dans tous les cas, il est possible de préciser en argument les fichiers PDF à optimiser, par exemple:

	./pdfmm chemin/vers/le/fichier1.pdf chemin/vers/le/fichier2.pdf

Il est également possible d'ouvrir le script en cliquant sur le fichier `pdfmm` (simple clic ou double clic selon votre configuration) et en choisissant de le lancer.

Vous pouvez également créer un lanceur dont la commande correspond au chemin absolu vers le fichier, par exemple:

	/home/NOM/chemin/vers/pdfmm

### Tous les utilisateurs

Dans une console, simplement saisir `pdfmm`. Les fichiers PDF à optimiser peuvent être précisés en argument.

Un lanceur peut également être créé. Dans ce cas, la commande est simplement `pdfmm`.

## Traduction

pdfmm peut s'afficher dans plusieurs langues. Toute personne intéressée à effectuer une traduction peut donc traduire les phrases présentes dans la section *Localisation* du fichier `pdfmm` et m'envoyer le résultat. Pour l'instant, pdfmm est disponible en allemand, en anglais et en français.

## Développement

Le logiciel Git est utilisé pour la gestion de versions. [Le dépôt peut être consulté en ligne ou récupéré en local.](https://github.com/jpfleury/pdfmm)

## Licence

Auteur: Jean-Philippe Fleury (<https://github.com/jpfleury>)  
Copyright © Jean-Philippe Fleury, 2011-2015, 2019, 2025

Ce programme est un logiciel libre; vous pouvez le redistribuer ou le
modifier suivant les termes de la GNU General Public License telle que
publiée par la Free Software Foundation: soit la version 3 de cette
licence, soit (à votre gré) toute version ultérieure.

Ce programme est distribué dans l'espoir qu'il vous sera utile, mais SANS
AUCUNE GARANTIE: sans même la garantie implicite de COMMERCIALISABILITÉ
ni d'ADÉQUATION À UN OBJECTIF PARTICULIER. Consultez la Licence publique
générale GNU pour plus de détails.

Vous devriez avoir reçu une copie de la Licence publique générale GNU avec
ce programme; si ce n'est pas le cas, consultez
<http://www.gnu.org/licenses/>.
