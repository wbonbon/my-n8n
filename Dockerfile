FROM n8nio/n8n:latest

# ユーザーをrootに切り替えて、新しいディレクトリを作成し、所有者をnodeユーザーに変更
USER root
RUN mkdir -p /usr/local/lib/node_modules/n8n/node_modules/my-packages && \
    chown -R node:node /usr/local/lib/node_modules/n8n/node_modules/my-packages

# nodeユーザーに切り替えてから、package.jsonとnpm installを実行
USER node
WORKDIR /usr/local/lib/node_modules/n8n/node_modules/my-packages
COPY package.json .
RUN npm install

# 実行ユーザーをn8nのデフォルトであるnodeに戻す
USER node

# n8nの作業ディレクトリに戻る
WORKDIR /home/node
