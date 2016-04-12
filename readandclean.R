# first read the raw data from an online source
resdf <- read.csv("http://ucl.ac.uk/~ccaajim/results.csv", header = TRUE)

# check values of continuous variables are in range dropping any out of range
resdf$maths[resdf$maths > 100 | resdf$maths < 0] <- NA
resdf$english[resdf$english > 100 | resdf$english < 0] <- NA
resdf$history[resdf$history > 100 | resdf$history < 0] <- NA

# create the aggregate score for the exam variables as the mean
resdf$avxm <- round((resdf$maths + resdf$english + resdf$history) / 3)

# change the type of the categoricals to factor
resdf$sex <- factor(resdf$sex, labels = c("girl", "boy"))

resdf$class <- factor(resdf$class)

# create the ordinal variable stream on the basis of avxm
resdf$stream <-
  factor(cut(
    resdf$avxm,
    breaks = c(0, 50, 60, 100),
    labels = c("low", "mid", "high")
  ), ordered = TRUE)

# write this to a csv file locally.  This isn't necessary but it will give us more control when we create the makefile
write.table(resdf, "~/maketest/cleandata.csv", sep = ",")
