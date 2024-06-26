## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(chemdeg)

## -----------------------------------------------------------------------------
ord1 # simulated data from a first order kinetic model with error
res <- det_order(ord1)

class(res)

## -----------------------------------------------------------------------------
results(res)

## -----------------------------------------------------------------------------
plot_ord(res)

## -----------------------------------------------------------------------------
linear_model_phase_space <- phase_space(res)
linear_model_phase_space

kinetic_regression <- kin_regr(res)
kinetic_regression

## -----------------------------------------------------------------------------
chiquad_red(kinetic_regression)
AICC(kinetic_regression)

## -----------------------------------------------------------------------------
goodness_of_fit(kinetic_regression)

## -----------------------------------------------------------------------------
f_gen(1)

f_gen(2)

## -----------------------------------------------------------------------------
dat <- data.frame(
  time = c(0, 1, 2, 3, 4, 5),
  conc = c(1, 0.99, 0.98, 0.5, 0.24, 0.12)
)

try(FOMT(dat))
nls(conc ~ FOMTm(time, k, n),
  data = list(
    conc = dat$conc,
    time = dat$time
  ),
  start = list(k = 1, n = 12)
)

## -----------------------------------------------------------------------------
urfa

## -----------------------------------------------------------------------------
try(det_order(urfa))

urfa1 <- data.frame(urfa$time_min, urfa$AA_55)
ord.urfa.1 <- det_order(urfa1)

## -----------------------------------------------------------------------------
results(ord.urfa.1)

## -----------------------------------------------------------------------------
plot_ord(ord.urfa.1)

## -----------------------------------------------------------------------------
fomtdata

## -----------------------------------------------------------------------------
ord.cqa <- det_order(fomtdata)

## -----------------------------------------------------------------------------
results(ord.cqa)

## ----fig.show='hold'----------------------------------------------------------
plot_ord(ord.cqa)

## -----------------------------------------------------------------------------
lin <- kin_regr(ord.cqa)
summary(lin)

## -----------------------------------------------------------------------------
FOMT(fomtdata)

## -----------------------------------------------------------------------------
regr.FOMT <- nls(y ~ FOMTm(t, k, n),
  data = list(y = fomtdata$tCQA_AA, t = fomtdata$time_h),
  start = list(n = 10, k = 0.05)
)
summary(regr.FOMT)

## -----------------------------------------------------------------------------
plot(fomtdata$time_h, fomtdata$tCQA_AA,
  xlab = "time (h)", ylab = "C/C0"
)
new_t <- seq(0, max(fomtdata$time_h), length.out = 100)
lines(new_t, predict(regr.FOMT, newdata = list(t = new_t)))
lines(fomtdata$time_h, predict(lin), col = "red")

## -----------------------------------------------------------------------------
goodness_of_fit(regr.FOMT)

