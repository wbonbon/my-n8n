FROM n8nio/n8n:latest
RUN npm install iconv-lite jschardet --prefix /usr/local/lib/node_modules/n8n/node_modules
