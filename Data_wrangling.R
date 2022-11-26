#calculating age in a new column
MERGE <- MERGE %>% add_column(age= interval(MERGE$DOB_E1_C1, MERGE$MRD_E1_C1) %>%
                                as.numeric('years'))

#adding new column with certain interval
library("lubridate")
library("dplyr")
int <- interval(ymd("2017-10-01"), ymd("2019-04-01"))
MERGE <- MERGE %>% add_column(EXC_MRD=ymd(MERGE$MRD_E1_C1) %within% int)


#reordering and labelling categories in "Type" column 
library("forcats")
TTT_Total <-fct_collapse(TTT_Table$Type,
                         candida_antigen= c("candida antigen","candida antigen injection","Candida Antigen injection",
                                            "Injection with candidal antigen"),
                         Cautry = c("Cryocautery","Cryotherapy and electrocautery","electrocautery",
                                    "electrocautery for skin tags","chemical cautery"),
                         Laser_removal= c("laser removal"),Cryotherapy= c("Cryotherapy (freezing off the warts)" , 
                          "Cryotherapy (freezing off the warts),Other"))

#Filtering if a group of columns more than or less than certain value
library("dplyr")
WBC_abnormal<-Sphinx_filtered %>% select(starts_with("WBC"),EgyvacV1_E2_C2)%>%
filter(if_any(everything(), ~ . < 4|.>11.5))

# mutating data based on condition
library("dplyr")
Phyllantex %>% mutate(Cut_off_Alt_Ast = case_when(Lab24V5_E6_C30 < 40 & Lab23V5_E6_C30 < 43 ~ "Achieved" ,TRUE~"Not_Achieved"))



