FROM n8nio/n8n:latest

# パッケージをインストールするためのディレクトリとユーザーを設定
USER root
WORKDIR /usr/local/lib/node_modules/n8n/node_modules/
# 依存関係をインストールするスクリプトを定義
COPY ./install-packages.sh .
# スクリプトに実行権限を付与
RUN chmod +x install-packages.sh

# 実行ユーザーをnodeに戻す
USER node
WORKDIR /home/node

# n8nの起動コマンドを上書きし、スクリプトを実行してからn8nを起動
CMD ["/usr/local/lib/node_modules/n8n/node_modules/install-packages.sh", "&&", "n8n"]
