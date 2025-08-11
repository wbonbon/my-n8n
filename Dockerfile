FROM n8nio/n8n:latest

# npmを最新にアップデート
RUN npm install -g npm@latest

# パッケージのインストール
RUN npm install iconv-lite jschardet --prefix /usr/local/lib/node_modules/n8n/node_modules
