logfile=logs/copy-script.log
exec > $logfile 2>&1

docker-compose down
rm -r www
mv /home/bucca/Downloads/1111 www
rm -r www/images/
rm -r www/var
cp -r /assembly/wp2in1-IW-live-22-05-2019/wp-content/uploads www/images
chown -R www-data:www-data www
ls -lha www/src/woocommerce/assets/css/blocks/
