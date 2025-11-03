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
# /var/www/htmlをドキュメントルートとして使用（デフォルト設定）
WORKDIR /var/www/html

# 3. Apacheの設定を変更してpublicディレクトリをドキュメントルートに設定
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# 4. .htaccessファイルを有効にするためAllowOverrideを設定
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# 5. Apacheのmod_rewriteを有効化
RUN a2enmod rewrite

# 6. ポート80はデフォルトで公開されています。
EXPOSE 80