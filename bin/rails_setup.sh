
#bash
export LANG=C

BINDIR=~/bin/

pwd=`pwd`
cd `dirname $0`

source ../lib/utils/log.sh
LOG_FILE='../var/log/log'
function log_info_() { log_info "$1" "$LOG_FILE";}

## package check
log_info_ 'package check start.'
PACKAGES=()
for package in ${PACKAGES[@]}; do
	dpkg -l $package | grep -E "^i.+[ \t]+$package" > /dev/null
	if [ $? -ne 0 ];then
		m="apt-get install -y $package."
		log_info_ "$m"
		sudo apt-get install -y $package
	fi
done

log_info_ 'gem install rails'
#gem install rails
log_info_ 'bundle install'
bundle install


PACKAGES=(bundle rake dropzonejs-rails)
for package in ${PACKAGES[@]}; do
	gem list | grep $package > /dev/null 2>&1
	if [ $? -ne 0 ];then
		m="gem install $package"
		log_info_ "$m"
		gem install $package
	fi
done

#gem install avtivesupport -v 4.2.7.1


log_info_ 'package check finished.'

log_info_ 'install finished.'

cd $pwd
exit 0