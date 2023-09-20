#### MapDamage Analysis ####

#### hs37d5 analysis ####

# set working directory
setwd("C:/Users/sterl/OneDrive/Desktop/microArch/Romanian_Project/Epigenetic_Analysis/hs37d5_MapDamage_results/UPDATED_ANALYSES/MapDamage_RESULTS/")

# load packages
library(ggplot2)
library(plyr)
library(dplyr)
library(data.table)
library(stringr)
library(ggpubr)
library(extrafont)

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

print(plot5)


plot3<- ggplot(df_3, aes(df_3$pos, df_3$X5pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 


print(plot3)


figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

#### rCRS analysis ####

# set working directory
setwd("C:/Users/sterl/OneDrive/Desktop/microArch/Romanian_Project/Epigenetic_Analysis/rCRS_analysis/Files_for_Plots/")

# load packages

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X5pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 


print(plot3)


figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

##### combine lists and export to a csv file #####
combined_lists <- data.frame(List1=df_3, List2=df_5)
write.csv(combined_lists, file = "combined_mapDamage_results", row.names = FALSE)
