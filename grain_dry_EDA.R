read_grain<-read_csv("2009_grain-and-moisture-weights.csv")

grain<-read_grain


  ggplot(aes(x=DW, y=GDUKG))+
  geom_point()

ggplot(grain, aes(x=DW, y=MW))+
  geom_point()

group_by(grain, ID, Sample)%>%
  summarise(mean_GDUKG = mean(GDUKG, na.rm=TRUE))%>%
  ungroup()%>%
ggplot(aes(x=as.factor(Sample), y=mean_GDUKG))+
  geom_point()+
  facet_wrap(~ID)  

group_by(grain, ID, Sample)%>%
  summarise(mean_DW = mean(DW, na.rm=TRUE), stderr_DW = stderr(DW, na.rm=TRUE))%>%
  ungroup()%>%
  ggplot(aes(x=as.factor(Sample), y=mean_DW))+
  geom_point()+
  facet_wrap(~ID)
  