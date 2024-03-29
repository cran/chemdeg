% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nls_indicators.R
\name{goodness_of_fit}
\alias{goodness_of_fit}
\title{Goodness-of-fit, non-linear regression}
\usage{
goodness_of_fit(fit)
}
\arguments{
\item{fit}{a \code{nls}, \code{lm} or ord_res object}
}
\value{
It returns a table with the values of AIC, AICc, BIC, RSME and
reduced Chi squared. Single goodness-of-fit measures can  be obtained as
follows:
\enumerate{
\item call standard R functions \code{\link[stats:AIC]{stats::AIC()}}, \code{\link[stats:AIC]{stats::BIC()}},
\code{\link[stats:sigma]{stats::sigma()}} for AIC, BIC and RMSE, respectively;
\item call \code{chemdeg} functions \code{\link[=AICC]{AICC()}} and \code{\link[=chiquad_red]{chiquad_red()}} for AICc and
reduced chi-squared, respectively.
}
}
\description{
Function that returns the following goodness-of-fit statistics for
non-linear regression: AIC, AICc, BIC, RMSE and reduced Chi-squared.
}
\details{
The function returns the values of AIC, AICC, BIC, RMSE and reduced
chi-squared (\eqn{\chi^2_{red}}) for \code{nls} objects. If a linear model
object is passed, the function returns its \link[stats:summary.lm]{summary}.

Given an \code{ord_res} object (output of the function \code{\link[=det_order]{det_order()}}),
the function returns one of the results
above depending on the model chosen to explain the data.

Because the \code{\link[=chiquad_red]{chiquad_red()}} function returns the value only with weighted
data, the \eqn{\chi^2_{red}} will be returned only with weighted
regressions.
}
\examples{
x <- c(1, 2, 3, 4, 5)
y <- c(1.2, 3.9, 8.6, 17.4, 26)
er <- c(0.5, 0.8, 0.5, 1.9, 1.2)
fit1 <- nls(y ~ k * x^2,
  data = list(x = x, y = y), start = list(k = 1),
  weights = 1 / er^2
)
goodness_of_fit(fit1)
}
\seealso{
\code{\link[stats:AIC]{stats::AIC()}}, \code{\link[=AICC]{AICC()}}, \code{\link[stats:AIC]{stats::BIC()}}, \code{\link[stats:sigma]{stats::sigma()}},
\code{\link[=chiquad_red]{chiquad_red()}}
}
