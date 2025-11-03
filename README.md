# LAMP Docker Environment

Docker を使用した LAMP（Linux + Apache + MySQL + PHP）開発環境です。

## 構成

- **Web サーバー**: Apache + PHP 8.2
- **データベース**: MySQL 8.0
- **ドキュメントルート**: `./src/public`

## 使い方

### 1. 環境の起動

```bash
docker-compose up -d
```

### 2. アクセス

- **Web サーバー**: http://localhost:8080
- **データベース接続情報**:
  - ホスト: `db`
  - データベース名: `my_database`
  - ユーザー名: `my_user`
  - パスワード: `user_password`

### 3. PHP ファイルの配置

`src/public/` ディレクトリに PHP ファイルを配置してください。

例: `src/public/index.php`
```php
<?php
echo "Hello, LAMP Docker!";
?>
```

### 4. 環境の停止

```bash
docker-compose down
```

### 5. データベースも含めて完全に削除

```bash
docker-compose down -v
```

## ディレクトリ構造

```
.
├── docker-compose.yaml
├── Dockerfile
├── README.md
└── src/
    └── public/          # Web ルート（PHP ファイルを配置）
        └── index.php
```

## 備考

- PHP の拡張機能 `pdo_mysql` がインストール済み
- Apache の `mod_rewrite` が有効
- `.htaccess` ファイルが使用可能
- MySQL のデータは永続化されます