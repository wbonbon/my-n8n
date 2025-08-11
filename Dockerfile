FROM n8nio/n8n:latest

# ビルドの前にキャッシュをクリアする
RUN npm cache clean --force

# npm ciでクリーンにインストール
RUN npm ci --prefix /usr/local/lib/node_modules/n8n/node_modules \
    && npm install iconv-lite jschardet --prefix /usr/local/lib/node_modules/n8n/node_modules
    
