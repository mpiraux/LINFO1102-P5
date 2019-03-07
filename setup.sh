set -e

OASIS_DIR=$HOME/oasis
if ! test -d $OASIS_DIR; then
	mkdir $OASIS_DIR
	echo "Veuillez entrer le mot de passe correspondant à votre identifiant global:"
	sshfs -oHostKeyAlgorithms=+ssh-dss -o uid=$UID,workaround=rename,exec,umask=022 $USER@rdav.sgsi.ucl.ac.be:dfs/users/$(echo $USER | head -c 1)/$USER $OASIS_DIR
fi

if ! test -d $OASIS_DIR/LINFO1102-P5; then
	cd $OASIS_DIR
	echo "Téléchargement de l'archive"
	wget https://github.com/mpiraux/LINFO1102-P5/archive/master.zip -O P5.zip > /dev/null
	echo "Extraction de l'archive"
	unzip P5.zip > /dev/null
	mv LINFO1102-P5-master LINFO1102-P5
	rm P5.zip
fi

echo "Le squelette de projet ce trouve dans le répertoire $OASIS_DIR/LINFO1102-P5"
