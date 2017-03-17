#bash
export LANG=C
pwd=`sudo pwd`
cd `dirname $0`

sudo rsync -av ../var/www/paper_graph /var/www/paper_graph

cd $pwd
exit 0