#!/bin/bash

# Ce fichier fait partie de pdf--.
# pdf-- est un assistant graphique pour réduire la taille d'un fichier PDF.

# Auteur: Jean-Philippe Fleury <contact@jpfleury.net>
# Copyright © Jean-Philippe Fleury, 2011.

# Ce programme est un logiciel libre; vous pouvez le redistribuer ou le
# modifier suivant les termes de la GNU General Public License telle que
# publiée par la Free Software Foundation: soit la version 3 de cette
# licence, soit (à votre gré) toute version ultérieure.

# Ce programme est distribué dans l'espoir qu'il vous sera utile, mais SANS
# AUCUNE GARANTIE: sans même la garantie implicite de COMMERCIALISABILITÉ
# ni d'ADÉQUATION À UN OBJECTIF PARTICULIER. Consultez la Licence publique
# générale GNU pour plus de détails.

# Vous devriez avoir reçu une copie de la Licence publique générale GNU avec
# ce programme; si ce n'est pas le cas, consultez
# <http://www.gnu.org/licenses/>.

if [ -z $(which zenity) ] || [ -z $(which gs) ]; then
	echo "zenity et ghostscript doivent être installés."
	exit 1
fi

if [ ! -z "$1" ]; then
	pdfAreduire="$1"
else
	pdfAreduire=`zenity --file-selection --title="Sélectionnez un fichier PDF dont la taille doit être réduite"`
	
	if [ $? -ne 0 ]; then
		zenity --error --text="Aucun fichier PDF sélectionné."
		exit 1
	fi
fi

if [ ! -f "$pdfAreduire" ]; then
	zenity --error --text="Le fichier précisé n'existe pas ou n'est pas utilisable:\n$pdfAreduire"
	exit 1
fi

ext="${pdfAreduire##*.}" # Si elle existe, l'extension est récupérée pour conserver sa casse («pdf» ou «PDF»).

if [ "$ext" != "$pdfAreduire" ]; then
	pdfReduit=$(echo "$pdfAreduire" | sed "s/\.$ext$/--.$ext/")
else
	pdfReduit="$pdfAreduire--"
fi

if [ -f "$pdfReduit" ]; then
	zenity --question --text="Le fichier optimisé suivant existe déjà:\n$pdfReduit\n\nVoulez-vous vraiment écraser ce fichier?"
	
	if [ $? -eq 1 ]; then
		zenity --info --text="Arrêt du script."
		exit 0
	fi
fi

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="$pdfReduit" "$pdfAreduire" | zenity --notification --listen --window-icon="info" --text="Réduction de la taille du fichier suivant en cours: $pdfAreduire"

if [ ${PIPESTATUS[0]} -ne 0 ]; then
	zenity --error --text="Erreur lors de la réduction de la taille du fichier suivant:\n$pdfAreduire"
	
	if [ -f "$pdfReduit" ]; then
		rm "$pdfReduit"
	fi
	
	exit 1
fi

zenity --info --text="Réduction de la taille du fichier suivant terminée:\n$pdfAreduire\n\nLe nouveau fichier optimisé est:\n$pdfReduit"
exit 0

