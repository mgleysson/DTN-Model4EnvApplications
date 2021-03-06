library(geoR)

#Reconstrucao por kriging simples
simpleKriging <- function(geoData, file='new', covModel='matern', fieldDimensions = 100)
{
        if(missing(geoData)) stop('Missing geodata')
        locs <- pred_grid(c(0,(fieldDimensions-1)), c(0,(fieldDimensions-1)), by=1)
	      ml <- likfit(geoData, ini=c(20,10), cov.model="matern",fix.kappa=FALSE,kappa=2,nugget=0,fix.nugget=TRUE)
        KC <- krige.control(type='sk', obj.mod=ml)
        sk <- krige.conv(geoData, krige=KC, loc=locs)
        
        saida = list()
        saida$kappa = ml$kappa
        saida$phi = ml$phi
        saida$predict = sk$predict
        return(saida)
}

# Medida de avaliação de erro
erro <- function(predict,campo, fieldDimensions = 100)
{
	erro = 0
	for(i in 1:fieldDimensions)
		for(j in 1:fieldDimensions)
		{
			erro = erro + abs((campo[i,j] - predict[i,j])/ campo[i,j])
		}
	erro = (erro / (fieldDimensions^2))
	return(erro)
}


