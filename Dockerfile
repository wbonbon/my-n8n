FROM n8nio/n8n:latest

# rootユーザーに切り替える
USER root

# npmを最新にアップデート
RUN npm install -g npm@latest

# パッケージをインストール
RUN npm install iconv-lite jschardet --prefix /usr/local/lib/node_modules/n8n/node_modules

# 実行ユーザーをn8nのデフォルトであるnodeに戻す
USER node
