#!/bin/bash

#generate and save the key for the ssl certificate

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/preina-g.key -out /etc/ssl/certs/preina-g.crt -subj "/C=SP/ST=Malaga/L=Malaga/O=42 Malaga/OU=preina-g/CN=preina-g"

nginx -g "daemon off;"