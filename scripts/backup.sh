#!/bin/bash

echo "Send documents"
rsync -avh --progress --update /home/AmarOk/Documents amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/Games amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/Pictures amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/TODOLists amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/backup amarok@192.168.1.2:/media/encrypted_backup/
echo "Backup apps"
rsync -avh --progress --update /home/AmarOk/.thunderbird amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.ssh amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.ansible amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.gnupg amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.local/share/jami amarok@192.168.1.2:/media/encrypted_backup/.local/share/
rsync -avh --progress --update /home/AmarOk/.mozilla amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.oh-my-zsh amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.password-store amarok@192.168.1.2:/media/encrypted_backup/
echo "Send medias"
rsync -avh --progress --update /home/AmarOk/Music/* amarok@192.168.1.2:/media/media_drive/
rsync -avh --progress --update /home/AmarOk/Videos/* amarok@192.168.1.2:/media/media_drive/
rm -rf /home/AmarOk/Videos/* /home/AmarOk/Music/*

echo `date` >> ~/.backup