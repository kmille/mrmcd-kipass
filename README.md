## This challenge was part of the MRMCD 2018 CTF

## Challenge description
Our friend uses an uptodate Keepass + KeePassHttp for storing his passwords. We could sniff the traffic between his browser and KeePassHttp (mrmcd.pcapng). KeePassHttp runs on port 19445. Can you decrypt the password (vuln is in https://github.com/pfn/keepasshttp)?


## Background && Solution
The KeepassHTTP-Plugin provides a REST-API for Keepass which allows your browser (plugin) to communicate with Keepass. There is a Padding Oracle in KeepassHTTP which allows you to decrypt encrypted data which was sent previously between a client and the API. So you first have to sniff the lo interface. The KeepassHTTP guys know about it but [don't want to fix it](https://github.com/pfn/keepasshttp/issues/258#issuecomment-421273758).

There is a docker container running the challenge. There is also an exploit script. Have fun.  