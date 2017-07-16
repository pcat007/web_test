#!/bin/bash
sleep 1
# 
sed -i 's/Options Indexes FollowSymLinks/Options None/' /etc/apache2/apache2.conf
/etc/init.d/apache2 start

# chmod
mkdir /var/www/html/uploads
chmod 777 /var/www/html/uploads

# change secure_file_priv
sed -i 's/secure_file_priv=\/var\/www\/html\/uploads//' /etc/mysql/my.cnf
sed -i 's/\[mysqld\]/&\nsecure_file_priv=\/var\/www\/html\/uploads/' /etc/mysql/my.cnf
service mysql start

# change mysql password
mysqladmin -uroot password "fish_fish_fish"
mysql -uroot -pfish_fish_fish < /var/www/html/fish.sql
rm -f /var/www/html/fish.sql

history -c
#rm -f /root/start.sh
/bin/bash