# loading libraries -------------------------------------------------------
library(lubridate)
library(tidyverse)
library(survival)
library(ggsurvfit)
library(gtsummary)
library(tidycmprsk)
#devtools::install_github("zabore/condsurv") # author package 
library(condsurv)

# loading and looking into dataset ---------------------------------------------------------

lung # let's explore built-in dataset in package {survival}

# recoding status to conventional
lung <- 
  lung %>% 
  as_tibble() %>% 
  mutate(status = recode(status, `1` = 0, `2` = 1))

lung # check again

lung_df <- lung %>% select(time, status)

lung_df %>% 
  tbl_summary(statistic = status ~ "{n} / {N}") %>% 
  add_stat_label() %>% 
  bold_labels()

# calculating survival times with {lubridate} ---------------------------------------------

### THIS IS DEMO AS lung DATASET HAS PRECALCULATED SURVIVAL TIMES
### YOU MOSTLY WON'T HAVE PRECALCULATED TIMES IN YOR DATASET
### BE SURE TO FORMAT PROPERLY

date_ex <- tibble(sx_date = c("2007-06-22", "2004-02-13", "2010-10-27"),
                  last_fup_date = c("2017-04-15", "2018-07-04", "2016-10-31"))

date_ex # check format

date_ex <- date_ex %>% 
  mutate(sx_date = ymd(sx_date),
         last_fup_date = ymd(last_fup_date))

date_ex # check again

date_ex <- date_ex %>% 
  mutate(os_yrs = as.duration(sx_date %--% last_fup_date) / dyears(1))
### NB: as.duration %--% gives out a number of seconds

date_ex # yay finished

# Creating survival objects and curves ------------------------------------

Surv(lung$time, lung$status)[1:10]

s1 <- survfit(Surv(time, status) ~ 1, data = lung)
str(s1)

# Kaplan-Meier plots ------------------------------------------------------

survfit2(Surv(time, status) ~ 1, data = lung) %>% 
  ggsurvfit() +
  labs(
    x = "Days",
    y = "Overall survival probability"
  ) + 
  add_confidence_interval() +
  add_risktable()

# estimate x-year survival

summary(s1, times = 365.25)

s1 %>% 
  ggsurvfit() +
  labs(
    x = "Days",
    y = "Overall survival probability"
  ) + 
  add_confidence_interval() +
  add_risktable()

s1 %>% 
  tbl_survfit(
    times = 365.25,
    label_header = "**1-year survival (95% CI)**")

# median survival time
s1 %>% 
  ggsurvfit() +
  labs(
    x = "Days",
    y = "Overall survival probability"
  ) + 
  add_confidence_interval() +
  add_risktable()

lung %>% 
  filter(status == 1) %>% 
  summarize(median_surv = median(time))

s1 %>% 
  tbl_survfit(
    probs = 0.5,
    label_header = "**Median survival (95% CI)**")

# log rank test -----------------------------------------------------------

# simulating data
dat <- tibble(
  group = c(rep(1, 6), rep(2, 6)),
  time = c(4.1, 7.8, 10, 10, 12.3, 17.2, 9.7, 10, 11.1, 13.1, 19.7, 24.1),
  event = c(1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0))

# survdiff - function for comparison
survdiff(Surv(time, event) ~ group,
         data = dat)

# or with ggplot function
fit <- survfit(Surv(time, event) ~ group, data = dat)

survminer::ggsurvplot(fit,
           pval = TRUE,
           pval.method = TRUE)

# on our lung dataset
survdiff(Surv(time, status) ~ sex, data = lung)

fit_lung <- survfit(Surv(time, status) ~ sex, data = lung)

survminer::ggsurvplot(fit_lung,
           pval = TRUE,
           pval.method = TRUE)

# plot cumulative events
survminer::ggsurvplot(fit_lung,
                      conf.int = TRUE,
                      risk.table.col = "strata", # Change risk table color by groups
                      ggtheme = theme_bw(), # Change ggplot2 theme
                      palette = c("#E7B800", "#2E9FDF"),
                      fun = "event")

# and cumulative hazard
survminer::ggsurvplot(fit_lung,
           conf.int = TRUE,
           risk.table.col = "strata", # Change risk table color by groups
           ggtheme = theme_bw(), # Change ggplot2 theme
           palette = c("#E7B800", "#2E9FDF"),
           fun = "cumhaz")

'''
survminer::ggsurvplot(
  fit,                     # survfit object with calculated statistics.
  pval = TRUE,             # show p-value of log-rank test.
  conf.int = TRUE,         # show confidence intervals for 
  # point estimaes of survival curves.
  conf.int.style = "step",  # customize style of confidence intervals
  xlab = "Time in days",   # customize X axis label.
  break.time.by = 200,     # break X axis in time intervals by 200.
  ggtheme = theme_light(), # customize plot and risk table with a theme.
  risk.table = "abs_pct",  # absolute number and percentage at risk.
  risk.table.y.text.col = T,# colour risk table text annotations.
  risk.table.y.text = FALSE,# show bars instead of names in text annotations
  # in legend of risk table.
  ncensor.plot = TRUE,      # plot the number of censored subjects at time t
  surv.median.line = "hv",  # add the median survival pointer.
  legend.labs = 
    c("Male", "Female"),    # change legend labels.
  palette = 
    c("#E7B800", "#2E9FDF") # custom color palettes.
)
'''

# and on bigger dataset
library(KMsurv)

# load data
data(burn)

# preview data
head(burn)

# fit
fit <- survfit(Surv(T3, D3) ~ Z1, data = burn)

# plot with log-rank test
survminer::ggsurvplot(fit,
           pval = TRUE,
           pval.method = TRUE)