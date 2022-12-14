rm(list = ls())

library("rvest")
library("pacman")
p_load(rio, # import/export data
       tidyverse, # tidy-data
       skimr, # summary data
       caret) # Classification And REgression Training
#1

#a
# Loop para descargar las bases de datos
urlbase <- paste0("https://ignaciomsarmiento.github.io/GEIH2018_sample/pages/geih_page_",
                 1:10, ".html")

df <- data.frame()

for (url in urlbase) {
  print(url)
  temp <- read_html(url) %>% 
    html_table()
  temp <- as.data.frame(temp[[1]])
  df <- rbind(df, temp)
}

#descriptivas
skim(df) %>% head()

#b

#restringir la muestra a mayores de 18
df <- df[ which(df$age>=18), ]

names(df)

# Seleccionamos y_total_m por no tener NAs
# Estad?sticas Descriptivas
summary(df$y_total_m)

#2
urlbase <- paste0("https://ignaciomsarmiento.github.io/GEIH2018_sample/pages/geih_page_",
                  1:10, ".html")


#restringir la muestra a mayores de 18
df <- df[ which(df$age>=18), ]

#2
summary (df$y_salary_m)
summary (df$age)

df<-df [,-1]
mod <- lm(y_salary_m ~ age + I(age^2), df)
summary(mod)

#3
#a)
df = mutate(.data = df , female = ifelse(test = sex == 0, yes = 1, no = 0))
mod3 <- lm(I(log(y_total_m)) ~ female, df)
summary(mod3)
#b)


require("tidyverse")
set.seed(1234)
n<-length(data_frame(y_total_m))
R<-1000
ee_c1<-rep(0,R)
ee_c2<-rep(0,R)
ecof_1<-rep(0,R)
ecof_2<-rep(0,R)
for (i in 1:R)
{ea_sample<-sample_frac(data_frame,size=1,replace = TRUE)}
modelEA1<-lm(y_total_m~age + age^2,ea_sample)
coefs<-modelEA1$coefficients
ees<-summary(modelEA1)$coefficient{,2}

  



  
  
}

#4


