FROM n8nio/n8n:latest

# rootユーザーに切り替えてnpmをグローバルに更新
USER root
RUN npm install -g npm@latest

# n8nのユーザーに戻してパッケージをインストール
USER node
RUN npm install iconv-lite jschardet --prefix /usr/local/lib/node_modules/n8n/node_modules
