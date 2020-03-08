# Sqlite4Unity3D_macOS
Sqlite4Unity3D build bundle for macOS (OSX)


# MacOS

## Needed obtain file's informations

```
cd /usr/bin/
file sqlite3
```
``
sqlite3: Mach-O universal binary with 2 architectures: [x86_64h:Mach-O 64-bit executable x86_64h] [x86_64]
``
``
sqlite3 (for architecture x86_64h):	Mach-O 64-bit executable x86_64h
``
``
sqlite3 (for architecture x86_64):	Mach-O 64-bit executable x86_64
``

## Compile SQLite3 from sources

```
mkdir /tmp/SQLiteMacOS
cd /tmp/SQLiteMacOS/
curl -O https://www.sqlite.org/2020/sqlite-autoconf-3310100.tar.gz
tar -xzvf sqlite-autoconf-3310100.tar.gz
cd /tmp/SQLiteMacOS/sqlite-autoconf-3310100/
```
## Prepare compile option
To access to help :
```
./configure --help
```
see https://www.sqlite.org/compile.html for the flags.

```
cd /tmp/SQLiteMacOS/sqlite-autoconf-3310100/
make clean
./configure \
--target=x86_64 \
CFLAGS=" \
"
make 
```

## Copy on desktop

```
ls /tmp/SQLiteMacOS/sqlite-autoconf-3310100/.libs/
open /tmp/SQLiteMacOS/sqlite-autoconf-3310100/.libs/
file /tmp/SQLiteMacOS/sqlite-autoconf-3310100/.libs/libsqlite3.0.dylib
mkdir ~/Desktop/SQLiteMacOS
cp /tmp/SQLiteMacOS/sqlite-autoconf-3310100/.libs/libsqlite3.0.dylib ~/Desktop/SQLiteMacOS/
open ~/Desktop/SQLiteMacOS/
```

## Remove directory

```
rm -r mkdir /tmp/SQLiteMacOS/*
rm -r /tmp/SQLiteMacOS
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