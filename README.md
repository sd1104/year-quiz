## クイズ -90sの思い出-
![スクリーンショット 2020-09-24 23 24 23](https://user-images.githubusercontent.com/67669319/94158276-2e764b80-febd-11ea-91bc-3c99e9f84b1f.png)
お試しは[コチラ](https://yearquiz.herokuapp.com)

## アプリ開発背景
プログラミングの自主学習のために作ったアプリ。
何を勉強するのかを考えるにあたって、求人サイトの使用言語の欄でどの言語がより使われているかを調べた。
結果、AWSとJavascriptが最も多かった。
作者がJavascriptを以前からより深く学習してみたいと考えていたので、Javascript、Vue.jsの勉強とポートフォリオ作りを兼ねて作ろうと考えた。

- 学習したUdemyのコース
  - Vue JS入門決定版！jQueryを使わないWeb開発　ー導入からアプリケーション開発まで体系的に動画で学ぶ
- 参考にしたQiitaの記事
  - LaravelとVue.jsでクイズアプリを作った話 https://qiita.com/kanasann1106/items/c83d52f966020ee3be79
  - Ruby on Rails, Vue.js で始めるモダン WEB アプリケーション入門 https://qiita.com/tatsurou313/items/4f18c0d4d231e2fb55f4

## アプリ紹介
３択クイズアプリです。
1990年代の出来事をクイズにしています。

##### 主な機能
- ３択クイズが出題される。
  - １回の問題数は５問。
  - 毎回ランダムな問題が出題される。
  - ３択の並びも毎回ランダムで表示される。

##### 実装形式
- モバイルでの使用を想定して作った。（モバイル、PC共に表示は可能。）
- 一部CSSをbootstrapを使って実装した。
- SPAとして作った。
- railsでクイズの問題のAPIを作り、vue.jsで呼び出す形で実装した。
- クイズの問題はgem'activeadmin'で管理者画面を使って作成した。

## ローカルでの使用方法
#### 1. Git-Hubからクローンする。
`$ git clone https://github.com/sd1104/year-quiz.git`
#### 2. bundleをインストールする。
`$ bundle install`
#### 3. データベースを作る。
`$ rails db:create`
#### 4. マイグレーションをする。
`$ rails db:migrate`
#### 5. 初期データを入れる。
`$ rails db:seed`
#### 6. ローカルサーバーを起動する。
`$ rails s`
#### 7. ブラウザに表示。
[http://localhost:3000/]をたたく。

## バージョン
ruby 2.6.5
Rails 6.0.3.3
vue 2.6.12
