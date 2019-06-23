#!/bin/bash

echo "Send documents"
rsync -avh --progress --update /home/AmarOk/Documents AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/Games AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/Pictures AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/TODOLists AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/backup AmarOk@192.168.1.2:/media/encrypted_backup/
echo "Backup apps"
rsync -avh --progress --update /home/AmarOk/.thunderbird AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.ssh AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.ansible AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.gnupg AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.local/share/jami AmarOk@192.168.1.2:/media/encrypted_backup/.local/share/
rsync -avh --progress --update /home/AmarOk/.mozilla AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.oh-my-zsh AmarOk@192.168.1.2:/media/encrypted_backup/
rsync -avh --progress --update /home/AmarOk/.password-store AmarOk@192.168.1.2:/media/encrypted_backup/
echo "Send medias"
rsync -avh --progress --update /home/AmarOk/Music/* AmarOk@192.168.1.2:/media/media_drive/
rsync -avh --progress --update /home/AmarOk/Videos/* AmarOk@192.168.1.2:/media/media_drive/
rm -rf /home/AmarOk/Videos/* /home/AmarOk/Music/*

echo `date` >> ~/.backup