#�K�v�ȃ��C�u�����̃C���|�[�g
library(tidyverse)

#�f�[�^�̃C���|�[�g�B��s�ڂ͖�������
data=read_csv("data/nba_stats_202021.csv",skip = 1)

#�֐S�̂���X�^�b�c�i�o�ꎞ�ԁA���_�A���o�E���h�A�A�V�X�g�A�^�[���I�[�o�[�j�ƑI�薼�����o��
data=data %>% select(`FULL NAME`,MPG,,`PPGPointsPoints per game.`,`RPGReboundsRebounds per game.`,
                `APGAssistsAssists per game.`,`TOPGTurnoversTurnovers per game.`)

#�񖼂�ύX����
data=data %>% rename(Player=`FULL NAME`,
                MIN=MPG,
                PTS=`PPGPointsPoints per game.`,
                TR=`RPGReboundsRebounds per game.`,
                AS=`APGAssistsAssists per game.`,
                TO=`TOPGTurnoversTurnovers per game.`)

#data��csv�Ƃ��ď����o��
data %>% write_csv("nba_stats202021.csv")