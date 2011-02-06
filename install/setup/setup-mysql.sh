#!/bin/bash
# install mysql
ln -s /mnt/e/var/lib/mysql/ /var/lib/mysql
cd /mnt/e/install/mysql5.5
rpm -ihv MySQL-client-5.5.8-1.rhel5.i386.rpm
rpm -ivh MySQL-server-5.5.8-1.rhel5.i386.rpm
chkconfig --add mysql
service mysql start
/usr/bin/mysqladmin -u root password 'dontuse' > /dev/null 2>&1
