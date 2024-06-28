library(tidyverse)
library()

athero_data

dropped_ath_data <- drop_na(athero_data) %>% 
  mutate(bmi_group = factor(case_when(BMI <= 24.5 ~ '1',
                               BMI <= 27.5 ~ '2',
                               BMI <= 32.5 ~ '3',
                               .default = '4')),
         count = sample(x = 1:1200, size  = nrow(dropped_ath_data)))

# logit regression --------------------------------------------------------
dropped_ath_data$ath_suf <- !(dropped_ath_data$status %in% c('LOW', 'DOWN'))
ath_suffering <- glm(ath_suf ~ BMI + Ath_change, dropped_ath_data, family = binomial())

summary(ath_suffering)

plot(ath_suffering)

ath_suffering_nobmi <- glm(ath_suf ~ Ath_change, dropped_ath_data, family = binomial())

summary(ath_suffering_nobmi)

# poisson regression ------------------------------------------------------

dropped_ath_data %>%
  group_by(bmi_group) %>%
  summarise (mean_count = mean(count))

ggplot(dropped_ath_data, aes(count, fill = bmi_group)) +
  geom_histogram(binwidth = 100, position = "dodge") 

model <- glm(count ~ bmi_group + Smoking, family = "poisson" , 
             data = dropped_ath_data)

#view model output
summary(model)

plot(model)

pchisq(91651, 373, lower.tail = FALSE)
# so what? Is it ok?

#let's predict
dropped_ath_data$pbmi <- predict(model, type="response")

ggplot(dropped_ath_data, aes(x = factor(count), y = pbmi, color = Smoking)) +
  geom_line() +
  #geom_point(aes(y = BMI, alpha = .7, position = position_jitter(h = .2))) +
  labs(y = "Expected BMI") 


# mixed effects models ----------------------------------------------------

library(lme4)

data("sleepstudy") # reaction time study with sleep deprivation 

sleepstudy %>%
  ggplot(aes(x = Days, y = Reaction)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = 0:9) +
  facet_wrap(~Subject) +
  theme_minimal()

# first is more general, second is more complex

sleep_lme0 <- lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
sleep_lme1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)  

# predicting

sleepstudy$predicted_by_sleep_lme0 <- predict(sleep_lme0)
sleepstudy$predicted_by_sleep_lme1 <- predict(sleep_lme1)

sleepstudy %>%
  rename(observed_reaction_time = Reaction) %>%
  pivot_longer(cols = c(observed_reaction_time, predicted_by_sleep_lme0, predicted_by_sleep_lme1), names_to = "model", values_to = "Reaction") %>%
  ggplot(aes(x = Days, y = Reaction)) +
  geom_line(aes(colour = model)) +
  #geom_line(aes(y = predicted_by_M1), colour = "orange") + 
  #geom_line(aes(y = predicted_by_M2), colour = "purple") +   
  geom_point(data = sleepstudy, alpha = 0.4) +
  scale_x_continuous(breaks = 0:9) +
  facet_wrap(~Subject) +
  theme_minimal()

# compare models with ANOVA

anova(sleep_lme0, sleep_lme1)
