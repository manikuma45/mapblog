# README

# MapBlog

## 概要
従来のSNSでは投稿が時系列に並ぶので、どこで話題になっているかが直感的にわかりませんでした。
<br>
MapBlogではマップ上にブログが表示されることで、どこでなにが話題になっているかが、ひと目ですぐにわかります。

## コンセプト
* ブログに位置情報をもたせて、map上に表示します
* AjaxによるUI/UXの向上

## URL
https://mapblog.net

## バージョン情報、使用技術
* ruby 2.6.3
* rails 5.2.3
* PostogreSQL
* Google Maps JavaScript API
* geolocation API
* Nginx, unicorn
* AWS (EC2, S3, VPC, Route53, ACM)
* Capistrano
* RSpec
* JavaScript, JQuery
* Bootstrap 3

## 機能一覧
* Google maps JavaScript apiを使用してmapを描画
* blogに緯度経度をもたせてmap上に表示
* blog機能(一覧、詳細、投稿)をmapと連動(Ajax)
* blogのCRUD機能
* 画像アップロード機能(S3を使用)
* ユーザー登録・ログイン機能（deviseを使用）
* いいね機能（Ajax）
* フォロー・フォロワー機能（Ajax）
* blogに対してコメント機能（Ajax）

## カタログ設計
https://docs.google.com/spreadsheets/d/1khQZIqICsbPB3duqLTJevljtIXI39yOozGArGbwpdsQ/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1Of_iDK2ZFj8295rTjh8LTzykmufWKHuNX74Lr8Zc3sQ/edit?usp=sharing

## 画面遷移図
https://docs.google.com/spreadsheets/d/1w5C-7OxPEM3uRpXwDptjCUOB6eVwJEitEPRWFBxt2gs/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1Hqn8RsnYXWPft-tKlVLVLjOAFirNT0bpaYxarlDUNrw/edit?usp=sharing

## 主な使用Gem
* carrierwave
* mini_magick
* devise
* devise-i18n
* font-awesome-rails
* faker

* fog-aws
* unicorn
* capistrano

* rspec-rails
* capybara