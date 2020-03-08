# Sqlite4Unity3D_macOS

Sqlite4Unity3D build bundle for macOS (OSX). Use with https://github.com/netpyoung/SqlCipher4Unity3D .

# macOS©

You need :
- be on macOS
- install xcode
- install xcode as command

## Use the SQLiteBuilt.sh

Use the SQLiteBuilt.sh :
```
cd <this directory>
./SQLiteBuilt.sh <version example:3310100>
```

## Compile SQLite3 from sources

```
mkdir ./tmp
mkdir ./tmp/${VERSION}
cd ./tmp/${VERSION}/

#Download sources files from SQLCipher

curl -OL https://www.sqlite.org/2020/sqlite-autoconf-${VERSION}.tar.gz
tar -xvf sqlite-autoconf-${VERSION}.tar.gz
ls 
cd sqlite-autoconf-${VERSION}
```

## Prepare compile option

To access to help :
```
./configure --help
```
see https://www.sqlite.org/compile.html for the flags.

```
make clean
./configure \
--target=x86_64 \
CFLAGS=" \
"
make  
```

## Copy on desktop

```
cd ..
cd ..
cd .. 
mkdir ./${VERSION}
cp ./tmp/${VERSION}/sqlite-autoconf-${VERSION}/.libs/libsqlite3.0.dylib ./${VERSION}/
open ./${VERSION}
```

## Remove directory

```
rm -r ./tmp
```

## Copy libsqlite3.0.dylib in project

Copy in "MacOS" folder, select file and check in "Inspector" :

On select **platforms for plugin**
- Set "Editor" - yes
- Set "Standalone" - yes

On tab **unity**
- Set "CPU" - Any CPU
- Set "OS" - OSX

On tab **standalone**
- Set "x64" - yes
