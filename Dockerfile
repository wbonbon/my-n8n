FROM n8nio/n8n:latest

# rootユーザーに切り替えて、すべてのnpmコマンドを実行
USER root

# npmのキャッシュをクリアしてクリーンな環境でインストール
RUN npm cache clean --force

# パッケージをインストール
RUN npm install iconv-lite jschardet --prefix /usr/local/lib/node_modules/n8n/node_modules

# 実行ユーザーをn8nのデフォルトであるnodeに戻す
USER node
