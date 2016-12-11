covariates <- read.csv("All_Covariates.txt")

(range(covariates$lon))
(range(covariates$lat))

extractMatrix <- function(data, lon, lat){
  covariate <- matrix(NA, nrow = length(unique(lat)), ncol = length(unique(lon)))
  for (rowId in 1:length(data)) {
    covariate[match(lat[rowId], unique(lat)),
              match(lon[rowId], unique(lon))] = data[rowId]
  }
  covariate
}

image.map <- function(mat, col) {
  mat <- apply(mat, 2, rev)
  image(t(mat), col = col)
}


attach(covariates)
names(covariates)

thickness <- extractMatrix(Thick, lon, lat)
image.map(thickness, col = gray((0:32)/32))

dist_bdry <- extractMatrix(NEAR_DIST, lon, lat)
dim(dist_bdry)
image.map(dist_bdry, col = gray((0:32)/32))

 <- extractMatrix(, lon, lat)
image.map(dist_bdry, col = gray((0:32)/32))
