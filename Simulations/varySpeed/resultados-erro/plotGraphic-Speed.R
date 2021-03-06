r1 <- 1:30

sc250 <- vector()
dr250 <- vector()

sc1000 <- vector()
dr1000 <- vector()

sc2500 <- vector()
dr2500 <- vector()

sc5000 <- vector()
dr5000 <- vector()

sc10000 <- vector()
dr10000 <- vector()

for(i in r1) {

	try(sc250[i] <- read.table(paste(i,"_50_2_erroReconstrucao_SampleCentral.dat",sep=''))[[1]])
	try(dr250[i] <- read.table(paste(i,"_50_2_erroReconstrucao_DropRandom.dat",sep=''))[[1]])

	try(sc1000[i] <- read.table(paste(i,"_50_3_erroReconstrucao_SampleCentral.dat",sep=''))[[1]])
	try(dr1000[i] <- read.table(paste(i,"_50_3_erroReconstrucao_DropRandom.dat",sep=''))[[1]])

	try(sc2500[i] <- read.table(paste(i,"_50_4_erroReconstrucao_SampleCentral.dat",sep=''))[[1]])
	try(dr2500[i] <- read.table(paste(i,"_50_4_erroReconstrucao_DropRandom.dat",sep=''))[[1]])

	try(sc5000[i] <- read.table(paste(i,"_50_5_erroReconstrucao_SampleCentral.dat",sep=''))[[1]])
	try(dr5000[i] <- read.table(paste(i,"_50_5_erroReconstrucao_DropRandom.dat",sep=''))[[1]])

	try(sc10000[i] <- read.table(paste(i,"_50_6_erroReconstrucao_SampleCentral.dat",sep=''))[[1]])
	try(dr10000[i] <- read.table(paste(i,"_50_6_erroReconstrucao_DropRandom.dat",sep=''))[[1]])
}

sc250 <- sc250[!is.na(sc250)]*100
dr250 <- dr250[!is.na(dr250)]*100

sc1000 <- sc1000[!is.na(sc1000)]*100
dr1000 <- dr1000[!is.na(dr1000)]*100

sc2500 <- sc2500[!is.na(sc2500)]*100
dr2500 <- dr2500[!is.na(dr2500)]*100

sc5000 <- sc5000[!is.na(sc5000)]*100
dr5000 <- dr5000[!is.na(dr5000)]*100

sc10000 <- sc10000[!is.na(sc10000)]*100
dr10000 <- dr10000[!is.na(dr10000)]*100

sc250 <- t.test(sc250)
dr250 <- t.test(dr250)

sc1000 <- t.test(sc1000)
dr1000 <- t.test(dr1000)

sc2500 <- t.test(sc2500)
dr2500 <- t.test(dr2500)

sc5000 <- t.test(sc5000)
dr5000 <- t.test(dr5000)

sc10000 <- t.test(sc10000)
dr10000 <- t.test(dr10000)

sc_tt <- rbind(
	c(sc250$conf.int[1], sc250$estimate , sc250$conf.int[2]),
	c(sc1000$conf.int[1], sc1000$estimate , sc1000$conf.int[2]),
	c(sc2500$conf.int[1], sc2500$estimate , sc2500$conf.int[2]),
	c(sc5000$conf.int[1], sc5000$estimate , sc5000$conf.int[2]),
	c(sc10000$conf.int[1], sc10000$estimate , sc10000$conf.int[2])

)

dr_tt <- rbind(
	c(dr250$conf.int[1], dr250$estimate , dr250$conf.int[2]),
	c(dr1000$conf.int[1], dr1000$estimate , dr1000$conf.int[2]),
	c(dr2500$conf.int[1], dr2500$estimate , dr2500$conf.int[2]),
	c(dr5000$conf.int[1], dr5000$estimate , dr5000$conf.int[2]),
	c(dr10000$conf.int[1], dr10000$estimate , dr10000$conf.int[2])
)

comparisonMatrix <- 1-(sc_tt/dr_tt) # How many % sample central is lower than drop random

write.csv(comparisonMatrix, file="Speed-error (Comparison Matrix SC vs DR).csv")


##########################################################################
y_lim <- c(min(7,sc_tt, dr_tt), max(sc_tt, dr_tt,40)) # Obs.: 7 and 40 are a quick fix for normalize the y-range
x <- c(250,500,750,1000,1250)

setEPS()
postscript("graphic_varySpeed.eps")

plot(x, sc_tt[,2] ,ylim=y_lim, type='b', pch=4, col='black', ylab='Error (%)', xlab='Sink Speed (m/s) ', xaxt="n")
axis(1, at=x, labels=c("2","3","4","5","6"), las=1)
legend("topright", legend=c("Data-Aware Drop", "Random Packet Drop"), lty=1, col=c("black","red", "blue", "green", "gray"), bty="n", pch=c(4,5,6))

#matplot(x, type = "n", ylab='Erro', xlab='% dos dados', xlim = y_lim, axes = FALSE)
matpoints(, sc_tt[,2],  pch = 4, col = 1, cex=1.2)
arrows(x, sc_tt[,1], x, sc_tt[,3], length = .05, angle = 90, code = 3) 
segments(x, sc_tt[,1], x, sc_tt[,3])
lines(1:length(x), sc_tt[,1], lty = i, lwd = 1.5) 

points(x, dr_tt[,2], type='b', pch=5, col='red')
points(x, dr_tt[,1], type='p', pch="-", col='red')
points(x, dr_tt[,3], type='p', pch="-", col='red')
segments(x, dr_tt[,1], x, dr_tt[,3], col='red')

dev.off()

