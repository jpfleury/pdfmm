########################################################################
##
## Variables.
##
########################################################################

# Chemin vers le bureau.
cheminBureau:=$(shell xdg-user-dir DESKTOP)

# Dossier de publication.
dossierPub=pdf--

# Dernière version, représentée par la dernière étiquette.
version:=$(shell bzr tags | sort -k2n,2n | tail -n 1 | cut -d ' ' -f 1)

########################################################################
##
## Métacibles.
##
########################################################################

# Crée l'archive; y ajoute les fichiers qui ne sont pas versionnés, mais nécessaires; supprime les fichiers versionnés, mais inutiles. À faire après un `bzr tag ...` pour la sortie d'une nouvelle version.
publier: fichiersSurBureau

########################################################################
##
## Cibles.
##
########################################################################

archive: changelog versionTxt
	bzr export -r tag:$(version) $(dossierPub)
	cp doc/ChangeLog $(dossierPub)/doc
	cp doc/version.txt $(dossierPub)/doc
	rm -f $(dossierPub)/Makefile
	zip -qr pdf--.zip $(dossierPub)
	rm -rf $(dossierPub)

changelog:
	# Est basé sur <http://telecom.inescporto.pt/~gjc/gnulog.py>. Ne pas oublier de mettre ce fichier dans le dossier des extensions de bazaar, par exemple `~/.bazaar/plugins/`.
	BZR_GNULOG_SPLIT_ON_BLANK_LINES=0 bzr log -v --log-format 'gnu' -r1..tag:$(version) > doc/ChangeLog

fichiersSurBureau: archive
	cp doc/ChangeLog $(cheminBureau)
	cp doc/LISEZ-MOI.mdtxt $(cheminBureau)
	mv pdf--.zip $(cheminBureau)

push:
	bzr push lp:~jpfle/+junk/pdf--

versionTxt:
	echo $(version) > doc/version.txt

