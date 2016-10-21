
#bash
export LANG=C
pwd=`pwd`
cd `dirname $0`

source ../lib/utils/log.sh
LOG_FILE='../var/log/log'
function log_info_() { log_info "$1" "$LOG_FILE";}

## package check
log_info_ 'package check start.'
PACKAGES=(default-jre default-jdk)
for package in ${PACKAGES[@]}; do
	dpkg -l $package | grep -E "^i.+[ \t]+$package" > /dev/null
	if [ $? -ne 0 ];then
		m="apt-get install -y $package."
		log_info_ "$m"
		sudo apt-get install -y $package
	fi
done

PACKAGES=(neography neo4j-cypher activesupport test-unit poppler gobject-introspection gio2)
for package in ${PACKAGES[@]}; do
	gem list | grep $package > /dev/null 2>&1
	if [ $? -ne 0 ];then
		m="sudo gem install $package"
		log_info_ "$m"
		sudo gem install $package
	fi
done

log_info_ 'package check finished.'


cd $pwd
exit 0