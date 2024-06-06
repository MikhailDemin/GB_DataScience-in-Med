install.packages("boot")  #скачивание библиотеки для бутстрэп-анализа
library("boot") #подключение библиотеки

install.packages("bootstrap")  #скачивание библиотеки для jackknife
library("bootstrap") #подключение библиотеки

install.packages("coin") #скачивание библиотеки для перестановочных тестов
library(coin) #подключение библиотеки

library(tidyverse)

# bootstrap ---------------------------------------------------------------

myfn_i <- function(x, i) {return(sum(x[i])/length(x[i]))} #функция для расчета среднего по индексам
myfn_w <- function(x, w) {return(sum(x*w)/length(x))} #функция для расчета среднего с весами
result <- boot(athero_data$Ath_change, myfn_i, R = 999) #бутстрэп-анализ
#myfn — статистика, которую требуется рассчитать при помощи пользовательской функции
#R — число бутстрэп выборок
result #текстовый вывод результатов
plot(result) #визуализация эмпирического распределения 
quantile(result$t, c(0.025, 0.975)) #доверительный интервал для среднеарифметического
mean(athero_data$Ath_change)

result_w <- boot(athero_data$Ath_change, myfn_w, R = 999) #бутстрэп-анализ
#myfn — статистика, которую требуется рассчитать при помощи пользовательской функции
#R — число бутстрэп выборок
result_w #текстовый вывод результатов
plot(result_w) #визуализация эмпирического распределения 
quantile(result_w$t, c(0.025, 0.975)) #доверительный интервал для среднеарифметического

# jackknife ----------------------------------------------------------------

theta <- function(x){mean(x)}

results <- jackknife(athero_data$Ath_change, theta)
results

ggplot(as_tibble(results$jack.values), aes(value)) +
  geom_histogram() +
  geom_vline(xintercept = mean(athero_data$Ath_change), color = 'red3', pty = 1) +
  geom_vline(xintercept = mean(results$jack.values), color = 'purple2', pty = 1) +
  theme_minimal()

hist(results$jack.values)

# permutation -------------------------------------------------------------

athero_data %>% 
  slice_sample(n = 50) %>% 
  coin::normal_test(Ath_change ~ Concl_2, data = ., conf.int = TRUE) 
athero_data %>% 
  slice_sample(n = 50) %>% 
  t.test(Ath_change ~ Concl_2, data = ., conf.int = TRUE)

oneway_test(Ath_change ~ status, athero_data) 
summary(aov(Ath_change ~ status, athero_data))

# difference in means

ac_diffs <- athero_data %>%
  mutate(ln_ac = log(Ath_change)) %>%
  drop_na(ln_ac) %>% 
  group_by(DM) %>%
  summarize(mean_ac = mean(Ath_change), meanln_ac = mean(ln_ac)) %>%
  summarize(diff_ac = diff(mean_ac), diffln_ac = diff(meanln_ac))

reps <- 1000
permdiffs <- c()

for(i in 1:reps) {
  onediff <- athero_data %>%
    mutate(perm_c2 = sample(DM)) %>%
    group_by(perm_c2) %>%
    summarize(mean_AC = mean(Ath_change)) %>%
    summarize(diff(mean_AC)) %>% pull()
  
  permdiffs <- c(permdiffs, onediff)
}


permdiffs %>% data.frame() %>%
  ggplot(aes(x = permdiffs)) + 
  geom_histogram(bins=30) + 
  geom_vline(xintercept = ac_diffs$diff_ac, color = "red")

# ratio of variances
ac_varratio <- athero_data %>%
  group_by(DM) %>%
  summarize(var_AC = var(Ath_change)) %>%
  summarize(AC_ratio = var_AC[1] / var_AC[2])

permvars <- c()

for(i in 1:reps){
  oneratio <- athero_data %>%
    mutate(perm_c2 = sample(DM)) %>%
    group_by(perm_c2) %>%
    summarize(var_AC = var(Ath_change)) %>%
    summarize(var_AC[1] / var_AC[2]) %>% pull()
  
  permvars <- c(permvars, oneratio)
}

permvars %>% data.frame() %>%
  ggplot(aes(x = permvars)) + 
  geom_histogram(bins=30) + 
  geom_vline(xintercept = ac_varratio$AC_ratio , color = "red")


# interpreting

(sum(ac_diffs$diff_ac >= permdiffs) + 1) /1000

#the permutation test (one-sided) for the difference in means 
#will count the number of permuted differences that are less than or equal 
#to the observed difference in means
# 4% here

(sum(ac_varratio$AC_ratio <= permvars)+1)/1000

#the permutation test (one-sided) for the ratio of variances 
#will count the number of permuted ratios that are greater than or equal 
#to the observed ratio of variances
# 22% here