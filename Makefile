########################################################################
##
## Variables.
##
########################################################################

# Chemin vers le bureau.
cheminBureau:=$(shell xdg-user-dir DESKTOP)

# Dossier de publication.
dossierPub=pdfmm

# Dossier temporaire.
dossierTempo=tmp

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
	mkdir -p $(dossierTempo)
	bzr export -r tag:$(version) $(dossierTempo)/$(dossierPub)
	cp doc/ChangeLog $(dossierTempo)/$(dossierPub)/doc
	cp doc/version.txt $(dossierTempo)/$(dossierPub)/doc
	rm -f $(dossierTempo)/$(dossierPub)/Makefile
	cd $(dossierTempo) && zip -qr ../pdfmm.zip $(dossierPub)
	rm -rf $(dossierTempo)

changelog:
	# Est basé sur <http://telecom.inescporto.pt/~gjc/gnulog.py>. Ne pas oublier de mettre ce fichier dans le dossier des extensions de bazaar, par exemple `~/.bazaar/plugins/`.
	BZR_GNULOG_SPLIT_ON_BLANK_LINES=0 bzr log -v --log-format 'gnu' -r1..tag:$(version) > doc/ChangeLog

fichiersSurBureau: archive
	cp doc/ChangeLog $(cheminBureau)
	cp doc/LISEZ-MOI.mdtxt $(cheminBureau)
	mv pdfmm.zip $(cheminBureau)

push:
	bzr push lp:~jpfle/+junk/pdfmm

versionTxt:
	echo $(version) > doc/version.txt

