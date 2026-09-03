# WHO-GWG curves 
# Calculation of z scores and percentiles from the SST distribution
# Thais R B Carrilho, Sept 01 2026


# Reference for the curves: WHO-GWG_reftable.csv


# Necessary packages:
library(gamlss)
library(foreign)
library(dplyr)


# Reading the reference table: 
reftable=read.csv('WHO-GWG_reftable.csv')
head(reftable)
tail(reftable)


# Please note the names of the variables in the ref table: 
names(reftable)
# "bmicat" "gawk" "mu" "sigma" "nu" "tau"  

# Please note the names of the BMI categories in the ref table:
table(reftable$bmicat)
# underweight, normalweight, overweight, obesity, obesityclassI, obesityclassII, obesityclassIII 


# Function to calculate z scores and percentiles using the SST distribution:
get_zscore_SST <- function(gwg, gawk, bmicat, moments_table) {
  
    moments <- moments_table[moments_table$gawk==gawk & 
                             moments_table$bmicat==bmicat,]
  
  # Get CDF probability and convert to Z-score
  p <- pSST(q = gwg, 
            mu = moments$mu, 
            sigma = moments$sigma, 
            nu = moments$nu, 
            tau = moments$tau)
  
  return(round(qnorm(p), 4))
}



# Calculating exact z scores and percentiles: 



######## For an individual: 

# Example 1: Underweight, GWG = 8.0kg at 28 weeks:
zscore <- get_zscore_SST(gwg=8.0, gawk=28, bmicat="underweight", 
                         moments_table=reftable)
percentile <- round(pnorm(zscore)*100, digits = 2)

# Results: 
zscore
percentile


# Example 2: Normal weight, GWG = 12.5kg at 40 weeks: 
zscore <- get_zscore_SST(gwg=12.5, gawk=40, bmicat="normalweight", 
                    moments_table=reftable)
percentile <- round(pnorm(zscore)*100, digits = 2)

# Results: 
zscore
percentile


# Example 3: Overweight, GWG = 10.0kg at 16 weeks: 
zscore <- get_zscore_SST(gwg=10.0, gawk=16, bmicat="overweight", 
                         moments_table=reftable)
percentile <- round(pnorm(zscore)*100, digits = 2)

# Results: 
zscore
percentile


# Example 4: Obesity, GWG = 5.0kg at 40 weeks:
zscore <- get_zscore_SST(gwg=5.0, gawk=40, bmicat="obesity", 
                         moments_table=reftable)
percentile <- round(pnorm(zscore)*100, digits = 2)

# Results: 
zscore
percentile


# Example 5: Obesity class I, GWG = 9.0kg at 40 weeks:
zscore <- get_zscore_SST(gwg=9.0, gawk=40, bmicat="obesityclassI", 
                         moments_table=reftable)
percentile <- round(pnorm(zscore)*100, digits = 2)

# Results: 
zscore
percentile


# Example 6: Obesity class II, GWG = 7.2kg at 36 weeks: 
zscore <- get_zscore_SST(gwg=7.2, gawk=36, bmicat="obesityclassII", 
                         moments_table=reftable)
percentile <- round(pnorm(zscore)*100, digits = 2)

# Results: 
zscore
percentile


# Example 7: Obesity class III, GWG = -1.0 at 20 weeks:
zscore <- get_zscore_SST(gwg=-1.0, gawk=20, bmicat="obesityclassIII", 
                         moments_table=reftable)
percentile <- round(pnorm(zscore)*100, digits = 2)

# Results: 
zscore
percentile





######## For a dataset:


# Creating a fake dataset (8 lines only) to test the functions:
bmicat = c("normalweight","overweight","underweight","normalweight","normalweight","obesity","underweight","overweight")
ga = c(10.86, 20.00, 12.86, 28.43, 34.00, 37.00, 41.00, 36.00)
gwg = c(5.0, 7.5, 1.0, -4.0, 15.0, 6.4, 3.2, 20.0)

df=data.frame(cbind(bmicat,ga,gwg))
str(df)
df$ga=as.numeric(df$ga)
df$gwg=as.numeric(df$gwg)


# Round the gestational age variable: 
df$gawkr <- round(df$ga)
df


# Applying the function: (adapt names to match YOUR dataset)
df$zscores <- mapply(get_zscore_SST, 
                        gwg = df$gwg, 
                        gawk = df$gawkr, 
                        bmicat = df$bmicat, 
                        MoreArgs = list(moments_table = reftable))

df

df$zscores <- round(as.numeric(df$zscores), digits=2)
df$percentiles <- round(pnorm(df$zscores)*100, digits=2)

df


# END 