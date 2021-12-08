## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  fig.width = 8,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(bRacatus)

## ---- eval = FALSE------------------------------------------------------------
#  install.packages ("bRacatus")
#  library (bRacatus)

## ---- eval = FALSE------------------------------------------------------------
#  pts <- getOcc ("Babiana tubulosa")
#  head (pts)[,c(1:4)]

## ---- echo = FALSE------------------------------------------------------------
data (pts)
head (pts)[,c(1:4)]

## -----------------------------------------------------------------------------
plotOcc (pts)

## ---- warning = FALSE---------------------------------------------------------
ref_reg <- giftRegions ("Babiana tubulosa")
ref_reg

## -----------------------------------------------------------------------------
plotRefReg (ref_reg)

## ---- eval = FALSE------------------------------------------------------------
#  signals <- signalCalculation (ref_reg,pts,biogeo = TRUE)

## ---- echo = FALSE------------------------------------------------------------
data(signals)

## -----------------------------------------------------------------------------
acc <- accuracy (signals)

## -----------------------------------------------------------------------------
biogeo <- biogeoStatus (signals)

## -----------------------------------------------------------------------------
plotAccuracy (acc)

## -----------------------------------------------------------------------------
plotBiogeoStatus (biogeo)

## ----  eval = FALSE-----------------------------------------------------------
#  pts2 <- getOcc ("Phalanger orientalis")   # Running time: ≈ 1s.

## ---- echo = FALSE------------------------------------------------------------
data (pts2)

## -----------------------------------------------------------------------------
pts2 <- data.frame(species=pts2$species,
                     decimalLongitude=pts2$decimalLongitude,
                     decimalLatitude=pts2$decimalLatitude,
                     origin="GBIF")       # Running time: < 1s.

extra_points <- data.frame(species="Phalanger orientalis",
                           decimalLongitude=c(125.257,112.765,110.632,112.192,121.130,
                                              142.607,126.877,164.761,109.036),
                           decimalLatitude=c(8.261,2.396,-1.518,-7.821,-20.655,-13.639,
                                             -17.904,-20.671,12.938),
                           origin="Simulated")     # Running time: < 1s.

pts3 <- rbind(pts2,extra_points)     # Running time: < 1s.

plotOcc (pts3)  # Running time: < 1s.

## ---- warning = FALSE---------------------------------------------------------
ref_reg <- Range_Phalanger_orientalis
range_map_ref_reg <- rangeMaps(ref_reg)  # Running time: < 1s.
plotRefReg (range_map_ref_reg)  # Running time: < 1s.

## ---- eval = FALSE------------------------------------------------------------
#  signals_3 <- signalCalculation (range_map_ref_reg,pts3,biogeo = TRUE)   # Running time: ≈ 40s.

## ---- echo = FALSE------------------------------------------------------------
data(signals_3)

## -----------------------------------------------------------------------------
acc <- accuracy (signals_3)   # Running time: < 1s.
biogeo <- biogeoStatus (signals_3)   # Running time: < 1s.

## -----------------------------------------------------------------------------
plotAccuracy (acc, regional=T, reg.by="points", borders=F, col.features="gray80", col.bg="white", plot.range=T, range=Range_Phalanger_orientalis, box=T)   # Running time: < 1s.

## -----------------------------------------------------------------------------
plotBiogeoStatus (biogeo, regional=T, reg.by="points", borders=F, col.features="gray80", col.bg="white", plot.range=T, range=Range_Phalanger_orientalis, box=T)   # Running time: < 1s.

