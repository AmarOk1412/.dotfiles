#!/bin/bash

rsync -avh --progress --update /etc /media/encrypted_backup/backup_enconn/
rsync -avh --progress --update /var/www /media/encrypted_backup/backup_enconn/
rsync -avh --progress --update /home/gitea /media/encrypted_backup/backup_enconn/home
rsync -avh --progress --update /home/AmarOk /media/encrypted_backup/backup_enconn/home

echo `date` >> ~/.backup