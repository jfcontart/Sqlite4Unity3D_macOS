#!/usr/bin/env bash

# Version example : 2020 3310100

if [ "$#" -ne 2 ]
then
    echo "Usage:"
    echo "./SQLiteBuilt.sh <YEAR> <VERSION>"
    exit 1
fi

VERSION=$2
YEAR=$1

#prepare dir to compile

mkdir ./tmp
mkdir ./tmp/${VERSION}
cd ./tmp/${VERSION}/

#Download sources files from SQLCipher

curl -OL https://www.sqlite.org/${YEAR}/sqlite-autoconf-${VERSION}.tar.gz
tar -xvf sqlite-autoconf-${VERSION}.tar.gz
ls 
cd sqlite-autoconf-${VERSION}

#Compile

make clean
./configure \
--target=x86_64 \
CFLAGS=" \
"
make 

#Copy result

cd ..
cd ..
cd .. 

mkdir ./${VERSION}
mkdir ./${VERSION}/macOS
rm  ./${VERSION}/macOS/libsqlite3.0.dylib

cp ./tmp/${VERSION}/sqlite-autoconf-${VERSION}/.libs/libsqlite3.0.dylib ./${VERSION}/macOS/libsqlite3.0.dylib

open ./${VERSION}

#Clean 

rm -r ./tmp

