# README

# MapBlog

## 概要
マップ上にブログが表示されることで、どこでなにが話題になっているか直感的にわかります

## コンセプト
* ブログに位置情報をもたせて、map上に表示
* AjaxによるUI/UXの向上

## バージョン情報
rails 5.2.3
ruby 2.6.3

## 機能一覧
* Google maps JavaScript apiでmap描画
* blogに緯度経度をもたせてmap上に表示
* blogの機能Ajax、homeクリックで一覧画面表示
* blogの機能Ajax、map上をクリックすることで投稿画面表示
* blogの機能Ajax、map上のmarkerをクリックすることで詳細表示
* AWS
* blogの投稿、一覧、詳細、削除機能
* 画像アップロード機能
* devise、ログイン機能
* お気に入り機能
* フォロー機能
* コメント機能
* メッセージ機能

## カタログ設計
https://docs.google.com/spreadsheets/d/1khQZIqICsbPB3duqLTJevljtIXI39yOozGArGbwpdsQ/edit#gid=1177389026

## テーブル定義
https://docs.google.com/spreadsheets/d/1Of_iDK2ZFj8295rTjh8LTzykmufWKHuNX74Lr8Zc3sQ/edit#gid=0

## 画面遷移図
https://docs.google.com/spreadsheets/d/1w5C-7OxPEM3uRpXwDptjCUOB6eVwJEitEPRWFBxt2gs/edit#gid=0

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1Hqn8RsnYXWPft-tKlVLVLjOAFirNT0bpaYxarlDUNrw/edit#gid=0

## 使用予定Gem
* carrierwave
* mini_magick
* devise
* devise-i18n
* rails_admin
* font-awesome-rails
