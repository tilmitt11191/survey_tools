
#bash
export LANG=C
pwd=`pwd`
cd `dirname $0`

source ../lib/utils/log.sh
LOG_FILE='../var/log/log'
function log_info_() { log_info "$1" "$LOG_FILE";}

## package check
log_info_ 'package check start.'
PACKAGES=(default-jre java default-jdk)
for package in ${PACKAGES[@]}; do
	dpkg -l $package | grep -E "^i.+[ \t]+$package" > /dev/null
	if [ $? -ne 0 ];then
		m="apt-get install -y $package."
		log_info_ "$m"
		sudo apt-get install -y $package
	fi
done

PACKAGES=(neography activesupport)
for package in ${PACKAGES[@]}; do
	gem list | grep $package > /dev/null 2>&1
	if [ $? -ne 0 ];then
		m="sudo gem install $package"
		log_info_ "$m"
		sudo gem install $package
	fi
done

log_info_ 'package check finished.'


log_info_ 'neo4j install start.'

if [ `hostname | grep 'ubuntu'` ] ; then
	VERSION='3.0.6'
  tar xzf "neo4j-community-$VERSION-unix.tar.gz"
  ./neo4j-community-$VERSION/bin/neo4j
  #rm -rf "neo4j-community-$VERSION"
fi

log_info_ 'neo4j install finished.'

pwd
cd $pwd
exit 0