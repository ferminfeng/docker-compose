#!/bin/bash

INFO() {
  echo "[$(date +%H:%M:%S)] [INFO] $*"
}


# 创建 supervisor 日志目录
! [ -d "$SUPERVISOR_LOG_DIR" ] && mkdir "$SUPERVISOR_LOG_DIR"
! [ -d "/usr/run" ] && mkdir "/usr/run"


# 修改nginx的权限
chown -R www-data:www-data /var/lib/nginx

# 转换php-fpm
find "${NGINX_CONF_D}" -type f -exec sed -i "s~\$PHP_FPM_SOCK~$PHP_FPM_SOCK~g" {} +


# 打印nginx配置文件
INFO "$NGINX_DEFAULT_CONF"
cat "$NGINX_DEFAULT_CONF"


# 使用守护程序运行程序
exec supervisord -n -c /etc/supervisor/supervisord.conf