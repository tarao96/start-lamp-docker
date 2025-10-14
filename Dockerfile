# ベースイメージとして公式のPHPとApacheの連携イメージを使用
FROM php:8.2-apache

# 1. 必要なPHP拡張機能やツールをインストール
# Dockerの公式PHPイメージには、拡張機能を簡単にインストールするためのdocker-php-ext-installコマンドがあります。
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libzip-dev \
    libpq-dev \
    unzip \
    wget \
    curl \
    vim-tiny \
    && docker-php-ext-install pdo_mysql \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Webコンテンツのディレクトリ設定
# 公式イメージは/var/www/htmlがデフォルトです。
WORKDIR /var/www/html

# 3. Apacheのmod_rewriteを有効化
RUN a2enmod rewrite

# 4. ポート80はデフォルトで公開されています。
EXPOSE 80