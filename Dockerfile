# n8nのベースイメージを使用
FROM n8nio/n8n:latest

# rootユーザーに切り替えて、必要なディレクトリを作成し、権限をnodeユーザーに変更
USER root
# .n8nディレクトリ内にcustom-packagesディレクトリを作成
RUN mkdir -p /home/node/.n8n/custom-packages \
    # 作成したディレクトリの所有者をnodeユーザーに変更
    && chown -R node:node /home/node/.n8n/custom-packages

# npmのインストールをnodeユーザーとして実行するため、ユーザーを切り替える
USER node
# 作成したカスタムパッケージディレクトリに移動
WORKDIR /home/node/.n8n/custom-packages

# 必要なパッケージをインストール
# これにより、パッケージはnodeユーザーの権限で正しくインストールされる
RUN npm install iconv-lite jschardet
