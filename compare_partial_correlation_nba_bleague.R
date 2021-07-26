#�K�v�ȃ��C�u�����̃C���|�[�g
library(tidyverse)
library(ppcor)
library(corrplot)

#�f�[�^�̃C���|�[�g
bleague=read_csv("data/bleague_stats_202021.csv")
nba=read_csv("data/nba_stats202021.csv")

#bleague����K�v�ȗ񂾂��I������
bleague=bleague %>% dplyr::select(Player,MIN,PTS,TR,AS,TO)

#���֍s��̊m�F
#B���[�O202021�V�[�Y���̑��֍s��
bleague %>% dplyr::select(-Player) %>% cor(.) %>% corrplot.mixed(.)

#NBA202021(���M�����[�V�[�Y��)�̑��֍s��
nba %>% dplyr::select(-Player) %>% cor(.) %>% corrplot.mixed(.)

#�o�ꎞ�Ԃ��p�[�V�����A�E�g�����Α��֌W���̎Z�o
#B���[�O����
#���_�ƃ��o�E���h
bleague %>% dplyr::select(MIN,PTS,TR) %>% pcor(.) %>% .$estimate#0.554
#���_�ƃA�V�X�g
bleague %>% dplyr::select(MIN,PTS,AS) %>% pcor(.) %>% .$estimate#-0.247
#���_�ƃ^�[���I�[�o�[
bleague %>% dplyr::select(MIN,PTS,TO) %>% pcor(.) %>% .$estimate#0.339
#���o�E���h�ƃA�V�X�g
bleague %>% dplyr::select(MIN,TR,AS) %>% pcor(.) %>% .$estimate#-0.283
#���o�E���h�ƃ^�[���I�[�o�[
bleague %>% dplyr::select(MIN,TR,TO) %>% pcor(.) %>% .$estimate#0.184
#�A�V�X�g�ƃ^�[���I�[�o�[
bleague %>% dplyr::select(MIN,AS,TO) %>% pcor(.) %>% .$estimate#0.554

#������NBA
#���_�ƃ��o�E���h
nba %>% dplyr::select(MIN,PTS,TR) %>% pcor(.) %>% .$estimate#0.092
#���_�ƃA�V�X�g
nba %>% dplyr::select(MIN,PTS,AS) %>% pcor(.) %>% .$estimate#0.338
#���_�ƃ^�[���I�[�o�[
nba %>% dplyr::select(MIN,PTS,TO) %>% pcor(.) %>% .$estimate#0.487
#���o�E���h�ƃA�V�X�g
nba %>% dplyr::select(MIN,TR,AS) %>% pcor(.) %>% .$estimate#-0.159
#���o�E���h�ƃ^�[���I�[�o�[
nba %>% dplyr::select(MIN,TR,TO) %>% pcor(.) %>% .$estimate#0.114
#�A�V�X�g�ƃ^�[���I�[�o�[
nba %>% dplyr::select(MIN,AS,TO) %>% pcor(.) %>% .$estimate#0.626

#����
#B���[�O�ł͓��_�ƃ��o�E���h�̕Α��֌W����0.554����̂ɑ΂��ANBA�ł�0.092�����Ȃ��B
#�����B���[�O�ł͎�ȓ��_�����O���БI��ŁA�ނ炪�C���T�C�h�ɂ��邽�߂ɁA
#���_�ƃ��o�E���h�����ւ���̂��ƍl������B����ANBA�ł͓��_�����I���
#�|�W�V�������΂���Ă��邽�߁A���_�ƃ��o�E���h�̑��ւ��Ⴂ�̂��ƍl������B
#���l�̂��Ƃ͓��_�ƃA�V�X�g�̕Α��ւɂ��Ă�������̂ł͂Ȃ����낤���B

#���Ԃ�����̓��_�A���o�E���h�A�A�V�X�g�A�^�[���I�[�o�[�̒P�����ւ𒲂ׂ�B
#���Ԃ�����̃X�^�b�c���v�Z���ăf�[�^�Z�b�g�ɉ�����
bleague=bleague %>% mutate(PTS_per_MIN=PTS/MIN,
                   TR_per_MIN=TR/MIN,
                   AS_per_MIN=AS/MIN,
                   TO_per_MIN=TO/MIN)

nba=nba %>% mutate(PTS_per_MIN=PTS/MIN,
                           TR_per_MIN=TR/MIN,
                           AS_per_MIN=AS/MIN,
                           TO_per_MIN=TO/MIN)

#���֍s���`��
#B���[�O����
cor_bleague=bleague %>% dplyr::select(PTS_per_MIN,TR_per_MIN,AS_per_MIN,TO_per_MIN) %>% cor(.,use="pairwise.complete.obs")
cor_bleague
corrplot.mixed(cor_bleague)

#������NBA
cor_nba=nba %>% dplyr::select(PTS_per_MIN,TR_per_MIN,AS_per_MIN,TO_per_MIN) %>% cor(.,use="pairwise.complete.obs")
cor_nba
corrplot.mixed(cor_nba)

#����
#�o�ꎞ�Ԃ��p�[�V�����A�E�g�����Α��֌W���ƌX���Ƃ��Ă͓������ʂ�����ꂽ�B



                                                                 