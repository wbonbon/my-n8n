FROM n8nio/n8n:latest

USER root

# n8nのnode_modulesディレクトリに移動
WORKDIR /usr/local/lib/node_modules/n8n

# 権限をnodeユーザーに変更してからnpm install
RUN chown -R node:node .

# ユーザーをnodeに変更
USER node

# パッケージをインストール
RUN npm install iconv-lite jschardet
