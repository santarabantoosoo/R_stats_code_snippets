#Drawing pie chart
pie_Data <- MERGE %>% select(Dis2_E1_C1,Gender_E1_C1)%>% group_by(Dis2_E1_C1)%>% 
  dplyr::summarise(count=n()) %>%  ungroup() %>% 
  mutate(perc = count / sum(count)) %>% 
  arrange(perc) %>%
  mutate(labels = scales::percent(perc)) %>%
  ggplot(pie_Data,mapping= aes(x = "", y = perc, fill = Dis2_E1_C1)) +
  geom_col(color = "black") +
  geom_label(mapping = aes(label = labels), color = "black",
             position = position_stack(vjust = 0.5),
             show.legend = FALSE)+
  guides(fill = guide_legend(title = "Prevelance of Genital Warts")) +
  scale_fill_brewer("Blues") +
  coord_polar(theta = "y") + 
  theme_void()+
  theme(axis.text.x=element_blank())


#box plot with mean,legend,reordering and labeling x and y
plot_EDSS <- ggplot(EDSS_molten, aes(x=month, y=EDSS_score)) +
geom_boxplot(width=0.4 ,fill="#666666",colour="black",outlier.shape = 16,outlier.color = "black",show.legend = NA,varwidth = T) 
+stat_summary(fun=mean, geom="point", shape=19, size=2, color="black")+
scale_x_discrete(limits=c("Baseline", "3 month", "6 month"))+xlab("Data collection time point") +ylab("EDSS Score") +
geom_line(data = EDSS_molten_mean, mapping = aes(x = month, y = average_EDSS,group=1))+theme_classic()+
theme(text=element_text(size=12,  family="Times"))+ theme(plot.margin = margin(1,0.8,1,0.8, "cm"),plot.background = element_rect(fill = "white"))