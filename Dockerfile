FROM n8nio/n8n:latest

USER root

# npmのキャッシュを無効にする
ENV NPM_CONFIG_CACHE=/tmp/npm_cache

# package.jsonをコピー
COPY package.json /tmp/package.json

# 一時ディレクトリに移動し、依存関係をインストール
WORKDIR /tmp
RUN npm install

# n8nのnode_modulesにインストールしたパッケージをコピーして権限を変更
RUN cp -R /tmp/node_modules/* /usr/local/lib/node_modules/n8n/node_modules/ && \
    chown -R node:node /usr/local/lib/node_modules/n8n/node_modules/iconv-lite && \
    chown -R node:node /usr/local/lib/node_modules/n8n/node_modules/jschardet

# ユーザーをnodeに戻す
USER node
