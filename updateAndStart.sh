#!/bin/bash

git pull --rebase --autostash
npm install --no-audit --no-fund --quiet --omit=dev
node "server.js" "$@"