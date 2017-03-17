#bash
export LANG=C

pwd=`pwd`
cd `dirname $0`

source ../../lib/utils/log.sh
source ../../lib/utils/getconf.sh
LOG_FILE=`getconf "logdir"``getconf "logfile"`
function log_info_() { log_info "$1" "$LOG_FILE";}

log_info "$0 start"

