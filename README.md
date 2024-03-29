# BリーグとNBAでは得点・アシスト・リバウンドの相関は異なるか？

日本のプロバスケットボールリーグBリーグのトップリーグB1では、得点源の選手がインサイドに集中しているという特徴があります。一方、アメリカのプロバスケットボールリーグNBAでは、
Bリーグほど得点源の選手がインサイドに集中しているわけではありません。

出場時間をパーシャルアウトした偏相関係数を使った分析([偏相関係数を使って出場時間の影響を取り除いたスタッツ同士の関係を調べる](https://rnsr0371.boy.jp/2021/07/23/partial_correlation/))では、
Bリーグでは得点とリバウンドには正の偏相関関係が見られ、得点とアシストにはほとんど偏相関関係が見られない、という結果が得られています。

これがBリーグの得点源がインサイドに集中しているために得られた結果なのではないか？　という仮説を検討するために、NBAとの比較を行いました。
その記事が[こちら](https://rnsr0371.boy.jp/2021/07/26/compare_partial_correlation_nba_bleague/)です。

分析の結果、BリーグではNBAと比べて、得点とリバウンドに強い正の相関関係が見られた一方、得点とアシストには弱い相関しか見られなかった結果が得られました。この結果は、BリーグではNBAと比べて得点源が
インサイドの選手に集中していることと矛盾しない結果だと言えます。

## ファイルの説明

- compare_partial_correlation_nba_bleague.R
分析に使ったコードです。

- compare_partial_correlation_nba_bleague.Rmd
分析を元に書いたレポートです。

- compare_partial_correlation_nba_bleague.html
マークダウン書式で書かれたレポートです。

- make_nba_stats_202021.R
ダウンロードしたNBAのスタッツ(data/nba_stas_202021_raw.csv)を加工してnba_stats202021.csvを作成するために使ったコードです。

- data

  - bleague_stats_202021.csv
  B1 2020-21シーズンの個人スタッツです。
  
  - nba_stats_202021_raw.csv
  NBA 2020-21レギュラーシーズンの個人スタッツの生データです。
  
  - nba_stats_202021.csv
  上記のNBAの個人スタッツを分析用に加工したものです。必要な列を上記の.csvファイルから抽出した上で、列名を変更したものです。
  
- figure
レポートに掲載した図たちです。

