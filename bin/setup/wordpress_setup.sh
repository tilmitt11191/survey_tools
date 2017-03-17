#bash
export LANG=C

pwd=`sudo pwd`
cd `dirname $0`

source ../../lib/utils/log.sh
source ../../lib/utils/getconf.sh
LOG_FILE=`getconf "logdir"``getconf "logfile"`
function log_info_() { log_info "$1" "$LOG_FILE";}

log_info "$0 start"

##directory check
log_info 'directory check start.'
TARGETS=("../../var/www" "/var/www")
for target in ${TARGETS[@]}; do
	if [ ! -d $target ] ;then log_fatal "dir[$target] not exist";exit 1;fi
done

## package check
log_info 'package check start.'
PACKAGES=(mysql-server apache2 php php-cgi libapache2-mod-php php-common php-pear php-mbstring php-mysql)
for package in ${PACKAGES[@]}; do
	dpkg -l $package | grep -E "^i.+[ \t]+$package" > /dev/null
	if [ $? -ne 0 ];then
		m="$package not installed. sudo apt-get install -y $package."
		log_info "$m"
		#sudo apt-get install -y $package
	else
		m="$package already installed."
		log_info "$m"
	fi

done

log_info "install wordpress"
log_debug "wget"
#wget http://ja.wordpress.org/wordpress-4.7.1-ja.tar.gz -P ./
log_debug "tar zxvf"
#tar zxvf "./wordpress-4.7.1-ja.tar.gz"
log_debug "rm"
#rm ./wordpress-4.7.1-ja.tar.gz
log_debug "sudo mv"
#sudo mv ./wordpress /var/www/paper_graph
log_debug "sudo chmod"
#sudo chmod -R 755 /var/www/paper_graph

log_info "replace apache2.conf"
#if [ -e "/etc/apache2/apache2.conf" ]; then
#	sudo cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.`date +%Y%m%d%H%M%S`
#fi
#sudo cp ../../etc/apache2.conf /etc/apache2/apache2.conf

log_info "restart apache2"
#sudo service apache2 restart

log_info "mysql setting"
##mysql -u root -p
##or
##sudo mysql
##create database paper_graph;
##grant all privileges on paper_graph.* to paper_graph@localhost identified by 'pg';


##access by browser to http://localhost:50080/paper_graph/
## adress and port num are depend on server
##db name: paper_graph
##db user name: paper_graph
##db passwd: pg
##db host name paper_graph
##table prefix: pg_

#paper_graph:pg
