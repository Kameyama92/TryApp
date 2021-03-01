
# TryApp（オリジナル作成アプリ）

**画面遷移図**
  
![画面遷移図](https://user-images.githubusercontent.com/77086536/109451271-69923180-7a90-11eb-900d-c8d1dcaa706d.gif)

このアプリケーションはトレーニングをサポートする目的で作成しました

# DEMO

<img src="" width="200px">

アプリケーションの説明
**イントロダクション**
  
<img src="https://user-images.githubusercontent.com/77086536/109451910-ed98e900-7a91-11eb-826f-eb88374464b2.gif" width="200px">
  
    
一番最初にアプリを起動した時のみ表示されるページ。
  
１つのviewの中にスライドというpodを組み込んで同じ大きさのページをearth文を使い５回繰り返しています。
  
この５枚のページの言葉はそれぞれ担当が決まっています。

アプリを始めるユーザーの目線にたち、ワクワクした気分で。
  
新しいスタートをこの画面と共に。

  
**ログイン画面**
  
<img src="https://user-images.githubusercontent.com/77086536/109451942-fa1d4180-7a91-11eb-959d-44a1e58af6e3.gif" width="200px">
  
  
名前でログインする方法を採用しています。

ログイン時に身長も入力させ、ユーザーネームと身長を紐つけてデータベースに保存させます。

どのように使用していくのかはこの後説明します。



入力が完了したら新たな第一歩が始まります。
さあ、始めましょう

  
**メイン画面（グラフ表示）**
  
  <img src="https://user-images.githubusercontent.com/77086536/109452381-f8a04900-7a92-11eb-987b-26240560e610.gif" width="200px">
    
  イントロダクションに記載の
    
  「このアプリはあなたの成長をサポートします」の担当
  
  グラフは月毎で集計し、入力するたびに変化を一目で確認できるようにしました
  
  ちなみに上の王冠マークをタッチするとある仕掛けを用意しています。
  
  記録しましょう。このアプリはあなたの味方です。
    
      
**ランキング表示**
  
  <img src="https://user-images.githubusercontent.com/77086536/109452384-f938df80-7a92-11eb-820d-6f5349dcabbc.gif" width="200px">
    

先程のある仕掛けを用意したという項目です。


王冠をタッチするとこのランキング画面に遷移します。

体重の増減を友人同士で確認させます

自分の体重の増減を強制的に公開させることにより、モチベーションのアップを目的としています。

自分は青のマーカーでわかりやすく条件分岐させ、上位を目指しましょう。

あなたの味方は頑張っている周りのみんなです。

  
    
**記録画面**
  
  
  <img src="https://user-images.githubusercontent.com/77086536/109453577-ccd29280-7a95-11eb-83e2-c4fb95e23f0b.gif" width="200px">
    
  記録画面です。今日の成果を記入しましょう。
  計算式で、自分の適正体重を表示させています

  ここはあえて過去の体重は入力させないように設定し、過去を書き換えたりできません
  正々堂々とトレーニングをしましょう

  その日の体重は入力ミスなど防止のため、記入したものは上書きできるようになっています。



**変更画面**
  
  
  <img src="https://user-images.githubusercontent.com/77086536/109453934-8a5d8580-7a96-11eb-9154-33ae35334445.gif" width="200px">
  
  先程の適正体重は身長によって計算されています。

  身長は伸びる可能性も考え、変更画面を用意しました。

  目標体重記入の項目を用意させ、目標を明確化させます。


**チャットルーム**
  
  
  <img src="https://user-images.githubusercontent.com/77086536/109453578-ce9c5600-7a95-11eb-8475-651762c6a064.gif" width="200px">
  
  メイン機能の一つです

  イントロダクションの
  「どこにいても繋がっています」というセリフを担当しています。
  励まし合い助け合うスペース。

  つぶやきを共有しましょう

  もちろんデータベースに保存させますので残ります。

  ほら、どこにいても繋がってる
  
  **アウトプット画面**
    
    
<img src="https://user-images.githubusercontent.com/77086536/109453579-cf34ec80-7a95-11eb-8332-1c0065fada9f.gif" width="200px">
  

<img src="https://user-images.githubusercontent.com/77086536/109454113-e88a6880-7a96-11eb-9119-74e54e154841.gif" width="200px">
  
  
<img src="https://user-images.githubusercontent.com/77086536/109454117-ea542c00-7a96-11eb-85d7-201e27d20e8f.gif" width="200px">
  
  
  アウトプット画面です。
  イントロページの「一人では超えれない壁も君とであれば」を担当しています。
  価値のある情報は共有しましょう。頑張る仲間があなたを必要としています。
  投稿にはいいねとコメントもできます。

**２回目以降のログイン画面**
  
  

<img src="https://user-images.githubusercontent.com/77086536/109454119-ec1def80-7a96-11eb-822b-7833d3341028.gif" width="200px">
  
  
  一度ログインをしたら再度ログインをする必要はありません。

  「never give up」という文字と、美しい動画を組み込んだ背景により、何度も開きたくなるようなアプリを実現しました。

  あなたの成果発表を楽しみにしているアプリが待ってますよ
  そう、ポケットの中でもね











# Features

"hoge"のセールスポイントや差別化などを説明する

# Requirement

"hoge"を動かすのに必要なライブラリなどを列挙する

* huga 3.5.2
* hogehuga 1.0.2

# Installation

Requirementで列挙したライブラリなどのインストール方法を説明する

```bash
pip install huga_package
```

# Usage

DEMOの実行方法など、"hoge"の基本的な使い方を説明する

```bash
git clone https://github.com/hoge/~
cd examples
python demo.py
```

# Note

注意点などがあれば書く

# Author

作成情報を列挙する

* 作成者
* 所属
* E-mail

# License
ライセンスを明示する

"hoge" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

社内向けなら社外秘であることを明示してる

"hoge" is Confidential.
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
# Name（リポジトリ/プロジェクト/OSSなどの名前）
 
分かりやすくてカッコイイ名前をつける（今回は"hoge"という名前をつける）
 
"hoge"が何かを簡潔に紹介する
 
# DEMO
 
"hoge"の魅力が直感的に伝えわるデモ動画や図解を載せる
 
# Features
 
"hoge"のセールスポイントや差別化などを説明する
 
# Requirement
 
"hoge"を動かすのに必要なライブラリなどを列挙する
 
* huga 3.5.2
* hogehuga 1.0.2
 
# Installation
 
Requirementで列挙したライブラリなどのインストール方法を説明する
 
```bash
pip install huga_package
```
 
# Usage
 
DEMOの実行方法など、"hoge"の基本的な使い方を説明する
 
```bash
git clone https://github.com/hoge/~
cd examples
python demo.py
```
 
# Note
 
注意点などがあれば書く
 
# Author
 
作成情報を列挙する
 
* 作成者
* 所属
* E-mail
 
# License
ライセンスを明示する
 
"hoge" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
 
社内向けなら社外秘であることを明示してる
 
"hoge" is Confidential.
