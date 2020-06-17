#!/bin/bash

echo "Send documents"
rsync -avh --progress --update /home/amarok/Documents amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/Games amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/Pictures amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/TODOLists amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/backup amarok@192.168.1.2:/media/encrypted_backup/
echo "Backup apps"
rsync -avh --progress --update /home/amarok/.thunderbird amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/.ssh amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/.ansible amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/.gnupg amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/.local/share/jami amarok@192.168.1.2:/media/encrypted_backup/.local/share/
rsync -avh --progress --update /home/amarok/.mozilla amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/.oh-my-zsh amarok@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/amarok/.password-store amarok@192.168.1.2:/media/encrypted_backup/
echo "Send medias"
rsync -avh --progress --update /home/amarok/Music/* amarok@192.168.1.2:/media/media_drive/
rsync -avh --progress --update /home/amarok/Videos/* amarok@192.168.1.2:/media/media_drive/
rm -rf /home/amarok/Videos/* /home/amarok/Music/*

echo `date` >> ~/.backup
