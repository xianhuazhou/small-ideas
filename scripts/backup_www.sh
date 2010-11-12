#!/bin/bash
cd /var/www/html/example.com;
scp -r * backup_user@backup.manchine.name:/backup/sites/example.com;
