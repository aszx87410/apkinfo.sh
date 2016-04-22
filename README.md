# apkinfo.sh

## Introduction
Get basic information of apk, including 

1. versionName
2. versionCode
3. packageName
4. launchActivity
5. Google SHA1 Fingerprint
6. Facebook Keyhash

## Usage

```
./apkinfo.sh NAME.apk
```
(Required `aapt` and `keytool`, please make sure you have these.)

## Example

```
⚡huli@mac ➜ demo» ./apkinfo.sh test.apk

Google SHA1 Fingerprint: 31:13:6B:CC:A8:7F:11:68:0F:20:45:2B:90:57:59:54:4C:C1:CF:1A
Facebook Keyhash: gPIEU7ZV7hkFdNrzHh/EWEzBzxo=
launchActivity: com.example.demo.MainActivity
packageName: com.example.demo
versionCode: 1
versionName: 1.0.0
```


## License
MIT