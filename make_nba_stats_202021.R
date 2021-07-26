#必要なライブラリのインポート
library(tidyverse)

#データのインポート。一行目は無視する
data=read_csv("data/nba_stats_202021.csv",skip = 1)

#関心のあるスタッツ（出場時間、得点、リバウンド、アシスト、ターンオーバー）と選手名を取り出す
data=data %>% select(`FULL NAME`,MPG,,`PPGPointsPoints per game.`,`RPGReboundsRebounds per game.`,
                `APGAssistsAssists per game.`,`TOPGTurnoversTurnovers per game.`)

#列名を変更する
data=data %>% rename(Player=`FULL NAME`,
                MIN=MPG,
                PTS=`PPGPointsPoints per game.`,
                TR=`RPGReboundsRebounds per game.`,
                AS=`APGAssistsAssists per game.`,
                TO=`TOPGTurnoversTurnovers per game.`)

#dataをcsvとして書き出す
data %>% write_csv("nba_stats202021.csv")
