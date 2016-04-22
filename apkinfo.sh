#!/bin/sh

if [ 0 == $# ]
then
  echo 'Usage:\napkinfo.sh filename.apk'
  exit 0
fi

name=$1

# get key
gkey=`keytool -list -printcert -jarfile ${name} | grep "SHA1: " | cut -d " " -f 3`
fbkey=`echo ${gkey} | xxd -r -p | openssl base64`

printf "Google SHA1 Fingerprint: "
echo $gkey

printf "Facebook Keyhash: "
echo $fbkey

launch=$(aapt dump badging $name | grep launchable-activity)
package=$(aapt dump badging $name | grep package)

# launchActivity
printf "launchActivity: "
echo $launch | sed "s/'//g" | sed -E 's/.*name=([^ ]*).*/\1/g'

# package name
printf "packageName: "
echo $package | sed "s/'//g" | sed -E 's/.*name=([^ ]*).*/\1/g'

# version code
printf "versionCode: "
echo $package | sed "s/'//g" | sed -E 's/.*versionCode=([^ ]*).*/\1/g'

# version name
printf "versionName: "
echo $package | sed "s/'//g" | sed -E 's/.*versionName=([^ ]*).*/\1/g'
