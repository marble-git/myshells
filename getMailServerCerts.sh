#!/bin/bash

MAILBOX=imap.qq.com
SSLPORT=993

mkdir -p /root/.certs/
echo -n | openssl s_client -connect ${MAILBOX}:${SSLPORT} | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ~/.certs/${MAILBOX}.crt
certutil -A -n "GeoTrust SSL CA" -t "C,," -d ~/.certs -i ~/.certs/${MAILBOX}.crt
certutil -A -n "GeoTrust Global CA" -t "C,," -d ~/.certs -i ~/.certs/${MAILBOX}.crt
certutil -L -d /root/.certs

cd ~/.certs/
certutil -A -n "GeoTrust SSL CA - G3" -t "Pu,Pu,Pu" -d ./ -i ${MAILBOX}.crt
