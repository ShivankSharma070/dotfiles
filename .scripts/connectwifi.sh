#!/usr/bin/env bash

username="24MIS0155"
password="aehwDUQ"

if ! [ -z $1 ] && ! [ -z $2 ]; then
    username=$1
    password=$2
fi


curl -kX POST -d "userId=$username" -d "password=$password" -d "serviceName=ProntoAuthentication" -d "Submit22=Login" "https://phc.prontonetworks.com/cgi-bin/authlogin?URI=http://captive.apple.com/hotspot-detect.html" >/dev/null
