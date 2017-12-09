#!/usr/bin/bash
url="https://en.wikipedia.org/w/api.php?action=categorytree&category=$1&format=json"
#echo $url
curl $url|egrep -o "Category:[a-zA-Z_]+"|sort
