\name{mcse.q}
\alias{mcse.q}
\title{Compute Monte Carlo standard errors for quantiles.}
\usage{
  mcse.q(x, q, size = "sqroot", g = NULL,
    method = c("bm", "obm", "sub"), warn = FALSE)
}
\arguments{
  \item{x}{a vector of values from a Markov chain.}

  \item{q}{the quantile of interest.}

  \item{size}{the batch size. The default value is
  \dQuote{\code{sqroot}}, which uses the square root of the
  sample size. A numeric value may be provided if
  \dQuote{\code{sqroot}} is not satisfactory.}

  \item{g}{a function such that the \eqn{q}th quantile of
  the univariate distribution function of \eqn{g(x)} is the
  quantity of interest. The default is \code{NULL}, which
  causes the identity function to be used.}

  \item{method}{the method used to compute the standard
  error. This is one of \dQuote{\code{bm}} (batch means,
  the default), \dQuote{\code{obm}} (overlapping batch
  means), or \dQuote{\code{sub}} (subsampling bootstrap).}

  \item{warn}{a logical value indicating whether the
  function should issue a warning if the sample size is too
  small (less than 1,000).}
}
\value{
  \code{mcse.q} returns a list with two elements:
  \item{est}{an estimate of the \eqn{q}th quantile of the
  univariate distribution function of \eqn{g(x)}.}
  \item{se}{the Monte Carlo standard error.}
}
\description{
  Compute Monte Carlo standard errors for quantiles.
}
\examples{
# Create 10,000 iterations of an AR(1) Markov chain with rho = 0.9.

n = 10000
x = double(n)
x[1] = 2
for (i in 1:(n - 1))
    x[i + 1] = 0.9 * x[i] + rnorm(1)

# Estimate the mean, 0.1 quantile, and 0.9 quantile with MCSEs using batch means.

mcse(x)
mcse.q(x, 0.1)
mcse.q(x, 0.9)

# Estimate the mean, 0.1 quantile, and 0.9 quantile with MCSEs using overlapping batch means.

mcse(x, method = "obm")
mcse.q(x, 0.1, method = "obm")
mcse.q(x, 0.9, method = "obm")

# Estimate E(x^2) with MCSE using spectral methods.

g = function(x) { x^2 }
mcse(x, g = g, method = "tukey")
}
\references{
  Flegal, J. M. (2012) Applicability of subsampling
  bootstrap methods in Markov chain Monte Carlo. In
  Wozniakowski, H. and Plaskota, L., editors, \emph{Monte
  Carlo and Quasi-Monte Carlo Methods 2010} (to appear).
  Springer-Verlag.

  Flegal, J. M. and Jones, G. L. (2010) Batch means and
  spectral variance estimators in Markov chain Monte Carlo.
  \emph{The Annals of Statistics}, \bold{38}, 1034--1070.

  Flegal, J. M. and Jones, G. L. (2011) Implementing Markov
  chain Monte Carlo: Estimating with confidence. In Brooks,
  S., Gelman, A., Jones, G. L., and Meng, X., editors,
  \emph{Handbook of Markov Chain Monte Carlo}, pages
  175--197. Chapman & Hall/CRC Press.

  Flegal, J. M., Jones, G. L., and Neath, R. (2012) Markov
  chain Monte Carlo estimation of quantiles.
  \emph{University of California, Riverside, Technical
  Report}.

  Jones, G. L., Haran, M., Caffo, B. S. and Neath, R.
  (2006) Fixed-width output analysis for Markov chain Monte
  Carlo. \emph{Journal of the American Statistical
  Association}, \bold{101}, 1537--1547.
}
\seealso{
  \code{\link{mcse.q.mat}}, which applies \code{mcse.q} to
  each column of a matrix or data frame.

  \code{\link{mcse}} and \code{\link{mcse.mat}}, which
  compute standard errors for expectations.
}

