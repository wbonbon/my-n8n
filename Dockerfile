FROM n8nio/n8n:latest

USER root

# npmのキャッシュを無効にする
ENV NPM_CONFIG_CACHE=/tmp/npm_cache

# iconv-liteとjschardetをn8nのnode_modulesに直接インストール
RUN npm install iconv-lite jschardet --prefix /usr/local/lib/node_modules/n8n/node_modules

# ユーザーをnodeに戻す
USER node
