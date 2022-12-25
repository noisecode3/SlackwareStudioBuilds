#!/bin/bash
cd $(dirname $0) ; CWD=$(pwd)
MD5SUM="1a9a5d2aef0cb3b8ff571b0bfefa2a8b"
wget -c --no-config https://github.com/xanmod/linux/archive/5.15.84-xanmod1/linux-5.15.84-xanmod1.tar.gz

if [ $(md5sum linux-5.15.84-xanmod1.tar.gz | awk '{print $1;}') == $MD5SUM ] ; then
  echo "The MD5 sum matched"
else
  echo "!! The MD5 sum DIDN'T match !!"
  #Dangerous to use
  rm linux-5.15.84-xanmod1.tar.gz
  exit 1
fi

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
