
del .\log\mysql57\mysql_error.log
del .\log\mysql57\mysql_query.log
del .\log\mysql57\mysql_slow.log

del .\log\nginx\access.log
del .\log\nginx\error.log

del .\log\php74\fpm_access.log
del .\log\php74\fpm_error.log
del .\log\php74\fpm_slow.log
del .\log\php74\php_error.log
del .\log\php74\www_error.log

del .\log\redis\redis.log

del .\log\supervisor\*.log

rmdir /s .\data\mongo
rmdir /s .\data\mysql57
rmdir /s .\data\redis
