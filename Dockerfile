FROM node:18-alpine

WORKDIR /app

# 依存関係のコピーとインストール
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install

# ソースコードのコピー
COPY . .

# TypeScriptのビルド
RUN pnpm build

# 環境変数の設定
ENV PORT=3333
ENV NODE_ENV=production

# エントリーポイントの設定
ENTRYPOINT ["node", "dist/index.js"] 