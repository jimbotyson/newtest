read.csv("http://www.ucl.ac.uk/~ccaajim/results.csv")
png(file = "avg.png", bg = "transparent")
with(resdf, hist((maths+english+history)/3))
dev.off()