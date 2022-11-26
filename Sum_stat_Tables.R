#ready made Table comparing 2 groups with t test,adding CI,Footnote, adding p value

MERGE %>% select(Dis2_E1_C1,Gender_E1_C1,EDUC_E1_C1,Marital_E1_C1,Marital1_E1_C1, Marital2_E1_C1, Marital3_E1_C1,age) %>%
tbl_summary(digits =all_continuous() ~ 2,by= Dis2_E1_C1,type = all_continuous() ~ "continuous2"
,statistic =list(all_categorical() ~ "{n} ({p}%)",all_continuous() ~ c("{mean} ({sd})","{median} ({p25}, {p75})","{min}, {max}")),
label = list(Gender_E1_C1~"Gender",EDUC_E1_C1~"Education",Marital_E1_C1~"Marital Status",Marital1_E1_C1~"Number of Marital Partners",
Marital2_E1_C1~"Age at first marriage (Years)",Marital3_E1_C1~"Contraception methods used",age~"Age at time of record (years)"),
missing = "no") %>%
add_ci(statistic = list(all_categorical() ~ "{conf.low}%-{conf.high}%",all_continuous()~ "{conf.low}-{conf.high}")) %>%
add_n(statistic = "{n}") %>% add_p(pvalue_fun = ~style_pvalue(.x, digits = 2),test=all_continuous() ~ "t.test")%>%
modify_footnote(
all_stat_cols()~"Median (IQR) or Frequency (%)")

# adding levels to variable and labeling header and column name
Number_by_Relatednes<-Sphinx_filtered %>% select(EgyvacV1_E2_C2,starts_with("RShA"))%>% 
  mutate(across(everything(), ~factor(., levels = c("Yes", "No")))) %>%  
  tbl_summary(missing = "no",by=EgyvacV1_E2_C2,label= RShAE_E15_1_C15
              ~"Number of AEs by Relatedness to vaccine*",type = list(c(RShAE_E15_1_C15,RShAE_E15_2_C15,RShAE_E15_3_C15,RShAE_E15_4_C15) ~ "categorical"))%>%
  add_n()%>% modify_header(
    label = '**Characteristic**',
    stat_1 = '**Low dose**', stat_2 = '**Placebo**')

