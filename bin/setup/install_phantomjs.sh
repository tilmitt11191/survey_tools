#bash
export LANG=C

pwd=`sudo pwd`
cd `dirname $0`

#git clone git://github.com/ariya/phantomjs.git ../../tmp/phantomjs > /dev/null
cd ../../tmp/phantomjs/
git checkout 2.0
pwd
ls
sudo ./build.sh


cd $pwd
exit 0
