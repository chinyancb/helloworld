\name{simpleLm}
\alias{simpleLm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
simpleLm package
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
simpleLm(dataset, target, family, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
%%  ~~ If necessary, more details than the description above ~~
\item{dataset}{object name of dataset for simple linear regression.}
\item{target}{objective variable on dataset for simple linear regression.}
\item{family}{a description of the error distribution and link function to be used in the model. default "binomial"}

}
\value{
\item{cf.name}{the name of variable used simple linear regression.}
\item{cf.est}{the estimated coefficients value.}
\item{cf.stderr}{the stderr of estimated coefficients value.}
\item{cf.zvalue}{the standardization estimated coefficients value.}
\item{cf.pr}{the p-value of estimated coefficients value.}

%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

# for example, you have the dataset(data.frame) following,
> head(test_df)
  Sepal.Length Sepal.Width Petal.Length Petal.Width target
1          7.0         3.2          4.7         1.4      0
2          6.4         3.2          4.5         1.5      1
3          6.9         3.1          4.9         1.5      0
4          5.5         2.3          4.0         1.3      0
5          6.5         2.8          4.6         1.5      1

# you can ...
simpleLm(dataset = test_df, target = 'target')
}
