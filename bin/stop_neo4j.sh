
#bash
export LANG=C
pwd=`pwd`
cd `dirname $0`

if [ `hostname | grep 'ubuntu'` ] ; then
	VERSION='3.0.6'
# tar xzf "neo4j-community-$VERSION-unix.tar.gz"
  ./neo4j-community-$VERSION/bin/neo4j stop
  #rm -rf "neo4j-community-$VERSION"
fi

cd $pwd
exit 0
