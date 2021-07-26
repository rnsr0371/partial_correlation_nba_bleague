#必要なライブラリのインポート
library(tidyverse)
library(ppcor)
library(corrplot)

#データのインポート
bleague=read_csv("data/bleague_stats_202021.csv")
nba=read_csv("data/nba_stats202021.csv")

#bleagueから必要な列だけ選択する
bleague=bleague %>% dplyr::select(Player,MIN,PTS,TR,AS,TO)

#相関行列の確認
#Bリーグ202021シーズンの相関行列
bleague %>% dplyr::select(-Player) %>% cor(.) %>% corrplot.mixed(.)

#NBA202021(レギュラーシーズン)の相関行列
nba %>% dplyr::select(-Player) %>% cor(.) %>% corrplot.mixed(.)

#出場時間をパーシャルアウトした偏相関係数の算出
#Bリーグから
#得点とリバウンド
bleague %>% dplyr::select(MIN,PTS,TR) %>% pcor(.) %>% .$estimate#0.554
#得点とアシスト
bleague %>% dplyr::select(MIN,PTS,AS) %>% pcor(.) %>% .$estimate#-0.247
#得点とターンオーバー
bleague %>% dplyr::select(MIN,PTS,TO) %>% pcor(.) %>% .$estimate#0.339
#リバウンドとアシスト
bleague %>% dplyr::select(MIN,TR,AS) %>% pcor(.) %>% .$estimate#-0.283
#リバウンドとターンオーバー
bleague %>% dplyr::select(MIN,TR,TO) %>% pcor(.) %>% .$estimate#0.184
#アシストとターンオーバー
bleague %>% dplyr::select(MIN,AS,TO) %>% pcor(.) %>% .$estimate#0.554

#続いてNBA
#得点とリバウンド
nba %>% dplyr::select(MIN,PTS,TR) %>% pcor(.) %>% .$estimate#0.092
#得点とアシスト
nba %>% dplyr::select(MIN,PTS,AS) %>% pcor(.) %>% .$estimate#0.338
#得点とターンオーバー
nba %>% dplyr::select(MIN,PTS,TO) %>% pcor(.) %>% .$estimate#0.487
#リバウンドとアシスト
nba %>% dplyr::select(MIN,TR,AS) %>% pcor(.) %>% .$estimate#-0.159
#リバウンドとターンオーバー
nba %>% dplyr::select(MIN,TR,TO) %>% pcor(.) %>% .$estimate#0.114
#アシストとターンオーバー
nba %>% dplyr::select(MIN,AS,TO) %>% pcor(.) %>% .$estimate#0.626

#結果
#Bリーグでは得点とリバウンドの偏相関係数が0.554あるのに対し、NBAでは0.092しかない。
#これはBリーグでは主な得点源が外国籍選手で、彼らがインサイドにいるために、
#得点とリバウンドが相関するのだと考えられる。一方、NBAでは得点を取る選手の
#ポジションがばらついているため、得点とリバウンドの相関が低いのだと考えられる。
#同様のことは得点とアシストの偏相関についても言えるのではないだろうか。

#時間あたりの得点、リバウンド、アシスト、ターンオーバーの単純相関を調べる。
#時間あたりのスタッツを計算してデータセットに加える
bleague=bleague %>% mutate(PTS_per_MIN=PTS/MIN,
                   TR_per_MIN=TR/MIN,
                   AS_per_MIN=AS/MIN,
                   TO_per_MIN=TO/MIN)

nba=nba %>% mutate(PTS_per_MIN=PTS/MIN,
                           TR_per_MIN=TR/MIN,
                           AS_per_MIN=AS/MIN,
                           TO_per_MIN=TO/MIN)

#相関行列を描く
#Bリーグから
cor_bleague=bleague %>% dplyr::select(PTS_per_MIN,TR_per_MIN,AS_per_MIN,TO_per_MIN) %>% cor(.,use="pairwise.complete.obs")
cor_bleague
corrplot.mixed(cor_bleague)

#続いてNBA
cor_nba=nba %>% dplyr::select(PTS_per_MIN,TR_per_MIN,AS_per_MIN,TO_per_MIN) %>% cor(.,use="pairwise.complete.obs")
cor_nba
corrplot.mixed(cor_nba)

#結果
#出場時間をパーシャルアウトした偏相関係数と傾向としては同じ結果が得られた。



                                                                 