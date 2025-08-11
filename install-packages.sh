#!/bin/sh
echo "Installing custom npm packages..."
/usr/bin/npm install iconv-lite jschardet --prefix /usr/local/lib/node_modules/n8n/node_modules
echo "Custom packages installed."
