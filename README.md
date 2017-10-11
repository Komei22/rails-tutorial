# Ruby on Rails チュートリアルのサンプルアプリケーション

これは、次の教材で作られたサンプルアプリケーションです。   
[*Ruby on Rails チュートリアル: 実例を使って Rails を学ぼう*](http://railstutorial.jp/)
[Michael Hartl](http://www.michaelhartl.com/) 著

## ライセンス

[Ruby on Rails チュートリアル](http://railstutorial.jp/)内にあるすべてのソースコードは
MIT ライセンスと Beerware ライセンスのもとに公開されています。
詳細は [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる Ruby Gems をインストールします。

```
$ bundle install --without production
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

詳しくは、[*Ruby on Rails チュートリアル*](http://railstutorial.jp/)を参考にしてください。

## アプリケーションのデプロイ


### 環境設定

本番環境にデプロイする際の設定ファイルは`config/deploy/production.rb`にあり、現状は以下のようなっています。



```
$ server "deploy.example.com", user: "deploy", roles: %w{web}
```

- server:デプロイ先のサーバのホスト名
- user:実行ユーザ
- roles:サーバの役割

Capistranoはssh接続を使ってデプロイ先のサーバに接続して、デプロイを実行します。
したがって、ここで仮に`deploy.example.com`を指定してデプロイする場合は`~/.ssh/config`内の以下の設定を記述して名前解決できるように対応して下さい。

```
Host exmaple.xyz
  HostName 192.168.0.1
  User deploy
```

したがって、デプロイ先を変更する場合は`production.rb`を適宜環境に合わせて編集するようにして下さい。

### デプロイ実行

以下のコマンドを実行して下さい。

```
$ bundle exec cap production deploy
```
