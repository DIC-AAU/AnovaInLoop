setwd("") # Set directory
dat <- read.csv("Data_anova.csv", header = T)
dat$Line=factor(dat$Line)
dat$Rep=factor(dat$Rep)
sink(file="anovaRes.txt")
for (i in 3:dim(dat)[2]) {
  dat.aov <- aov(dat[,i] ~ Line + Rep, dat)
  print(paste("Results of Annova for", colnames(dat)[i]))
  cat("***********************************************************************")
  cat("\n\n")
  print(dat.aov)
  cat("\n")
  print(summary(dat.aov))
  cat("\n\n")
}
sink()

anovaRes <- readLines("anovaRes.txt")
anovaRes1 <- gsub("\"|\\[1]\\s", "", anovaRes)
anovaRes1 <- anovaRes1[-grep("Call", anovaRes1)]
anovaRes1 <- anovaRes1[-grep("aov\\(", anovaRes1)]
writeLines(anovaRes1, con = "anovaRes.txt")
