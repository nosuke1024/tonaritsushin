# tonaritsushin
■サービス概要
・家族一人一人の携帯電話の使っているキャリア、機種、現在の基本料金がわかるサービス
・世帯の通信費がわかるサービス
・他の世帯の通信費と比較が出来るサービス

■ このサービスへの思い・作りたい理由
一人でも多く携帯電話で無駄に高いお金を支払っているユーザーを減らしたい。特に家族割で縛られているユーザーや、自分の家族や世帯単位で比較がしづらい現状を改善したい。

自分が前職で携帯電話販売の仕事をしていた。
そこではお店に来る必要性の少ない客層でも、携帯電話をただ代えるためだけに来るユーザーも多く、
そのお店での機種変更だと無駄に高い金額を払っているユーザーがいた。
高い金額を払っているユーザーは、複雑な携帯電話会社に対して理解が乏しい方や相場がわかっていない方が多い。そして、「家族割」という制度などから家族の毎月の金額が高くなるから、高い金額のままでいるというユーザーも多く存在している。
また、店頭での機種変更の場合だと、「頭金」「事務手数料」といったオンラインでの購入だと発生しない金額が発生し、その合計の金額は1万～2万機種代金とは別で＋で支払わないといけないものがある。また、更に携帯電話に貼るフィルムの貼り付けやデータ移行にも＋でお金が発生するなど店頭で購入すること自体今の時代にはデメリットが多い状態になっている。

そして一人世帯向けの金額についてはオンライン専用プランの導入もあり、だいぶ現状ネットで比較しやすい現状である。ただ家族割があるなど、して、結局ファミリー層については金額の比較がしづらい現状がある。
なので、家族・世帯にフォーカスをするサービスを通じて、無駄に金額高くないという改善をしたい。


■ ユーザー層について
20代～60代（オンラインショッピングで購入経験がある層）
具体的には
・20代後半～40代のファミリー層
・携帯電話を安くしたいけど、家族割の関係で変えられない層（若年者＋高齢な両親）でまとめている方

■サービスの利用イメージ
・家族（世帯）の携帯電話を把握し、家族間の携帯電話の利用状況を把握すること
・個人より世帯にフォーカスをすることで他サービスとの差別化。

■ ユーザーの獲得について
・初動はコミュニティを使うながら口コミによる拡散を狙う。
・またよくある比較サイトと違い、登録したら一気に該当の会社からの電話がくるサービスとかでないので登録のハードルを下げる。
・それと同時に登録しないと見れないようにする（ゲストログインはなしにする）自分の料金を提示することで見れるようにすることで、料金が変動してく楽しさを提示したい。

■ サービスの差別化ポイント・推しポイント
一人世帯でも使ってもらうようにするが、家族2人以上の世帯を獲得できるようなサービスで、一人としての金額でなく、世帯の通信費を比較できたりするようにしたい。
家族で異なる会社を選んでいる世帯に対しての料金を透明化すること
高齢者の親と合わせて携帯電話の会社を変えれない人でも、家族の料金を知ることで、全員での乗り換えを可能に出来る
単体の料金は比較しやすいサイトが多い現状を、家族間という世帯単位で比較できることでより話に具体性と実現性が高いサービス出来る。
そのうえで、複雑だと思っている携帯電話の代金自体実は段々シンプルになってきている背景があるので、投稿機能で軽く出来る

■ 機能候補
MVPリリース時
・会員登録・ログイン（メールアドレスとPW）
・プロフィール機能（性別と居住地）
・タグ（キャリア、基本料金プランの名前、使っている機種、普段の使い方）
・選択機能（登録する家族の人数）1人～3人以上
・グループ機能（家族の分も登録できる）（家族で共有できる）
（家族割の実態を認識することで、乗り換えに関するデメリットを払拭できるようにしたい）
・毎月の金額を投稿（毎月の世帯の通信費の確認）
・その金額にいいね機能「安い」「高い」「妥当」を押せる機能
・利用規約、プライバシーポリシーは必須

本リリース時
lineの認証、通知
投稿機能の追加
・携帯電話を変えた、会社を変えた、またおすすめの会社の投稿
・お得な情報（セール情報や新しい料金プランのお知らせ）
検索機能
・タグ検索
・フリーワード検索
シェア機能（Xが中心）
プロフィール機能の追加
・固定回線（ネットワーク環境の追加）
・携帯電話だけでなくサブスクの管理も出来るように


■ 機能の実装方針予定
Auth0を導入してセキュアの環境にする
ユーザー登録とグループ機能もRailsで自作実装
投稿機能×タグ機能×はRailsで自作実装


以下

順に追加したい機能
家族内の毎月の金額のグラフ化（家計のサポート要素を増加出来るように）
世帯や毎月のGB別の平均金額ができるようにしたい（自分の金額が平均として高いか安いか一目でできるようにしたい）
サイト内で機種変更も含めてサポートの充実をしたい（毎月の金額の把握→他人の金額を知る→じゃあ変えるお店に来るというユーザーを減らす）
・携帯電話今代えるべきかどうか？
・機種変更と同時にキャリアを代えるべきかどうか？
・あなたの携帯電話はなにを使っている？それはなんで？そしていくらで買った？
・機種変更したあとのデータ移行に関すること（OSが変わってデータ移行失敗した～みたいなつぶやきが残るようにしたい）

家族向けをそのまま小規模法人向けの管理機能の追加
・会社の携帯電話の利用者ー番号ーキャリア（簡単にプラン）ー機種（何か月利用中か）

