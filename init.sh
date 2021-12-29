#!/bin/bash

addr=$(pwd)
files=(/etc/nginx.conf)
# shellcheck disable=SC2068
for f in ${files[@]}; do
        sed -ri "s!\S*/web!${addr}!g" "${addr}""${f}"
done

sudo ln -sf "${addr}"/etc/nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart