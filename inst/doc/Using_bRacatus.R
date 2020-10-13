## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  fig.width = 8,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(bRacatus)

## ---- eval = FALSE------------------------------------------------------------
#  install.packages ("devtools")
#  library (devtools)
#  devtools::install_github ("EduardoArle/bRacatus")
#  library (bRacatus)

## ---- eval = FALSE------------------------------------------------------------
#  install.packages ("bRacatus")
#  library (bRacatus)

## -----------------------------------------------------------------------------
pts <- getOcc ("Babiana tubulosa")
head(pts)[,c(1:4)]

## -----------------------------------------------------------------------------
plotOcc (pts)

## ---- warning = FALSE---------------------------------------------------------
ref_reg <- giftRegions ("Babiana tubulosa")
ref_reg

## -----------------------------------------------------------------------------
plotRefReg (ref_reg)

## ---- warning = FALSE---------------------------------------------------------
ref_reg_rast <- rasteriseChecklists (ref_reg)

## -----------------------------------------------------------------------------
occ_ID <- occID (pts)

## -----------------------------------------------------------------------------
ref_reg_ID <- valueID (ref_reg_rast)

## ---- eval = FALSE------------------------------------------------------------
#  signals <- signalCalculation (ref_reg_ID,occ_ID,biogeo = TRUE)

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

## -----------------------------------------------------------------------------
pts <- getOcc ("Senna bicapsularis")   # Running time: ≈ 7s.
plotOcc (pts)  # Running time: < 1s.

## ---- warning = FALSE---------------------------------------------------------
ref_reg <- giftRegions ("Senna bicapsularis")   # Running time: ≈ 120s.
plotRefReg (ref_reg)  # Running time: ≈ 2s.

## ---- warning = FALSE---------------------------------------------------------
ref_reg_rast <- rasteriseChecklists (ref_reg)   # Running time: ≈ 40s.
occ_ID <- occID (pts)   # Running time: < 1s.
ref_reg_ID <- valueID (ref_reg_rast)   # Running time: < 1s.

## ---- eval = FALSE------------------------------------------------------------
#  signals_2 <- signalCalculation (ref_reg_ID,occ_ID,biogeo = TRUE)   # Running time: ≈ 18s.

## ---- echo = FALSE------------------------------------------------------------
data(signals_2)

## -----------------------------------------------------------------------------
acc <- accuracy (signals_2)   # Running time: < 1s.
biogeo <- biogeoStatus (signals_2)   # Running time: < 1s.

## -----------------------------------------------------------------------------
plotAccuracy (acc)   # Running time: < 1s.

## -----------------------------------------------------------------------------
plotBiogeoStatus (biogeo)   # Running time: < 1s.

## -----------------------------------------------------------------------------
pts <- getOcc ("Phalanger orientalis")   # Running time: ≈ 1s.

## -----------------------------------------------------------------------------
pts2 <- data.frame(species=pts$species,
                       decimalLongitude=pts$decimalLongitude,
                       decimalLatitude=pts$decimalLatitude,
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

## -----------------------------------------------------------------------------
ref_reg_rast <- rasteriseChecklists (range_map_ref_reg) # Running time: ≈ 10s.
occ_ID <- occID (pts3)   # Running time: < 1s.
ref_reg_ID <- valueID (ref_reg_rast)   # Running time: < 1s.

## ---- eval = FALSE------------------------------------------------------------
#  signals_3 <- signalCalculation (ref_reg_ID,occ_ID,biogeo = TRUE)   # Running time: ≈ 3s.

## -----------------------------------------------------------------------------
data(signals_3)

## -----------------------------------------------------------------------------
acc <- accuracy (signals_3)   # Running time: < 1s.
biogeo <- biogeoStatus (signals_3)   # Running time: < 1s.

## -----------------------------------------------------------------------------
plotAccuracy (acc, regional=T, reg.by="points", borders=F, col.features="gray80", col.bg="white", plot.range=T, range=Range_Phalanger_orientalis, box=T)   # Running time: < 1s.

## -----------------------------------------------------------------------------
plotBiogeoStatus (biogeo, regional=T, reg.by="points", borders=F, col.features="gray80", col.bg="white", plot.range=T, range=Range_Phalanger_orientalis, box=T)   # Running time: < 1s.

