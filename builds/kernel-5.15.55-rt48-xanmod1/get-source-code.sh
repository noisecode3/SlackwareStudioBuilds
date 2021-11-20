#!/bin/bash
SRCDIR=$(cd $(dirname $0); pwd)

cd $SRCDIR
wget https://github.com/xanmod/linux/archive/5.15.55-rt48-xanmod1.tar.gz
mv 5.15.55-rt48-xanmod1.tar.gz linux-5.15.55-rt48-xanmod1.tar.gz

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
