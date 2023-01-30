#!/bin/bash

ldapId="213070052"
accessToken="198b00c57bccc8c5c8c16258450a36c6"

/usr/bin/curl -s --location-trusted -u $ldapId:$accessToken "https://internet-sso.iitb.ac.in/login.php" | \
grep -q window.location.href && \
echo 'Logged in!' || \
echo 'Something is wrong or already logged in!'