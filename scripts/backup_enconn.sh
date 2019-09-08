#!/bin/bash

rsync -avh --progress --update /etc /media/encrypted_backup/backup_enconn/
rsync -avh --progress --update /var/www /media/encrypted_backup/backup_enconn/
rsync -avh --progress --update /home/git /media/encrypted_backup/backup_enconn/home
rsync -avh --progress --update /home/amarok /media/encrypted_backup/backup_enconn/home

echo `date` >> ~/.backup